using System.ComponentModel.DataAnnotations;
using System.Net;
using System.Text.Json;

namespace Session5.Middleware
{
    public class ExceptionHandingMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<ExceptionHandingMiddleware> _logger;

        public ExceptionHandingMiddleware(RequestDelegate next, ILogger<ExceptionHandingMiddleware> logger)
        {
            _next = next;
            _logger = logger;
        }

        public async Task InvokeAsync(HttpContext httpContext)
        {
            try
            {
                await _next(httpContext);
            }
            catch (ValidationException ex)
            {
                await HandleExceptionAsync(httpContext, ex, HttpStatusCode.BadRequest);
            }
            catch (Exception ex)
            {
                await HandleExceptionAsync(httpContext, ex, HttpStatusCode.InternalServerError);
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
