using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using NuGet.Packaging.Signing;
using System.Security.Policy;
using WebChatIndentityServer4s.Data;
using WebChatIndentityServer4s.Data.Entity;
using WebChatIndentityServer4s.Hubs;
using WebChatIndentityServer4s.Models;

namespace WebChatIndentityServer4s.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ThongbaoController : ControllerBase
    {
        private readonly ManageAppDbContext _context;
        private readonly IMapper _mapper;
        private readonly IHubContext<ChatHub> _hubContext; // "IHubContext" này sẽ kết nối đến "ChatHub.cs" của chúng ta
        public ThongbaoController(ManageAppDbContext context, IMapper mapper, IHubContext<ChatHub> hubContext)
        {
            _context = context;
            _mapper = mapper;
            _hubContext = hubContext;
        }

        [HttpPost]
        public async Task<ActionResult<ThongbaoDTO>> Create(CreateThongBao thongbao)
        {
            try
            {
                var checkSccount = _context.Users.Where(x => x.Id == thongbao.Id_User).FirstOrDefault();
                var checkRoom = _context.Rooms.Where(x => x.Id == thongbao.Id_Room).FirstOrDefault();
                var checkRoomUser = _context.RoomUsers.Where(x => x.User == checkSccount && x.Rooms == checkRoom).FirstOrDefault();
                var checkThongBao = _context.Thongbaos.Where(x => x.User == checkSccount && x.Rooms == checkRoom).FirstOrDefault();

                if(checkSccount == null)
                {
                    return BadRequest();
                }


                if(checkRoom == null)
                {
                    return BadRequest();
                }

                if(checkRoomUser != null && checkRoomUser.Action == false)
                {
                    await _hubContext.Clients.All.SendAsync("Thongbao", string.Format($"Bạn đã bị Block khỏi room {checkRoom.Name}"));
                    return BadRequest(new ThongbaoDTO { message = $"Bạn đã bị Block khỏi room {checkRoom.Name}" });
                }

                if(checkRoomUser != null && (checkRoomUser.Action == true || checkRoomUser.Action == null))
                {
                    await _hubContext.Clients.All.SendAsync("Thongbao", string.Format("Bạn đã ở trong Room hoặc yêu cầu đang được sét duyệt"));
                    return Ok(new ThongbaoDTO { message = "Bạn đã ở trong Room hoặc yêu cầu đang được sét duyệt" });
                }


                if(checkRoomUser == null)
                {
                    if(checkThongBao != null)
                    {
                        await _hubContext.Clients.All.SendAsync("Thongbao", string.Format("Bạn đã ở trong Room hoặc yêu cầu đang được sét duyệt"));
                        return Ok(new ThongbaoDTO { message = "Bạn đã ở trong Room hoặc yêu cầu đang được sét duyệt" });
                    }
                    var data = new ThongBao()
                    {
                        message = checkSccount.UserName + " muốn tham gia vào room " + checkRoom.Name,
                        Rooms = checkRoom,
                        User = checkSccount,
                        Timestamp = DateTime.Now

                    };

                    _context.Thongbaos.Add(data);
                    if (await _context.SaveChangesAsync() > 0)
                    {
                        var mapDataDTO = _mapper.Map<ThongBao, ThongbaoDTO>(data);
                        mapDataDTO.room = data.Rooms.Id;
                        mapDataDTO.account = data.User.Id;
                        await _hubContext.Clients.All.SendAsync("Thongbao", "Gửi thành công");
                        return Ok(mapDataDTO);
                    }
                }

                
            }catch(Exception ex)
            {
                return BadRequest(new ThongbaoDTO { message = ex.Message });

            }

            return NotFound();

        }

        [HttpPost]
        [Route(nameof(Action))]
        public async Task<ActionResult<string>> Action (int room, string? action)
        {
            try
            {
                var checkThongbao = _context.Thongbaos.Where(x => x.Id == room).FirstOrDefault();   
                if(checkThongbao == null)
                {
                    return NotFound();
                }

                if (!string.IsNullOrEmpty(action))
                {
                    if (action.Equals("true"))
                    {
                        checkThongbao.Active = true;
                    }
                    else
                    {
                        checkThongbao.Active = false;
                    }
                }

                _context.Thongbaos.Update(checkThongbao);
                if(await _context.SaveChangesAsync() < 0)
                {
                    return BadRequest();
                }
                return Ok("Xác nhận thành công");
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        public async Task<ActionResult<object>> FindAll()
        {
            var data = _context.Thongbaos.Include(a => a.User).Include(r => r.Rooms).AsEnumerable().Reverse().ToList();
            var mapData = _mapper.Map<IEnumerable<ThongBao>, IEnumerable<ThongbaoDTO>>(data);
            return Ok(mapData);
        }

    }
}
