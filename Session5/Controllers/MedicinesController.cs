using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Session5.Models.Db;
using Session5.Models.Incoming;
using Session5.Models.Outcoming;
using Swashbuckle.AspNetCore.Annotations;

namespace Session5.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MedicinesController : ControllerBase
    {
        private readonly Ws24session5Context _context;

        public MedicinesController(Ws24session5Context context)
        {
            _context = context;
        }

        /// <summary>
        /// Retrieves medicines details by warehouse id
        /// </summary>
        /// <param name="WarehouseId"></param>
        /// <returns>Details of medicines by warehouse id</returns>
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(string))]
        [ProducesResponseType(typeof(IEnumerable<MedicineWithoutWirehouseDto>), StatusCodes.Status200OK)]
        [SwaggerOperation(
        Summary = "Получить лекарства с определённого склада",
        Description = "Returns the details of medicines by warehouse id",
        OperationId = "GetMedicinesByWarehouseId")]
        public async Task<ActionResult<IEnumerable<MedicineWithoutWirehouseDto>>> GetMedicinesByWarehouseId(int WarehouseId)
        {
            if (_context.Medicines == null)
            {
                return NotFound();
            }
            return await _context.Medicines.Where(x => x.WarehouseId == WarehouseId).Select(x => new MedicineWithoutWirehouseDto(x)).ToListAsync();
        }

        /// <summary>
        /// Retrieves running out medicines details
        /// </summary>
        /// <returns>Details of running out medicines</returns>
        [HttpGet("RunningOut")]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(string))]
        [ProducesResponseType(typeof(IEnumerable<MedicineDto>), StatusCodes.Status200OK)]
        [SwaggerOperation(
        Summary = "Получить лекарства, количество которых близко к нулю",
        Description = "Returns the details of running out medicines",
        OperationId = "GetMedicinesRunningOut")]
        public async Task<ActionResult<IEnumerable<MedicineDto>>> GetMedicinesRunningOut()
        {
            if (_context.Medicines == null)
            {
                return NotFound();
            }
            return await _context.Medicines.Where(x => x.Quantity < 10).Select(x => new MedicineDto(x)).ToListAsync();
        }

        /// <summary>
        /// Invoice medicines from provider
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Medicines invoiced result</returns>
        /// <response code="400">Bad request</response>
        /// <response code="500">Internal server error</response>
        /// <response code="200">Medicines invoiced</response>
        [HttpPost("Invoice")]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(string))]
        [ProducesResponseType(StatusCodes.Status400BadRequest, Type = typeof(string))]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [SwaggerOperation(
        Summary = "Пополнить количество препаратов",
        Description = "Returns the details of the issue request",
        OperationId = "PostMedicineInvoice")]
        public async Task<ActionResult> PostMedicineInvoice(MedicineInvoiceRequestDto request)
        {
            if (_context.Medicines == null)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Entity set 'Ws24session5Context.Medicines' is null.");
            }

            if (!DateTime.TryParse(request.DocumentDate, out DateTime documentDate))
                return BadRequest("Wrong document date format");

            var currentProvider = await _context.Providers.FirstOrDefaultAsync(x => x.Name.ToLower().Equals(request.Provider.ToLower()));
            if (currentProvider == null)
            {
                currentProvider = new Provider() { Name = request.Provider };
                await _context.Providers.AddAsync(currentProvider);
            }
            if (request.Medicines.Count == 0)
                return BadRequest("No medicines");

            for (int i = 0; i < request.Medicines.Count; i++)
            {
                if (!DateTime.TryParse(request.Medicines[i].ExpirationDate, out DateTime itemExpirationTime))
                    return BadRequest("Wrong expiration date");
                if (itemExpirationTime <= DateTime.Now)
                    return BadRequest("Невозможно принять счет, так как в списке встречаются просроченные препараты");

                var currentMedicine = await _context.Medicines.FirstOrDefaultAsync(x => x.Id == request.Medicines[i].Id);
                if (currentMedicine == null)
                    return BadRequest("Медицинский препарат с указанным ID не найден");

                currentMedicine.Quantity += request.Medicines[i].Quantity;
                currentMedicine.ExpirationDate = itemExpirationTime;
            }

            await _context.SaveChangesAsync();

            return Ok();
        }

        /// <summary>
        /// Write off medicine
        /// </summary>
        /// <param name="request"></param>
        /// <returns>Medicine has been written off result</returns>
        /// <response code="200">Medicine has been written off</response>
        /// <response code="400">Wrong data format</response>
        /// <response code="404">Wrong medicine id</response>
        /// <response code="500">Internal server error</response>
        [HttpPost("Writeoff")]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(string))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(string))]
        [ProducesResponseType(StatusCodes.Status400BadRequest, Type = typeof(string))]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [SwaggerOperation(
        Summary = "Списать количество препарата",
        Description = "Medicine has been written off",
        OperationId = "PostMedicineWriteOff")]
        public async Task<ActionResult> PostMedicineWriteOff(MedicineWriteOffDto request)
        {
            if (_context.Medicines == null)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Entity set 'Ws24session5Context.Medicines' is null.");
            }

            var currentMedicine = await _context.Medicines.FirstOrDefaultAsync(x => x.Id == request.MedicineId);
            if (currentMedicine == null)
                return NotFound("Медицинский препарат с указанным ID не найден");
            if (request.Quantity < 0 || request.Quantity > 1000000)
                return BadRequest("Нет смысла делать списание отрицательного/нулевого количества");
            if (currentMedicine.Quantity < request.Quantity)
                return BadRequest("На остатке меньшее количество, чем вы пытаетесь списать");
            if (string.IsNullOrWhiteSpace(request.Reason))
                return BadRequest("Причина обязательна для фиксации факта списания");

            var newWriteOff = new MedicineWriteoff()
            {
                MedicineId = request.MedicineId,
                Quantity = request.Quantity,
                Reason = request.Reason
            };
            await _context.MedicineWriteoffs.AddAsync(newWriteOff);
            currentMedicine.Quantity -= request.Quantity;
            await _context.SaveChangesAsync();

            return Ok();
        }

        /// <summary>
        /// Transfer medicine
        /// </summary>
        /// <param name="medicineId"></param>
        /// <param name="destinationWarehouseId"></param>
        /// <returns></returns>
        /// <response code="200">Medicine has been transfered</response>
        /// <response code="400">Wrong data format</response>
        /// <response code="404">Wrong warehouse id</response>
        /// <response code="500">Internal server error</response>
        [HttpPost("{medicineId}/Transfer")]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(string))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError, Type = typeof(string))]
        [ProducesResponseType(StatusCodes.Status400BadRequest, Type = typeof(string))]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [SwaggerOperation(
        Summary = "Переместить лекарство на другой склад",
        Description = "Medicine transfered result",
        OperationId = "PostMedicineTransfer")]
        public async Task<ActionResult> PostMedicineTransfer([FromRoute]int medicineId, [FromQuery]int destinationWarehouseId)
        {
            if (_context.Medicines == null)
                return StatusCode(StatusCodes.Status500InternalServerError, "Entity set 'Ws24session5Context.Medicines' is null.");

            var currentMedicine = await _context.Medicines.FirstOrDefaultAsync(x => x.Id == medicineId);
            if (currentMedicine == null)
                return NotFound("Препарат с указанным Id не найден");
            if (currentMedicine.WarehouseId == destinationWarehouseId)
                return BadRequest("Склад назначения совпадает с текущим складом");

            var currentWarehouse = await _context.Warehouses.FirstOrDefaultAsync(x => x.Id == destinationWarehouseId);
            if (currentWarehouse == null)
                return NotFound("Склад назначения с указанным Id не найден");

            currentMedicine.WarehouseId = destinationWarehouseId;
            await _context.SaveChangesAsync();

            return Ok();
        }
    }
}
