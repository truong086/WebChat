using System.ComponentModel.DataAnnotations;

namespace WebChatIndentityServer4s.Models
{
    public class UploadViewModel
    {
        [Required]
        public int RoomId { get; set; }
        [Required]
        public IFormFile File { get; set; } 
        
    }
}
