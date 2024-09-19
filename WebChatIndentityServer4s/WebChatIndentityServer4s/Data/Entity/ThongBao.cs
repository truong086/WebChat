using System.ComponentModel.DataAnnotations;

namespace WebChatIndentityServer4s.Data.Entity
{
    public class ThongBao
    {
        [Key]
        public int Id { get; set; }
        public string? message { get; set; }
        public ManageUser? User { get; set; }
        public Room? Rooms { get; set; }
        public bool? Active { get; set; }
        public DateTime? Timestamp { get; set; } // Thời gian tạo thông báo
    }
}
