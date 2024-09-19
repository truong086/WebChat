
$(document).ready(function () {
    // Kết nối đến ChatHub
    var connection = new signalR.HubConnectionBuilder().withUrl("/chatHub").build()

    connection.start().then(function () {
        console.log("SignalR Started...")
        viewModel.roomList()
        viewModel.userList()
        viewModel.findAllRoomUser()

    }).catch(function (err) {
        return console.error(err)
    })

    connection.on("addChatRoom", function (room) { // lắng nghe sự kiện "addChatRoom" bên phía APi trả về, ở đây API sẽ trả ra cả dữ liệu, sẽ chuyền vào "function (room)" này rồi gán dữ liệu vào hàm "roomAdded()" để sử dụng
        viewModel.roomAdded(new ChatRoom(room.id, room.name))
    })

    connection.on("Thongbao", function (room) { // lắng nghe sự kiện "addChatRoom" bên phía APi trả về, ở đây API sẽ trả ra cả dữ liệu, sẽ chuyền vào "function (room)" này rồi gán dữ liệu vào hàm "roomAdded()" để sử dụng
        viewModel.serverInfoMessage(room)
        $("#errorAlert").removeClass("d-none").show().delay(5000).fadeOut(500)
    })


    //connection.on("true", function (room) { // lắng nghe sự kiện "addChatRoom" bên phía APi trả về, ở đây API sẽ trả ra cả dữ liệu, sẽ chuyền vào "function (room)" này rồi gán dữ liệu vào hàm "roomAdded()" để sử dụng
    //    connection.invoke("Join", room.roomname()).then(function () { // Call 1 sự kiện "Join"(Nghĩa là gọi đến hàm "Join" bên ChatHub.cs) cho thằng "ChatHub.cs" sử dụng "invoke()" này để call đến
    //        viewModel.joinedRoom(room.roomname()) // Chuyền tên room vào để biết mình đang join vào room nào
    //        viewModel.joinedRoomId(room.roomid()) // Và id của room
    //        viewModel.userList()
    //        viewModel.messageHistory()
    //    })
    //})

    connection.on("addUser", function (user) {
        console.log(user)
        viewModel.userAdded(new chatUsers(user.id, user.username, user.fullName, user.avatar, user.currentRoom, user.device, user.role))
        
    })

    // Bắt sự kiện "onError" bên API và hiển thị thông báo Lỗi
    connection.on("onError", function (message) {
        viewModel.serverInfoMessage(message) // Add thông báo lỗi
        $("#errorAlert").removeClass("d-none").show().delay(5000).fadeOut(500) // Hiển thị thông báo bên giao diện người dùng
    })

    connection.on("removeUser", function (user) {
        viewModel.userRemoved(user.username)
    })

    connection.on("updateChatRoom", function (room) {
        viewModel.roomUpdated(new ChatRoom(room.id, room.name))
    })

    connection.on("removeChatRoom", function (id) {
        viewModel.roomDeleted(id)
    })

    // Hiển thị dữ liệu Profile
    connection.on("getProfileInfo", function (displayName, avatar, role, id) { // Lắng nghe sự kiện "getProfileInfo" bên API trả ra(ở đây file "ChatHub.cs" sẽ trả ra sự kiện "getProfileInfo" này), bên API(của file ChatHub.cs) này sẽ trả ra thêm cả dữ liệu đó là "FullName" và "Avatar", bên frontEnd này sẽ tạo 1 hàm "function (displayName, avatar)" này để nhận 2 dữ liệu bên API trả ra
        // Gán lại dữ liệu
        viewModel.myName(displayName)
        viewModel.myAvatar(avatar)
        viewModel.isLoading(false)
        viewModel.roleUser(role)
        viewModel.idUsers(id)
        localStorage.removeItem("role")
        localStorage.setItem("role", JSON.stringify(role))
        localStorage.setItem("id", JSON.stringify(id))
    })

    connection.on("newMessage", function (messageView) {
        var isMine = messageView.from === viewModel.myName() // Kiểm tra xem có phải chính chúng ta không, nghĩa là nếu là chính chúng ta thì "message"(tin nhắn) sẽ nằm bên tay phải, còn nếu không phải chúng ta thì message(tin nhắn) sẽ nằm bên thay trái, đoạn code này sẽ trả về "true" hoặc "false", nếu là chính chúng ta thì sẽ trả về "true" còn không phải chúng ta thì sẽ trả về "false"
        console.log(isMine)
        var message = new ChatMessage(messageView.content, messageView.timestamp, messageView.from, isMine, messageView.avatar) // Tạo ra 1 message

        viewModel.chatMessages.push(message) // Push messgae vào trong "chatMessages", cái "chatMessages" này có chức năng là chúng ta sẽ hiển thị dữ liệu message lên người dùng
        $(".chat-body").animate({ scrollTop: $(".chat-body")[0].scrollHeight }, 1000) // "[0]" nghĩa là scroll về "0" để hiển thị message mới nhất, "1000" này là "scroll" về trong 1 giây
    })

    connection.on("onRoomDeleted", function (message) { // Lắng nghe sự kiện "onRoomDeleted" bên API trả ra
        viewModel.serverInfoMessage(message)
        $("#errorAlert").removeClass("d-none").show().delay(5000).fadeOut(500) // "fadeOut" này nghĩa là mờ đi dần cho đến khi biến mất, "fadeIn" là đậm dần, "fadeOut" là mờ dần

        if (viewModel.chatRooms() == 0) {
            viewModel.joinedRoom("")
        } else {
            // Join to the first room in list
            setTimeout(function () {
                $("ul#room-list li a")[0].click()
            }, 50)
        }
    })
    function AppViewModel() {
        var self = this // Tạo ra chính nó
        self.message = ko.observable("") // Tự động cập nhật dữ liệu, "observable" tự động cập nhật dữ liệu
        self.chatRooms = ko.observableArray([]) // Danh sách những room, khởi tạo 1 room rỗng
        self.chatUsers = ko.observableArray([]) // Danh sách những User chat với room đó, biến này dùng để lưu các user đăng nhập vào Web Chat
        self.serverInfoMessage = ko.observable("")
        self.chatMessages = ko.observableArray([]) // Danh sách những Message
        self.joinedRoom = ko.observable("") // Tên của room hiện tại đang join
        self.joinedRoomId = ko.observable("") // Id của room, Thật ra là: Id của cái channel(của cái Hub) mà chúng ta tạo ra để join vào
        self.myName = ko.observable("") // Tên của người dùng đang chat
        self.myAvatar = ko.observable("avatar1.png") // Avatar cho mặc định là "avatar1.png"
        self.isLoading = ko.observable(true) // Khi lần đầu tiên load có đăng nhập có show lên trang Web chat đấy không
        self.roleUser = ko.observable("")
        self.roomListEx = ko.observableArray([])
        self.idUsers = ko.observable("")

        self.filter = ko.observable("")

        // Đây là hàm tìm kiếm
        self.filteredChatUsers = ko.computed(function () {
            if (!self.filter()) { // Kiểm tra nếu "self.filter()" mà là null thì sẽ trả ra luôn danh sách User hiện tại load đc khi chúng ta join vào
                return self.chatUsers()
            } else { // Nếu "self.filter()" là khác null
                return ko.utils.arrayFilter(self.chatUsers(), function (user) { // Sử dụng "ko.utils.arrayFilter" để lọc qua từng phần tử ở trong mảng, mảng ở đây sẽ là mảng danh sách User(self.chatUsers()), và tạo ra 1 hàm xử lý "function (user)" đưa từng "user" vào
                    console.log(user)
                    var displayName = user.displayName().toLowerCase() // Mỗi "user" được đưa vào thì sẽ lấy ra cái name và chuyển hết về chữ in thường sử dụng hàm "toLowerCase()" để chuyển về chữ in thường, vì nhiều lúc muốn tìm ra chữ in hoa nên phải đưa tất cả về 1 chuẩn là in thường
                    return displayName.includes(self.filter().toLowerCase()) // Lọc xem có phần tử "self.filter()" này có "displayName" hay không, nếu có thì sẽ trả ra ngay danh sách có cái "filter" đấy, sử dụng "includes()" để lọc
                })
            }
        })

        self.userAdded = function (user) {
            
            self.chatUsers.push(user)
        }
        self.onEnter = function (d, e) {
            if (e.keyCode === 13) { // "keyCode === 13" nghĩa là khi ấn nút "Enter" trên bàn phím, "13" chính là nút "Enter"
                self.sendNewMessage() // Bắt đầu gọi hàm "sendNewMessage()"
            }
            return true
        }

        // Create Message
        self.sendNewMessage = function () {
            var text = self.message() // Lấy ra message từ ô input gửi lên

            // Send private
            if (text.startsWith("/")) { // Kiểm tra xem có dấu "/" này không, nếu có dấu "/" này thì là đang gửi tin nhắn riêng tư cho 1 User nào đó
                var receiver = text.substring(text.indexOf("(") + 1, text.indexOf(")"))// text.substring(text.indexOf("(") + 1, text.indexOf(")")): Phương thức "substring()" được sử dụng để trích xuất một phần của chuỗi từ vị trí "text.indexOf("(")" đến vị trí text.indexOf(")").Trong trường hợp này, text.indexOf("(") là vị trí của ký tự(cộng thêm 1(do chúng ta muốn bỏ qua ký tự "(" ), và text.indexOf(")") là vị trí của ký tự cuối ).
                var message = text.substring(text.indexOf(")") + 1, text.length) // Lấy ra vị trí của message bắt đầu từ dấu ")" này đổ đi, "text.length" chính là message trong ô input

                self.sendPrivate(receiver, message)
            } else { // Nếu không có dấu "/" là đang gửi tin nhắn vào room cho tất cả mọi người đều thấy
                self.sendToRoom(self.joinedRoom(), self.message())
            }

            self.message("")
            
        }

        // Hàm send Message private(Riêng tư)
        self.sendPrivate = function (receiver, message) { // hàm này nhận vào 2 tham số, tham số đầu tiên là: "receiver"(người nhận), tham số thứ 2 là: "message"(Tin nhắn)
            if (receiver.length > 0 && message.length > 0) { // Kiểm tra "receiver"(Người gửi) và "message"(Nội dung tin nhắn) có bị rỗng không
                connection.invoke("SendPrivate", receiver.trim(), message.trim()) // Sử dụng "invoke" để gọi đến hàm "SendPrivate" trong file "ChatHub.cs", hàm này cần chuyền vào 2 tham số là "người nhận" với "tin nhắn", nên ở đây chúng ta sẽ chuyền vào 2 tham số là: "receiver"(Người nhận), "message"(Tin nhắn)
            }
        }

        // Hàm gửi tin nhắn vào trong room để mọi người trong room đấy đều thấy
        self.sendToRoom = function (roomName, message) { // Hàm này nhận 2 tham số là: Tên room(roomName) và nội dung tin nhắn(message)
            if (roomName.length > 0 && message.length > 0) {
                fetch('/api/Messages', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ room: roomName, content: message })
                }).then(() => {
                    self.messageHistory()
                })
            }
        }
        

        // /Join Room
        //self.joinRoom = function (room) {

        //    const role = JSON.parse(localStorage.getItem("role"))
        //    if (role === "Admin") {
        //        // "invoke" này nhận vào 2 tham số, tham số đầu tiên là tên của hàm(ở đây tên của hàm cần gọi là "Join"), tham số thứ 2 là: Tham số mà hàm cần đấy cần chuyền vào(ở đây tham số mà hàm "Join" cần chuyền vào là "roomName" nên sẽ chuyền vào đây là "room.name()" vì trong "room.name()" chứa tên của room)
        //        connection.invoke("Join", room.name()).then(function () { // Call 1 sự kiện "Join"(Nghĩa là gọi đến hàm "Join" bên ChatHub.cs) cho thằng "ChatHub.cs" sử dụng "invoke()" này để call đến
        //            self.joinedRoom(room.name()) // Chuyền tên room vào để biết mình đang join vào room nào
        //            self.joinedRoomId(room.id()) // Và id của room
        //            self.userList()
        //            self.messageHistory()
        //        })
        //    } else {
        //        self.createThongbaoJoinRoom(room.id())
        //        console.log("Lỗi")
        //    }

        //}

        self.findAllRoomUser = function () {
            var test = viewModel.idUsers(JSON.parse(localStorage.getItem("id")))
            console.log(test)

            fetch('/api/RoomUser?idUser=' + viewModel.idUsers()).then(response => response.json())
                .then(data => {
                    for (var i = 0; i < data.length; i++) {
                        var item = data[i]
                        console.log(item.room_name)
                        self.roomListEx.push(new ChatRoom(item.id_room, item.room_name) )
                        //self.joinedRoom(item.room_name)
                        //self.joinedRoomId(item.id_room)
                        
                    }
                    
                    //viewModel.messageHistory()

                    //console.log(data[0].room_name)
                }).catch(error => {
                    console.log(error)
                })
        }

        self.joinRoom = function (room) {

            const role = JSON.parse(localStorage.getItem("role"))
            var temp
            
            if (role === "Admin") {
                // "invoke" này nhận vào 2 tham số, tham số đầu tiên là tên của hàm(ở đây tên của hàm cần gọi là "Join"), tham số thứ 2 là: Tham số mà hàm cần đấy cần chuyền vào(ở đây tham số mà hàm "Join" cần chuyền vào là "roomName" nên sẽ chuyền vào đây là "room.name()" vì trong "room.name()" chứa tên của room)
                connection.invoke("Join", room.name()).then(function () { // Call 1 sự kiện "Join"(Nghĩa là gọi đến hàm "Join" bên ChatHub.cs) cho thằng "ChatHub.cs" sử dụng "invoke()" này để call đến
                    self.joinedRoom(room.name()) // Chuyền tên room vào để biết mình đang join vào room nào
                    self.joinedRoomId(room.id()) // Và id của room
                    self.userList()
                    self.messageHistory()
                })
            } else {
                
                ko.utils.arrayForEach(self.roomListEx(), function (item) {
                    if (item.id() == room.id()) {
                        self.joinedRoom(item.name())
                        self.joinedRoomId(item.id())
                        self.messageHistory()
                        temp = item
                        console.log("Đã vào")

                        connection.invoke("Join", room.name()).then(function () {
                            self.messageHistory()
                        })
                    }



                })
                console.log(temp)
                if (temp === undefined)
                    self.createThongbaoJoinRoom(room.id())
                console.log("Lỗi")
            }

        }

        // Gọi API lấy message ở trong Room
        self.messageHistory = function () {
            fetch("/api/Messages/Room/" + viewModel.joinedRoom()) // Call API và chuyền tham số là "viewModel.joinedRoom()"(Tên Room) lên để xử lý
                .then(response => response.json())
                .then(data => {
                    self.chatMessages.removeAll() // Xóa hết message
                    for (var i = 0; i < data.length; i++) { // Sử dụng for để lặp qua các dữ liệu messasge bên API trả về
                        var isMine = data[i].from == self.myName() // Kiểm tra xem tin nhắn có phải chúng ta không, nếu là chúng ta thì sẽ trả về "true" và lúc hiển thị lên thì tin nhắn sẽ nằm bên phải và có nền màu xanh, còn không phải chúng ta thì sẽ trả về "false" và tin nhắn sẽ nằm bên trái
                        self.chatMessages.push(new ChatMessage(data[i].content, data[i].timestamp, data[i].from, isMine, data[i].avatar)) // Lưu lại dữ liệu vào trong "self.chatMessages"
                    }

                    $(".chat-body").animate({ screenTop: $(".chat-body")[0].scrollHeight }, 1000)
                })
        }

        // Hiển thị ra tất cả Room đang có trong Database
        self.roomList = function () {
            fetch('/api/Rooms')
                .then(response => response.json())
                .then(data => {
                    console.log(data)
                    self.chatRooms.removeAll() // Xóa hết tất cả room hiện tại đang có ở trong phần khởi tạo
                    for (var i = 0; i < data.length; i++) { // Dùng for để lặp tất cả dữ liệu 
                        self.chatRooms.push(new ChatRoom(data[i].id, data[i].name)) // Add lại dữ liệu room vào trong "self.chatRooms" này
                    }


                    // TỰ ĐỘNG JOIN VÀO 1 ROOM BẤT KỲ
                    // Kiểm tra nếu danh sách room "self.chatRooms()" mà có dữ liệu thì sẽ tự join vào 1 cái room nào đó
                    //if (self.chatRooms().length > 0)
                    //    self.joinRoom(self.chatRooms()[0]) // Join vào 1 room
                })
        }

        // Tạo ra room
        self.createRoom = function () {
            var roomName = $("#roomName").val()
            fetch('/api/Rooms', { // Call API
                method: 'POST', 
                headers: { 'Content-Type': 'application/json' }, // Chuyền header lên là "application/json" nghĩa là Json
                body: JSON.stringify({ name: roomName }) // Chuyển "roomName" sang Json để chuyền lên
            })
        }

        self.createThongbaoJoinRoom = function (idRoom) {
            var id = $("input[type=hidden].id_username").val()
            fetch('/api/Thongbao', {
                method: 'POST',
                headers: { 'content-Type': 'application/json' },
                body: JSON.stringify({ Id_User: id, Id_Room: idRoom })
            }).then(response => {
                if (response.status === 200) {
                    console.log(response)
                    //alert("Gửi yêu cầu tham gia thành công")
                }
            }).catch(error => {
                console.log(error)
            })
        }

        self.deleteRoom = function () {
            fetch('/api/Rooms/' + self.joinedRoomId(), {
                method: 'DELETE',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ id: self.joinedRoomId() })
            })
        }

        self.roomDeleted = function (id) {
            var temp
            ko.utils.arrayForEach(self.chatRooms(), function (room) { // Sử dụng "ko.utils.arrayForEach" để lặp qua danh sách room(self.chatRooms()) hiện có
                if (room.id() == id) // Kiểm tra id room nào trùng với id chuyền vào thì gán dữ liệu room đấy cho biến temp
                    temp = room // Gán dữ liệu room tìm thấy vào biếm temp
            })

            self.chatRooms.remove(temp) // Xóa room
        }

        self.roomAdded = function (room) {
            self.chatRooms.push(room)
        }

        self.userList = function () {

            // Gọi lại hàm "GetUsers" bên "ChatHub.cs" sử dụng "invoke" để gọi lại, "invoke" này nhận vào 2 tham số, tham số đầu tiên là tên của hàm(ở đây tên của hàm cần gọi là "GetUsers"), tham số thứ 2 là: Tham số mà hàm cần đấy cần chuyền vào(ở đây tham số mà hàm "GetUsers" cần chuyền vào là "roomName" nên sẽ chuyền vào đây là "self.joinedRoom()" vì trong "self.joinedRoom()" chứa tên của room)
            connection.invoke("GetUsers", self.joinedRoom()).then(function (result) {
                self.chatUsers.removeAll()
                
                for (var i = 0; i < result.length; i++) {
                    // Add lại dữ liệu vào "self.chatUsers"
                    self.chatUsers.push(new ChatUser(result[i].id, result[i].username, result[i].fullName,
                        result[i].avatar == null ? "default-avatar.jpg" : result[i].avatar,
                        result[i].currentRoom,
                        result[i].device,
                        result[i].role))

                }

            })
        }


        // Hàm sửa Room
        self.editRoom = function () {
            var roomId = self.joinedRoomId()
            var roomName = $("#newRoomName").val()
            fetch('/api/Rooms/' + roomId, { // Call API sửa
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ id: roomId, name: roomName })
            })
        }

        self.roomUpdated = function (updatedRoom) {
            var room = ko.utils.arrayFirst(self.chatRooms(), function (item) { // "ko.utils.arrayFirst" nghĩa là lọc tìm thấy thằng đầu tiên trong cái danh sách "self.chatRooms()" này thì trả ra thằng ý luôn
                return updatedRoom.id() == item.id() // Trả ra thằng đầu tiên trong danh sách được tìm thấy
            })

            room.name(updatedRoom.name())

            if (seft.joinedRoomId() == room.id) { // Kiểm tra room mình vừa tham gia(seft.joinedRoomId()) có bằng với cái room vừa được update(room.id) hay không, nếu bằng thì gọi lại hàm "self.joinRoom" này rồi join lại
                self.joinRoom(room) // Join lại vào Room
                //self.joinedRoom(room.name()) // Chuyền tên room vào để biết mình đang join vào room nào
                //self.joinedRoomId(room.id()) // Và id của room
                //self.userList()
                //self.messageHistory()
            }
        }

        // Hàm up load File
        self.uploadFiles = function () {
            var form = document.getElementById("uploadForm")

            $.ajax({
                type: 'POST',
                url: '/api/Upload',
                data: new FormData(form),
                contentType: false,
                processData: false,
                success: function () {
                    $("#UploadedFile").val("")
                    self.messageHistory()
                },
                error: function (error) {
                    alert('Error: ' + error.responseText)
                }
            })
        }

        // Remove User (Khi người dùng thoát khỏi Web sẽ remove người dùng đấy khỏi "self.chatUsers")
        self.userRemoved = function (id) {
            var temp
            ko.utils.arrayForEach(self.chatUsers(), function (user) { // Lọc qua dánh sách user trong "self.chatUsers()"
                if (user.userName() == id) // Kiểm tra nếu "username" chuyền vào mà trùng với "userName" trong "self.chatUsers()" này thì gán dữ liệu "user" vào biến "temp" rồi xóa "user" đấy khỏi danh sách "self.chatUsers()"
                    temp = user // Gán dữ liệu user vào biến temp

            })
            self.chatMessages.remove(temp) // Xóa "user" khỏi danh sách "self.chatUsers()"
        }
    }

    function ChatUser(id, userName, displayName, avatar, currentRoom, device, role) {
        var seft = this
        seft.id = ko.observable(id)
        seft.userName = ko.observable(userName)
        seft.displayName = ko.observable(displayName)
        seft.avatar = ko.observable(avatar)
        seft.currentRoom = ko.observable(currentRoom)
        seft.device = ko.observable(device)
        seft.role = ko.observable(role)

    }

    function ChatRoom(id, name) {
        var seft = this
        seft.id = ko.observable(id)
        seft.name = ko.observable(name)

    }

    function ChatMessage(content, timestamp, from, isMine, avatar) {
        var seft = this
        seft.content = ko.observable(content)
        seft.timestamp = ko.observable(timestamp)
        seft.from = ko.observable(from)
        seft.isMine = ko.observable(isMine)
        seft.avatar = ko.observable(avatar)
    }


    var viewModel = new AppViewModel()
    ko.applyBindings(viewModel) // "ko.applyBindings(viewModel)" để khắp cái View đấy sẽ nhận được Model này
})