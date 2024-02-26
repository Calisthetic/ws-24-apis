using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Session5.Models.Db;
using Session5.Models.Outcoming;
using Swashbuckle.AspNetCore.Annotations;

namespace Session5.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class IssueRequestsController : ControllerBase
    {
        private readonly Ws24session5Context _context;

        public IssueRequestsController(Ws24session5Context context)
        {
            _context = context;
        }

        /// <summary>
        /// Get all medicine issue requests
        /// </summary>
        /// <returns>A list of medicine issue requests</returns>
        /// <response code="404">Medicine issue requests didn't found</response>
        /// <response code="200">Returns the details of the issue requests</response>
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(string))]
        [ProducesResponseType(typeof(IEnumerable<WarehouseDto>), StatusCodes.Status200OK)]
        [SwaggerOperation(
        Summary = "Получить запросы на выдачу лекарств",
        Description = "Returns the details of issue requests",
        OperationId = "GetIssueRequests")]
        public async Task<ActionResult<IEnumerable<IssueRequestDto>>> GetIssueRequests()
        {
            if (_context.IssueRequests == null)
            {
                return NotFound();
            }
            return await _context.IssueRequests.Include(x => x.Medicine).ThenInclude(x => x.Warehouse)
                .Include(x => x.Medicine).ThenInclude(x => x.Provider).Select(x => new IssueRequestDto(x)).ToListAsync();
        }

        /// <summary>
        /// Get medicine issue request by id
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Required medicine issue request item</returns>
        /// <response code="404">Medicine issue request didn't found</response>
        /// <response code="200">Returns the details of the issue request</response>
        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(string))]
        [ProducesResponseType(typeof(IEnumerable<IssueRequestDto>), StatusCodes.Status200OK)]
        [SwaggerOperation(
        Summary = "Получить определённый запрос на выдачу лекарств",
        Description = "Returns the details of the issue request",
        OperationId = "GetIssueRequestById")]
        public async Task<ActionResult<IssueRequestDto>> GetIssueRequestById(int id)
        {
            if (_context.IssueRequests == null)
            {
                return NotFound();
            }
            var issueRequest = await _context.IssueRequests.Include(x => x.Medicine).ThenInclude(x => x.Warehouse)
                .Include(x => x.Medicine).ThenInclude(x => x.Provider).FirstOrDefaultAsync(x => x.Id == id);

            if (issueRequest == null)
            {
                return NotFound();
            }

            return new IssueRequestDto(issueRequest);
        }

        /// <summary>
        /// Complete medicine issue request
        /// </summary>
        /// <param name="id"></param>
        /// <response code="404">Medicine issue request didn't found</response>
        /// <response code="400">Already completed request</response>
        /// <response code="400">Not enough medicine</response>
        /// <response code="204">Completed successfully</response>
        [HttpPut("{id}/Complete")]
        [ProducesResponseType(StatusCodes.Status404NotFound, Type = typeof(string))]
        [ProducesResponseType(StatusCodes.Status400BadRequest, Type = typeof(string))]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [SwaggerOperation(
        Summary = "Выполнить запрос на выдачу лекарств",
        Description = "Returns no content so medicine issue request completed",
        OperationId = "PutIssueRequestByIdComplete")]
        public async Task<IActionResult> PutIssueRequestByIdComplete(int id)
        {
            var item = await _context.IssueRequests.Include(x => x.Medicine).FirstOrDefaultAsync(x => x.Id == id);
            if (item == null)
                return NotFound("Препарат с текущим значением Id не найден");
            if (item.Completed)
                return BadRequest("Заявка на выдачу уже выполнена");
            if (item.Quantity > item.Medicine.Quantity)
                return BadRequest($"Невозможно выполнить заявку прямо сейчас, так как не хватает препарата с Id={id} (запрашивается {item.Quantity} шт., а в наличии только {item.Medicine.Quantity} шт.)");

            item.Completed = true;
            item.Medicine.Quantity -= item.Quantity;
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
