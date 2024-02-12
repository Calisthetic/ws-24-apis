using Microsoft.AspNetCore.Mvc;

namespace Session2p1.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PersonLocationsController : ControllerBase
    {
        private readonly int _skudCount = 23;

        [HttpGet("{count}")]
        public async Task<ActionResult<List<PersonLocation>>> GetLocations(int count)
        {
            if (count > 100)
                return BadRequest(new { message = "Count is too big" });
            else if (count < 4)
                return BadRequest(new { message = "Count is too small" });

            //return Enumerable.Range(1, 5).Select(index => new WeatherForecast
            //{
            //    Date = DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
            //    TemperatureC = Random.Shared.Next(-20, 55),
            //    Summary = Summaries[Random.Shared.Next(Summaries.Length)]
            //})
            //.ToArray();

            await Task.Delay(2000);

            return Enumerable.Range(1, count).Select(index => new PersonLocation
            {
                PersonCode = index.ToString() + GetRandomString(5),
                PersonRole = Random.Shared.Next(2) == 0 ? "Клиент" : "Сотрудник",
                LastSecurityPointNumber = "СКУД#" + Random.Shared.Next(_skudCount).ToString(),
                LastSecurityPointDirection = Random.Shared.Next(2) == 0 ? "in" : "out",
                LastSecurityPointTime = DateTime.Now.AddDays(-1).AddHours(Random.Shared.Next(-24, 0)).AddMinutes(Random.Shared.Next(-60, 0))
            }).ToList();
        }

        private static string GetRandomString(int length)
        {
            var random = new Random();
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[Random.Shared.Next(s.Length)]).ToArray());
        }
    }
}
