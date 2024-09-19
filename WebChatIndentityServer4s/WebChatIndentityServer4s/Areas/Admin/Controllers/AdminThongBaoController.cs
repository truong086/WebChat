using IdentityServer4.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using WebChatIndentityServer4s.Data;
using WebChatIndentityServer4s.Data.Entity;
using WebChatIndentityServer4s.Hubs;
using WebChatIndentityServer4s.Models;

namespace WebChatIndentityServer4s.Areas.Admin.Controllers
{
    [Authorize]
    [Area("Admin")]
    public class AdminThongBaoController : Controller
    {
        private readonly ManageAppDbContext _context;
        private readonly IHubContext<ChatHub> _hubContext;
        public AdminThongBaoController(ManageAppDbContext context, IHubContext<ChatHub> hubContext)
        {
            _context = context;
            _hubContext = hubContext;   
        }
        public IActionResult Index()
        {
            var data = _context.Thongbaos.Include(r => r.Rooms).Include(a => a.User).AsNoTracking().ToList();   
            return View(data);
        }

        public async Task<IActionResult> Action(int id, string name)
        {
            var checkThongbao = _context.Thongbaos.Include(r => r.Rooms).Include(a => a.User).Where(x => x.Id == id).FirstOrDefault();
            if(checkThongbao == null)
            {
                return NotFound();
            }
            if (name.Equals("true"))
            {
                checkThongbao.Active = true;
                var checkRoomUser = _context.RoomUsers.Include(a => a.User).Include(r => r.Rooms).Where(x => x.User == checkThongbao.User && x.Rooms == checkThongbao.Rooms).FirstOrDefault();
                if(checkRoomUser == null)
                {
                    var roomUser = new RoomUser()
                    {
                        User = checkThongbao.User,
                        Rooms = checkThongbao.Rooms,
                        Action = true,
                        CreateAt = DateTime.Now
                    };

                    _context.RoomUsers.Add(roomUser);
                }

                if(checkRoomUser != null && checkRoomUser.Action == false) {
                    await _hubContext.Clients.All.SendAsync("block", string.Format($"Bạn đã bị Block khỏi room {checkThongbao.Rooms.Name}"));
                    return Ok("Bạn đã bị Block");
                }
                
                await _hubContext.Clients.All.SendAsync("true", new { roomid = checkThongbao.Rooms.Id,  roomname = checkThongbao.Rooms.Name});
            }else if (name.Equals("false"))
            {
                checkThongbao.Active = false;
                await _hubContext.Clients.All.SendAsync("false", "Yêu cầu bị từ chối");
            }

            _context.Thongbaos.Update(checkThongbao);
            if(await _context.SaveChangesAsync() > 0)
            {
                return RedirectToAction(nameof(Index));
            }

            return NotFound();


        }

        public async Task<IActionResult> Delete(int id)
        {
            var checkThongbao = _context.Thongbaos.Include(r => r.Rooms).Include(a => a.User).Where(x => x.Id == id).FirstOrDefault();
            if (checkThongbao == null)
            {
                return NotFound();
            }
            

            _context.Thongbaos.Remove(checkThongbao);
            if (await _context.SaveChangesAsync() > 0)
            {
                return RedirectToAction(nameof(Index));
            }

            return NotFound();


        }

        public ActionResult CreateJoinOrBlock()
        {
            var room = _context.Rooms.AsNoTracking().ToList();
            var user = _context.Users.AsNoTracking().ToList();
            ViewBag.users = new SelectList(user, "Id", "UserName");
            ViewBag.rooms = new SelectList(room, "Id", "Name");

            return View();
        }

        [HttpPost]
        public async Task<ActionResult> JoinOrBlock(ViewModelBlockOrJoin viewModel)
        {
            try
            {
                var checkRoom = _context.Rooms.Where(x => x.Id == viewModel.Id_Room).SingleOrDefault();
                var checkUser = _context.Users.Where(x => x.Id == viewModel.Id_User).FirstOrDefault();
                var checkRoomUser = _context.RoomUsers.Include(r => r.Rooms).Include(a => a.User).Where(x => x.User.Id == viewModel.Id_User && x.Rooms.Id == viewModel.Id_Room).FirstOrDefault();
                if (checkUser == null)
                {
                    return NotFound();
                }
                if (checkRoom == null)
                {
                    return NotFound();
                }
                if (!string.IsNullOrEmpty(viewModel.Action))
                {
                    if (viewModel.Action.Equals("true"))
                    {


                        bool checkData = await ValidateData(checkRoom, checkUser, checkRoomUser, true);
                        if(checkData)
                        {
                            return RedirectToAction(nameof(Index));
                        }


                    }
                    else if (viewModel.Action.Equals("false"))
                    {
                        bool checkData = await ValidateData(checkRoom, checkUser, checkRoomUser, false);
                        if (checkData)
                        {
                            return RedirectToAction(nameof(Index));
                        }
                    }
                }
            }catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            return Ok();
        }


        private async Task<bool> ValidateData(Room checkRoom, ManageUser checkUser, RoomUser checkRoomUser, bool action)
        {
            if (checkRoomUser != null)
            {
                checkRoomUser.Action = action;
                _context.RoomUsers.Update(checkRoomUser);
                if (await _context.SaveChangesAsync() > 0)
                {
                    return true;
                }

            }

            var userRoom = new RoomUser()
            {
                User = checkUser,
                Rooms = checkRoom,
                Action = action,
                CreateAt = DateTime.Now
            };

            _context.RoomUsers.Add(userRoom);
            if (await _context.SaveChangesAsync() > 0)
            {
                return true;
            }

            return false;

        }
    }
}
