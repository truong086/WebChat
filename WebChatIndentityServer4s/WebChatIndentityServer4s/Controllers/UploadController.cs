using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using System.Text.RegularExpressions;
using WebChatIndentityServer4s.Data;
using WebChatIndentityServer4s.Data.Entity;
using WebChatIndentityServer4s.Hubs;
using WebChatIndentityServer4s.Models;

namespace WebChatIndentityServer4s.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadController : ControllerBase
    {
        private readonly int FileSizeLimit;
        private readonly string[] AllowedExtensions;
        private readonly ManageAppDbContext _context;
        private readonly IMapper _mapper;
        private readonly IWebHostEnvironment _environment; // Có tác dụng trỏ đến thư mục "wwwroot"
        private readonly IHubContext<ChatHub> _hubContext;

        public UploadController(ManageAppDbContext context, IMapper mapper, IWebHostEnvironment environment, IConfiguration configuration, IHubContext<ChatHub> hubContext)
        {
            _context = context;
            _mapper = mapper;
            _environment = environment;
            _hubContext = hubContext;

            FileSizeLimit = configuration.GetSection("FileUpload").GetValue<int>("FileSizeLimit"); // "FileSizeLimit" là giới hạn kích thước của file
            AllowedExtensions = configuration.GetSection("FileUpload").GetValue<string>("AllowedExtensions").Split(","); // "AllowedExtensions" này có tác dụng là lọc định dạng file
        }

        [HttpPost]
        public async Task<IActionResult> Upload([FromForm] UploadViewModel uploadViewModel)
        {
            if (ModelState.IsValid) // "ModelState.IsValid" có tác dụng là kiểm tra các [Required] trong "UploadViewModel" này đưa lên có null hay không, nếu null thì sẽ không thực hiện các câu lệnh trong ngoặc nữa
            {
                if (!Validate(uploadViewModel.File))
                {
                    return BadRequest("Validate Faild");
                }

                var fileName = DateTime.Now.ToString("yyyymmddMMss") + "_" + Path.GetFileName(uploadViewModel.File.FileName); // Lấy ra tên file và cộng với ngày tháng hiện tại, và đưa đến đường dẫn đúng của file đấy
                var folderPath = Path.Combine(_environment.WebRootPath, "uploads"); // Lấy ra Folder có tên là "uploads" trong phần "wwwroot" để upload ảnh vào
                var filePath = Path.Combine(folderPath, fileName); // Kết hợp fodel và fileName

                if(!Directory.Exists(folderPath)) // Kiểm tra xem folder "uploads" đã được tạo ra chưa, nếu chưa được tạo thì sẽ thực hiện tạo folder đấy
                    Directory.CreateDirectory(folderPath); // Tạo Folder "uploads" trong "wwwroot"

                // Sử dụng "FileStream" để copy file đấy vào trong folder "uploads"
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    // Copy file
                    await uploadViewModel.File.CopyToAsync(fileStream);
                }

                var user = _context.Users.Where(x => x.UserName == User.Identity.Name).FirstOrDefault();
                var room = _context.Rooms.Where(r => r.Id == uploadViewModel.RoomId).FirstOrDefault();

                if (user == null || room == null)
                    return NotFound();


                // Tạo ra các thẻ "a" và thẻ "img" rồi gán ảnh vào, ảnh ở đây đang là "fileName", "{0}" nghĩa là lấy giá trị đầu tiên gán vào, giá trị đầu tiên ở đây chính là "fileName"
                var htmlImage = string.Format(
                    "<a href=\"/uploads/{0}\" target=\"_blank\">" +
                    "<img src=\"/uploads/{0}\" class=\"post-image\">" +
                    "</a>", fileName
                    
                    );

                var message = new Message()
                {
                    Content = Regex.Replace(htmlImage, @"(?i)<(?!img|a|/a|/img).*?>", string.Empty), // Kiểm tra xem đã đúng định dạng chưa
                    Timestamp = DateTime.Now,
                    FromUser = user,
                    ToRoom = room
                };

                await _context.Messages.AddAsync(message);
                await _context.SaveChangesAsync();

                // Send image-message to group
                var messageViewModel = _mapper.Map<Message, MessageViewModel>(message);
                await _hubContext.Clients.Group(room.Name).SendAsync("newMessage", messageViewModel);

                return Ok();
            }

            return BadRequest();
        }

        private bool Validate(IFormFile file)
        {
            if(file.Length > FileSizeLimit)
                return false;

            var extension = Path.GetExtension(file.FileName).ToLowerInvariant();
            if(string.IsNullOrEmpty(extension) || !AllowedExtensions.Any(s => s.Contains(extension))) // " !AllowedExtensions.Any(s => s.Contains(extension))" lọc định dạng file
                                                                                                      // "string.IsNullOrEmpty(extension)" là kiểm tra đường dẫn đến file đấy có null hay không
                return false;

            return true;
        }
    }
}
