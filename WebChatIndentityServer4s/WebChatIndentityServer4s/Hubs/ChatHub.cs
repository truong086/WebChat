using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using System.Text.RegularExpressions;
using WebChatIndentityServer4s.Data;
using WebChatIndentityServer4s.Data.Entity;
using WebChatIndentityServer4s.Models;

namespace WebChatIndentityServer4s.Hubs
{
    [Authorize]
    public class ChatHub : Hub
    {
        // Danh sách những người kết nối đến(Danh sách User hiện tại đang đăng nhập)
        public readonly static List<UserViewModel> _Connections = new List<UserViewModel>();

        // Khi tham gia ViewMember gọi đến "SignalR" thì "SignalR" nó sẽ cung cấp 1 "Connection Id" với "Connection Id" thì có thể kết nối đến cái "Hub" mà cần thao tác
        private readonly static Dictionary<string, string> _ConnectionsMap = new Dictionary<string, string>();

        private readonly ManageAppDbContext _context;
        private readonly IMapper _mapper;
        public ChatHub(ManageAppDbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        // Gửi Message cho 1 User
        public async Task SendPrivate(string receiverName, string message) // Hàm này nhận vào là tên người nhận "receiverName" và message
        {
            if(_ConnectionsMap.TryGetValue(receiverName, out var UserId)) // "_ConnectionsMap.TryGetValue(receiverName, out var UserId)" nghĩa là đang kiểm tra "Key" ở đây đang kiểm tra xem "Key"(receiverName này) có tồn tại trong "_ConnectionsMap" không, "receiverName" là key được chuyền vào để kiểm tra, "out var UserId": Là một biến mà giá trị tương ứng với "receiverName" sẽ được gán vào nếu key tồn tại. Nếu key không tồn tại, giá trị của UserId sẽ là một giá trị mặc định của kiểu dữ liệu của nó.
            { 
                // Who is the sender 
                var sender = _Connections.Where(x => x.Username == IdentityName).First(); // Lấy ra User đang đăng nhập(ở đây là lấy ra người gửi)

                if(!string.IsNullOrEmpty(message.Trim())) // Kiểm tra "message" có null không và cắt 2 đầu rỗng của nó đi sử dụng hàm "trim()"
                {
                    // Build the message(Gán dữ liệu vào "MessageViewModel")
                    var messageViewModel = new MessageViewModel()
                    {
                        Content = Regex.Replace(message, @"<.*?>", string.Empty), // matcha bất kỳ ký tự nào, Sử dụng "Regex.Replace" để map với bất kỳ ký tự nào "@"<.*?>"", nếu không máp với bất kỳ ký tự nào trong "@"<.*?>"" thì đoạn "Content" sẽ mặc định là "string.Empty"(rỗng)
                        From = sender.FullName,
                        Avatar = sender.Avatar,
                        Room = "",
                        Timestamp = DateTime.Now.ToLongTimeString() // Thời gian hiện tại
                    };

                    // Send the Message(Gửi tin nhắn)
                    await Clients.Client(UserId).SendAsync("newMessage", messageViewModel); // Gửi message lên cho người dùng đấy, Lưu ý: "await Clients.Client(UserId).SendAsync("newMessage", messageViewModel)" đoạn code này là cách gửi riêng cho 1 Client nào đó, "Clients.Client(UserId)" nghĩa là chuyền "UserId" này vào trong "Client" thì mặc định sẽ chỉ gửi cho thằng "UserId" này thôi, và trên đấy sẽ nhận 1 sự kiện là "newMessage"
                    await Clients.Caller.SendAsync("newMessage", messageViewModel); // Và chúng ta cũng gửi luôn cho chúng ta nữa bằng cách sử dụng "await Clients.Caller.SendAsync("newMessage", messageViewModel)" gửi cho chính chúng ta sử sụng "Caller" để gửi lại chính chúng ta, và cũng gửi lên 1 sự kiện "newMessage"
                }
            }
        }

        // Viết hàm Join vào room (join vào phòng)
        public async Task Join (string roomName)
        {
            try
            {
                var user = _Connections.Where(x => x.Username == IdentityName).FirstOrDefault(); // Lấy cái người hiện tạo đang đăng nhập, lấy UserName của người hiện tại đang đăng nhập
                if(user != null && user.CurrentRoom != roomName) // "user.CurrentRoom != roomName" này nghĩa là, cái "CurrentRoom" hiện tại của thằng User này mà nó tham gia vào mà khác với cái "roomName"(roomName này chuyền từ ngoài vào) hiện tại mà chúng ta hiện tại muốn Join vào thì mới join, Tóm lại là kiểm tra người dùng này có đang ở room nào khác không nếu ở thì xóa đi rồi join vào room mới
                {
                    // Remove user from others list (Xóa người dùng khỏi danh sách của người khác)
                    if (!string.IsNullOrEmpty(user.CurrentRoom)) // Nếu "user.CurrentRoom" khác null thì thực hiện dòng lệnh bên dưới
                        await Clients.OthersInGroup(user.CurrentRoom).SendAsync("removeUser", user); // Nếu "user.CurrentRoom" khác null thì chúng ta sẽ nói với những người ở trong cái room hiện tại của chúng ta đang ở (Nói bằng cách sử dụng hàm "OthersInGroup(user.CurrentRoom)", "user.CurrentRoom" là tên của room hiện tại đang ở) là chúng ta sẽ remove chúng ta ra (bằng hàm này "SendAsync("removeUser", user)", "user" này là xóa bỏ người dùng này), "removeUser" này là sự kiện và Client sẽ lắng nghe và thực hiện nó

                    // Join to new chat room (Tham gia vào phòng trò chuyện mới)
                    await Leave(user.CurrentRoom); // Gọi lại hàm "Leave()" để ra khỏi cái room đấy
                    await Groups.AddToGroupAsync(Context.ConnectionId, roomName); // Tham gia vào room mới và đưa "ConnectionId" vào để biết mình là ai và đưa "roomName" mà chúng ta muốn join vào
                    user.CurrentRoom = roomName; // Xét lại "CurrentRoom" hiện tại của mình bằng cái roomName mới

                    // Tell others to update their list of users (Thông báo cho người khác cập nhật danh sách người dùng của họ)
                    await Clients.OthersInGroup(roomName).SendAsync("addUser", user); // Phía Client chúng ta sẽ nói cho tất cả những người ở trong cái room đấy biết rằng là chúng ta đang ở trong đấy, "SendAsync("addUser", user);" gửi cho 1 sự kiện là "addUser" và đưa chúng ta vào là "user"
                }

            }catch(Exception ex)
            {
                await Clients.Caller.SendAsync("onError", "You failed to join the chat room!" + ex.Message);
            }
        }

        private async Task Leave (string roomName)
        {
            await Groups.RemoveFromGroupAsync(Context.ConnectionId, roomName); // Ra  khỏi room hiện tại đang ở, "Context.ConnectionId" này là lấy ra "ConnectionId" hiện tại mình đang đăng nhập và "ConnectionId" này đã kết nối đến Hub
        }

        private string IdentityName
        {
            get { return Context.User.Identity.Name; } // Lấy ra tên người hiện tại đang đăng nhập
        }


        // Hàm này nghĩa là khi chúng ta vừa Login xong có nghĩa là chúng ta chuẩn bị Connect thì sẽ gọi hàm này "OnConnectedAsync()" (Hàm này Client sẽ gọi)
        public override Task OnConnectedAsync()
        {
            try
            {
                var user = _context.Users.Where(x => x.UserName == IdentityName).FirstOrDefault(); // Lấy ra thằng User hiện tại
                var checkRoleUser = _context.UserRoles.Where(x => x.UserId == user.Id).FirstOrDefault();
                var userViewModel = _mapper.Map<ManageUser, UserViewModel>(user);  // Map lại dữ liệu cho "UserViewModel"
                userViewModel.Device = GetDevice(); // Xét Device
                userViewModel.CurrentRoom = ""; // Lần đầu tiên đăng nhập xong thì chưa tham gia room nào nên là sét "CurrentRoom" là rỗng
                if(checkRoleUser != null)
                {
                    var checkRole = _context.Roles.Where(x => x.Id == checkRoleUser.RoleId).FirstOrDefault();
                    if(checkRole != null)
                    {
                        userViewModel.Role = checkRole.Name;
                    }
                    
                }
                if (!_Connections.Any(x => x.Username == IdentityName)) // Kiểm tra nếu danh sách của User hiện tại mà không có thằng User mà chúng ta vừa lấy lên(Ở trong "_Connections" này) thì chúng ta Add User đấy vào
                {
                    _Connections.Add(userViewModel); // Add User vào 
                    _ConnectionsMap.Add(IdentityName, Context.ConnectionId); // Add thêm Tên của User "IdentityName" và "Context.ConnectionId" vào "_ConnectionsMap", "ConnectionId" này là khi đăng nhập thì SignalR tự động cung cấp cho 1 "ConnectionId" này
                }

                Clients.Caller.SendAsync("getProfileInfo", user.FullName, user.Avatar, userViewModel.Role,user.Id); // Gửi 1 sự kiện "getProfileInfo" để phía Client sẽ thực hiện thao tác "getProfileInfo" cho chúng ta, và đưa 2 dữ liệu "user.FullName, user.Avatar" vào
            }
            catch(Exception ex)
            {
                Clients.Caller.SendAsync("onError", "OnConnected:" + ex.Message); // Nếu lỗi thì gửi cho Client lắng nghe 1 cái sự kiện là "onError"
            }
            return base.OnConnectedAsync(); 
        }

        public override Task OnDisconnectedAsync(Exception? exception)
        {
            try
            {
                var user = _Connections.Where(x => x.Username  == IdentityName).First();
                _Connections.Remove(user);

                // Tell other users to remove you from their list (Hãy thông báo cho người dùng khác loại bỏ bạn khỏi danh sách của họ)
                Clients.OthersInGroup(user.CurrentRoom).SendAsync("removeUser", user); // Nói với những người khác ở trong group mà chúng ta đang ở là chúng ta sẽ thoát ra, gọi sự kiện "removeUser"

                // Remove mapping
                _ConnectionsMap.Remove(user.Username); // Xóa khỏi "_ConnectionsMap"
            }
            catch (Exception ex)
            {
                Clients.Caller.SendAsync("onError", "OnDisconnected:" + ex.Message);
            }
            return base.OnDisconnectedAsync(exception);
        }

        public IEnumerable<UserViewModel> GetUsers(string roomName)
        {
            return _Connections.Where(x => x.CurrentRoom == roomName).ToList(); // Lấy ra những người ở trong room
        }

        private string GetDevice()
        {
            var device = Context.GetHttpContext().Request.Headers["Device"].ToString(); // lấy ra "Device" trên "Headers" của cái ứng dụng Client đang sử dụng
            if(!string.IsNullOrEmpty(device) && (device.Equals("Desktop") || device.Equals("Mobile"))) // Kiểm tra "device" phải khác null, và kiểm tra xem "device" có phải trạng thái là "Desktop" hoặc "Mobile" hay không, nếu "device" này khác null và là trạng thái "Desktop" hoặc "Mobile" thì trả ra chính "device" này
                return device;

            return "Web"; // Trả ra trạng thái "Web"
        }
    }
}
