using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using WebChatIndentityServer4s.Data;
using WebChatIndentityServer4s.Data.Entity;
using WebChatIndentityServer4s.Hubs;
using WebChatIndentityServer4s.Models;

namespace WebChatIndentityServer4s.Controllers
{
    [Route("api/Rooms")]
    [ApiController]
    public class RoomController : ControllerBase
    {
        private readonly ManageAppDbContext _context;
        private readonly IMapper _mapper;
        private readonly IHubContext<ChatHub> _hubContext; // "IHubContext" này sẽ kết nối đến "ChatHub.cs" của chúng ta

        public RoomController(ManageAppDbContext context, IMapper mapper, IHubContext<ChatHub> hubContext)
        {
            _context = context;
            _mapper = mapper;
            _hubContext = hubContext;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<RoomViewModel>>> Get()
        {
            var date = DateTime.Now.Date;

            var rooms = await _context.Rooms.ToListAsync();

            var mapData = _mapper.Map<IEnumerable<Room>, IEnumerable<RoomViewModel>>(rooms);

            return Ok(mapData);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Room>> Get(int id)
        {

            var rooms = await _context.Rooms.FindAsync(id);

            if (rooms == null)
                return NotFound();

            var mapData = _mapper.Map<Room, RoomViewModel>(rooms);

            return Ok(mapData);
        }

        // Create Room
        [HttpPost]
        public async Task<ActionResult<Room>> Create (RoomViewModel roomViewMode)
        {
            if(_context.Rooms.Any(x => x.Name == roomViewMode.Name)) // Kiểm tra xem tên của room đấy đã tồn tại chưa
                return BadRequest("Room đã tồn tại"); // Nếu tồn tại rồi thì thông báo cho người dùng là "Room đã tồn tại"

            var user = _context.Users.FirstOrDefault(x => x.UserName == User.Identity.Name); // Lấy ra User đang đăng nhập
            var room = new Room() // Tạo ra 1 model Room
            {
                Name = roomViewMode.Name,
                Admin = user
            };

            // Lưu vào trong Database
            _context.Rooms.Add(room);
            await _context.SaveChangesAsync();

            await _hubContext.Clients.All.SendAsync("addChatRoom", new { id = room.Id, name = room.Name }); // Khi lưu dữ liệu vào Database thì tạo ra 1 sự kiện chuyền lên cho Client sự kiện là "addChatRoom", và chuyền lên 1 đối tượng "new { id = room.Id, name = room.Name }" này và trên Client sẽ nhận đc "id" và "name" này

            /*
             * CreatedAtAction: Đây là một phương thức được cung cấp bởi framework, được sử dụng để tạo 
             * một HTTP response với mã trạng thái 201 (Created) và định tuyến đến một action cụ thể trong controller.
             * 
             * nameof(Get): Đây là tên của một action trong controller, thường là một action dùng để lấy thông tin của một tài nguyên cụ thể.
             * 
             * new {id = room.Id, name = room.Name}: Đây là một đối tượng với các thuộc tính được chỉ định. 
             * Trong trường hợp này, nó chứa hai thuộc tính id và name, mỗi thuộc tính có giá trị tương ứng 
             * từ đối tượng room. Cụ thể, id là id của phòng (room.Id), và name là tên của phòng (room.Name).
             * 
             * Tóm lại, đoạn mã trên sẽ trả về một HTTP response với mã trạng thái 201 và định tuyến đến action Get trong controller, cung cấp thông tin về phòng vừa được tạo.
             */
            return CreatedAtAction(nameof(Get), new {id = room.Id, name = room.Name});
        }

        [HttpPut("{id}")]
        // Hàm sửa Room
        public async Task<IActionResult> Edit (int id, RoomViewModel roomViewModel)
        {
            if (_context.Rooms.Any(x => x.Name == roomViewModel.Name)) // Kiểm tra xem là tên room cần sửa chuyền lên có trùng với tên room cũ ko, nếu trùng thì thông báo cho người dùng biết tên room đã tồn tại
                return BadRequest("Room này đã tồn tại");

            //var room = await _context.Rooms.Include(x => x.Admin).Where(x => x.Id == id && x.Admin.UserName == User.Identity.Name).FirstOrDefaultAsync();

            var room = await _context.Rooms.Include(x => x.Admin).Where(x => x.Id == id).FirstOrDefaultAsync();
            if (room == null)
                return NotFound();

            room.Name = roomViewModel.Name;
            await _context.SaveChangesAsync();

            await _hubContext.Clients.All.SendAsync("updateChatRoom", new { id = room.Id, room.Name }); // "Clients.All" này là gửi cho tất cả những người ở trong cái Room đấy(All)

            return NoContent();
        }


        [HttpDelete("{id}")]
        // Hàm Delete Room
        public async Task<IActionResult> Delete(int id)
        {
            //var checkRoom = await _context.Rooms.Include(x => x.Admin).Where(x => x.Id == id && x.Admin.UserName == User.Identity.Name).FirstOrDefaultAsync();

            var checkRoom = await _context.Rooms.Include(x => x.Admin).Where(x => x.Id == id).FirstOrDefaultAsync();
            if (checkRoom == null)
                return NotFound();

            _context.Rooms.Remove(checkRoom);
            await _context.SaveChangesAsync();

            await _hubContext.Clients.All.SendAsync("removeChatRoom", checkRoom.Id);
            await _hubContext.Clients.Group(checkRoom.Name).SendAsync("onRoomDeleted", string.Format("Room {0} has been deleted.\nYou are moved to the first available room!", checkRoom.Name)); // Thông báo với những người trong group này 1 sự kiện là "onRoomDeleted" và trả về 1 thông báo trong "string.format", và trả về tên room "checkRoom.Name"

            return NoContent();
        }
    }
}
