// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

$(function () {
    

    // Khi click vào thẻ ul thì sẽ click luôn vào thằng "li"
    $('ul#users-list').on("click", 'li', function () {
        var username = $("input[type=hidden].username", $(this)).val() // lấy ra username trong thẻ input có type là "hidden"
        var input = $("#chat-message") // lấy ra id "chat-message"
        
        var text = input.val() // Lấy ra giá trị hiện tại của Input đấy
        if (text.startsWith("/")) { // Kiểm tra xem có dấu "/" không
            text = text.split(")")[1] // Nếu có dấu "/" thì cắt bỏ dấu ")" sử dụng hàm "split" để cắt,
            /*"[1]": Sau khi tách chuỗi, chúng ta chọn phần tử thứ hai trong mảng(vị trí 1), chỉ số
                bắt đầu từ 0. Điều này có nghĩa là chúng ta lấy phần tử sau dấu ) đầu tiên.
                
                Ví dụ, giả sử text = "abc)def)ghi", sau khi thực hiện text.split(")"), kết quả sẽ là ['abc', 'def', 'ghi']. Sau đó, 
                chúng ta chọn phần tử thứ hai ('def'), và lưu nó vào biến text. Do đó, text sẽ được gán giá trị là 'def'
            */
        }

        // Nếu không có 
        text = "/private(" + username + ") " + text.trim() // "trim()" là cắt 2 khoảng trắng 2 bên
        input.val(text)
        input.change() // "change()"  này nghĩa là lập tức thay đổi giá trị ở trên thẻ input này
        input.focus()
    })

    // 'a' ở đây nghĩa là click trên từng thẻ "a"
    $('#emojis-container').on('click', 'a', function () {
        console.log("Đã vào")
        var value = $("input", $(this)).val() // Lấy giá trị ở thể "input" ở thẻ "a" khi click vào thẻ "a"
        var input = $("#chat-message")
        input.val(input.val() + value) // Cộng giá trị, sét lại giá trị cho thẻ "input"
        input.focus()
        input.change() // Cộng xong cập nhật luôn thẻ input
    })

    $("#emojibtn").click(function () {
        $("#emojis-container").toggleClass("d-none")
    })

    $("#chat-message, #btn-send-message").click(function () {
        $("#emojis-container").addClass("d-none")
    })

    $(".modal").on("hidden.bs.modal", function () {
        $(".modal-body input:not(#newRoomName)").val("")
    })

    $(".alert .close").on('click', function () {
        $(this).parent().hide()
    })
})