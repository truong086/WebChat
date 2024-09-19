using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using WebChatIndentityServer4s.Data;
using WebChatIndentityServer4s.Data.Entity;
using WebChatIndentityServer4s.Hubs;

namespace WebChatIndentityServer4s.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoomUserController : ControllerBase
    {
        private readonly ManageAppDbContext _context;
        private readonly IMapper _mapper;
        private readonly IHubContext<ChatHub> _hubContext; // "IHubContext" này sẽ kết nối đến "ChatHub.cs" của chúng ta

        public RoomUserController(ManageAppDbContext context, IMapper mapper, IHubContext<ChatHub> hubContext)
        {
            _context = context;
            _mapper = mapper;
            _hubContext = hubContext;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<RoomUser>>> FindAll(string idUser)
        {
            try
            {
                var checkRoomUser = _context.RoomUsers.Include(a => a.User).Include(r => r.Rooms).Where(x => x.User.Id == idUser && (x.Action == true || x.Action == null)).Select(x => new
                {
                    id = x.Id,
                    id_user = x.User.Id,
                    id_room = x.Rooms.Id,
                    room_name = x.Rooms.Name,
                    username = x.User.UserName,
                    action = x.Action
                }).AsNoTracking().ToList();

                if (checkRoomUser == null || !checkRoomUser.Any())
                {
                    return NotFound();
                }

                return Ok(checkRoomUser);

            }catch(Exception ex)
            {
                return NotFound();
            }
        }
    }
}
