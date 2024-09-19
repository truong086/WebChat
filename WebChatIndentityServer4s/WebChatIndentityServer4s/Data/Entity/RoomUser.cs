using System.ComponentModel.DataAnnotations;

namespace WebChatIndentityServer4s.Data.Entity
{
    public class RoomUser
    {
        [Key]
        public int Id { get; set; }
        public Room? Rooms { get; set; }
        public ManageUser? User { get; set; }
        public bool? Action { get; set; }
        public DateTime? CreateAt { get; set; }
    }
}
