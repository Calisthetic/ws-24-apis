using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Session5.Models.Db;
using Session5.Models.Outcoming;
using Swashbuckle.AspNetCore.Annotations;

namespace Session5.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class WarehousesController : ControllerBase
    {
        private readonly Ws24session5Context _context;

        public WarehousesController(Ws24session5Context context)
        {
            _context = context;
        }

        /// <summary>
        /// GET all warehouses
        /// </summary>
        /// <returns>A list of warehouses</returns>
        [HttpGet]
        [ProducesResponseType(typeof(IEnumerable<WarehouseDto>), StatusCodes.Status200OK)]
        [SwaggerOperation(
        Summary = "Получить информацию о всех складских помещениях",
        Description = "Returns the details of warehouses",
        OperationId = "GetWarehouses")]
        public async Task<ActionResult<IEnumerable<WarehouseDto>>> GetWarehouses()
        {
          if (_context.Warehouses == null)
          {
              return NotFound();
          }
            return await _context.Warehouses.Select(x => new WarehouseDto(x)).ToListAsync();
        }
    }
}
