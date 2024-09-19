namespace WebChatIndentityServer4s.Data.Entity
{
    public class Room
    {
        public int Id { get; set; } 
        public string? Name { get; set; }
        public ManageUser? Admin { get; set; }
        public ICollection<Message>? Messages { get; set; }
        public ICollection<ThongBao>? Thongbaos { get; set; }
        public ICollection<RoomUser>? RoomUsers { get; set; }
    }
}
