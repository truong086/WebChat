namespace WebChatIndentityServer4s.Models
{
    public class ApiNotFoundResponse : ApiResponse
    {
        public ApiNotFoundResponse(string message = null) : base(400, message)
        {
        }
    }
}
