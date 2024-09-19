using System.ComponentModel.DataAnnotations;

namespace WebChatIndentityServer4s.Models
{
    public class RoomViewModel
    {
        public int Id { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} and at max {1} characters long.", MinimumLength = 5)]
        [RegularExpression(@"^\w+( \w+)*$", ErrorMessage = "Characters allowed: letters, number, and one space between words.")] // Kiểm tra và không cho phép các ký tự đặc biệt
        public string Name { get; set; }
    }
}
