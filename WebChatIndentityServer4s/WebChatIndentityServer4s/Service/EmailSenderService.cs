using Microsoft.AspNetCore.Identity.UI.Services;

namespace WebChatIndentityServer4s.Service
{
    public class EmailSenderService : IEmailSender
    {
        public async Task SendEmailAsync(string email, string subject, string htmlMessage)
        {
        }
    }
}
