namespace WebChatIndentityServer4s.Models
{
    public class ThongbaoDTO
    {
        public string? message { get; set; }
        public DateTime? Timestamp { get; set; }
        public string? account {  get; set; }
        public bool? Active { get; set; }
        public int room { get; set; }
    }
}
