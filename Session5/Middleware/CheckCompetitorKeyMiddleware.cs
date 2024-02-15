using System.Net;
using System.Text.Json;

namespace Session5.Middleware
{
    public class CheckCompetitorKeyMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<ExceptionHandingMiddleware> _logger;
        protected readonly IConfiguration _configuration;

        public CheckCompetitorKeyMiddleware(RequestDelegate next, ILogger<ExceptionHandingMiddleware> logger, IConfiguration configuration)
        {
            _next = next;
            _logger = logger;
            _configuration = configuration;
        }

        public async Task InvokeAsync(HttpContext httpContext)
        {
            try
            {
                if (httpContext.Request.Method != "GET")
                {
                    var value = httpContext.Request.Headers["CompetitorKey"];
                    if (value != _configuration.GetSection("CompetitorKey").Value)
                    {
                        throw new Exception("Wrong 'CompetitonKey' value", new Exception("Please check headers at your requests"));
                    }
                }
                await _next(httpContext);
            }
            catch (Exception ex)
            {
                await HandleExceptionAsync(httpContext, ex, HttpStatusCode.Unauthorized);
            }
        }

        private async Task HandleExceptionAsync(HttpContext context, Exception ex, HttpStatusCode httpStatusCode)
        {
            _logger.LogError(ex.InnerException?.Message ?? ex.Message);

            HttpResponse response = context.Response;

            response.ContentType = "application/json";
            response.StatusCode = (int)httpStatusCode;

            string result = JsonSerializer.Serialize(new
            {
                Message = ex.Message,
                InnerException = ex.InnerException?.Message,
            });

            await response.WriteAsync(result);
        }
    }
}
