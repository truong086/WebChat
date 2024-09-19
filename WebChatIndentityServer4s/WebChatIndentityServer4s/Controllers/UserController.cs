using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebChatIndentityServer4s.Data;
using WebChatIndentityServer4s.Data.Entity;
using WebChatIndentityServer4s.Models;
using WebChatIndentityServer4s.Data.Entity;
using WebChatIndentityServer4s.Data;
using WebChatIndentityServer4s.Models;

namespace WebChatIndentityServer4s.Controllers
{
    [Authorize("Bearer")] // Để bắt buộc đăng nhập mới dùng được, ta phải thêm một cái policy(chính sách) mà ta mong muốn, nếu muốn dùng policy ta phải add thêm 2 cái Authen và Author bên file Program.cs
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly UserManager<ManageUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly ManageAppDbContext _context;

        public UserController(UserManager<ManageUser> userManager,
            RoleManager<IdentityRole> roleManager,
            ManageAppDbContext context)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _context = context;
        }

        //[HttpPost]
        //public async Task<IActionResult> PostUser(UserCreateRequest request)
        //{
        //    var dob = DateTime.Parse(request.Dob);
        //    var user = new ManageUser()
        //    {
        //        Id = Guid.NewGuid().ToString(),
        //        Email = request.Email,
        //        BirthDay = DateTime.Parse(request.Dob),
        //        UserName = request.UserName,
        //        DisPlayName = request.FirstName,
        //        PhoneNumber = request.PhoneNumber
        //    };

        //    var result = await _userManager.CreateAsync(user, request.Password); // Phương thức "CreateAsync" đã được Identity.core hỗ trợ, dùng để Add dữ liệu mới

        //    if (result.Succeeded)
        //    {
        //        // "nameof(GetById)" ở trong "CreatedAtAction()" sẽ gọi lại 1 hàm khác có tên là "GetById", "new {id = user.Id}" là chuyền tham số vào cho hàm đấy(GetById) yêu cầu
        //        return CreatedAtAction(nameof(GetById), new { id = user.Id }, request);
        //    }
        //    else
        //    {
        //        return BadRequest(new ApiBadRequestResponse(result));
        //    }
        //}

        //[HttpGet]
        //public async Task<IActionResult> GetUsers()
        //{
        //    var users = _userManager.Users;
        //    var uservms = await users.Select(u => new UserViewModel
        //    {
        //        Id = u.Id,
        //        UserName = u.UserName,
        //        Dob = u.BirthDay,
        //        Email = u.Email,
        //        PhoneNumber = u.PhoneNumber,
        //        FirstName = u.DisPlayName
        //    }).ToArrayAsync();

        //    return Ok(uservms);
        //}

        //[HttpGet("{id}")]
        //public async Task<IActionResult> GetById(string id)
        //{
        //    var user = await _userManager.FindByIdAsync(id); // Hàm "FindByIdAsync" là tìm kiếm dữ liệu theo "id" hàm có sẵn của IdentityServer

        //    if (user == null)
        //        return NotFound(new ApiNotFoundResponse($"Cannot found user with id: {id}"));

        //    var uservms = new UserViewModel()
        //    {
        //        Id = user.Id,
        //        UserName = user.UserName,
        //        Dob = user.BirthDay,
        //        Email = user.Email,
        //        PhoneNumber = user.PhoneNumber,
        //        FirstName = user.DisPlayName
        //    };

        //    return Ok(uservms);
        //}
    }
}
