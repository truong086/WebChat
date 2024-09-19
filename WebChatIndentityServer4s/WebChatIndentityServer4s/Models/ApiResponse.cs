using Newtonsoft.Json;

namespace WebChatIndentityServer4s.Models
{
    public class ApiResponse
    {
        public int StatusCode { get; } // Trả về trạng thái code là gì, vd 200, 400, 404,...
        [JsonProperty(NullValueHandling = NullValueHandling.Ignore)]
        public string Message { get; } // Message hiển thị lỗi

        public ApiResponse(int statusCode, string message = null)
        {
            StatusCode = statusCode;
            Message = message ?? GetDefaultMessageForStatusCode(statusCode);
        }

        private static string GetDefaultMessageForStatusCode(int statusCode)
        {
            // Nếu ta không chuyền message vào thì cứ theo mã lỗi chuyền vào thì nó có các message mặc định ở dưới
            switch (statusCode)
            {
                case 404:
                    return "Resource Not Found";
                case 500:
                    return "An unhandled error occurred";
                default:
                    return null;
            }
        }
    }
}
