using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using System.Text.RegularExpressions;
using WebChatIndentityServer4s.Data;
using WebChatIndentityServer4s.Data.Entity;
using WebChatIndentityServer4s.Hubs;
using WebChatIndentityServer4s.Models;

namespace WebChatIndentityServer4s.Controllers
{
    [Route("api/Messages")]
    [ApiController]
    public class MessageController : ControllerBase
    {
        private readonly ManageAppDbContext _context;
        private readonly IMapper _mapper;
        private readonly IHubContext<ChatHub> _hubContext;

        public MessageController(ManageAppDbContext context, IMapper mapper, IHubContext<ChatHub> hubContext)
        {
            _context = context;
            _mapper = mapper;
            _hubContext = hubContext;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Room>> Get(int id)
        {
            var message = await _context.Messages.FindAsync(id);
            if (message == null)
                return NotFound();

            var data = _mapper.Map<Message, MessageViewModel>(message);

            return Ok(data);
        }

        [HttpGet("Room/{roomName}")]
        public IActionResult getMessage(string roomName)
        {
            var room = _context.Rooms.FirstOrDefault(x => x.Name == roomName);
            if(room == null)
                return BadRequest();

            // Lấy ra tin nhắn ở trong room name được chuyền lên
            var message = _context.Messages.Where(m => m.ToRoomId == room.Id).Include(m => m.FromUser).Include(m => m.ToRoom)
                .OrderByDescending(m => m.Timestamp)
                .Take(20)
                .AsEnumerable()
                .Reverse()
                .ToList();

            var messViewModel = _mapper.Map<IEnumerable<Message>, IEnumerable<MessageViewModel>>(message);

            return Ok(messViewModel);

        }

        // Tạo Message
        [HttpPost]
        public async Task<ActionResult<Message>> Create(MessageViewModel messageViewModel)
        {
            var user = _context.Users.FirstOrDefault(x => x.UserName == User.Identity.Name); // Lấy ra User đang đăng nhập
            var room = _context.Rooms.FirstOrDefault(x => x.Name == messageViewModel.Room); // Lấy ra room đang ở

            if(room == null)
                return BadRequest();

            var msg = new Message()
            {
                Content = Regex.Replace(messageViewModel.Content, @"<.*?>", string.Empty), // Sử dụng "Regex.Replace" để map "messageViewModel.Content" này với các ký tự "@"<.*?>"" này nếu không map được thì sẽ trả về "string.Empty"(rỗng), trong "messageViewModel.Content" này có thể có ảnh hoặc đoạn HTML hoặc là văn bản
                FromUser = user,
                ToRoom = room,
                Timestamp = DateTime.Now
            };

            _context.Messages.Add(msg);
            await _context.SaveChangesAsync();

            // Broadcast the message
            var createMessage = _mapper.Map<Message, MessageViewModel>(msg);
            await _hubContext.Clients.Group(room.Name).SendAsync("newMessage", createMessage); // "Clients.Group(room.Name)" nghĩa là gửi đến cho những người trong Group đấy biết

            return CreatedAtAction(nameof(Get), new {id = msg.Id}, createMessage);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var message = await _context.Messages
                .Include(u => u.FromUser)
                .Where(x => x.Id == id && x.FromUser.UserName == User.Identity.Name)
                .FirstOrDefaultAsync();

            if(message == null)
                return NotFound();

            _context.Messages.Remove(message);
            await _context.SaveChangesAsync();

            return NoContent();

        }
    }
}
