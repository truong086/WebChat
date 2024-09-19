namespace WebChatIndentityServer4s.Data.Entity
{
    public class Message
    {
        public int Id { get; set; }
        public string? Content { get; set; }
        public DateTime? Timestamp { get; set; } // Thời gian chat
        public int ToRoomId {  get; set; }
        public Room? ToRoom { get; set; }
        public ManageUser? FromUser { get; set; }    
    }
}
