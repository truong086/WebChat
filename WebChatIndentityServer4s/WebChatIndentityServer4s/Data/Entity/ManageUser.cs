using Microsoft.AspNetCore.Identity;

namespace WebChatIndentityServer4s.Data.Entity
{
    public class ManageUser : IdentityUser
    {
        public string? FullName { get; set; }
        public string? Avatar { get; set; }
        //public string? DisPlayName { get; set; }
        //public DateTime BirthDay { get; set; }
        public ICollection<Room>? Rooms { get; set; }
        public ICollection<Message>? Messages { get; set; }
        public ICollection<ThongBao>? Thongbaos { get; set; }
        public ICollection<RoomUser>? RoomUsers { get; set; }
    }
}
