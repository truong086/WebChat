namespace WebChatIndentityServer4s.Models
{
    public class RoomUserDTO
    {
        public string? Id_User { get; set; }
        public int Id_Room { get; set; }

        public string? RoomName { get; set; }
        public string? UserName { get; set; }
    }
}
