function check() {
    var mail = document.getElementById('txtemail').value;
    var pass = document.getElementById('txtpass').value;
    if (mail.trim() == '') {
        alert('Bạn chưa điền tên đăng nhập');
        document.getElementById('txtemail').focus();
        return false;
    }
    else if (pass.trim() == '') {
        alert('Bạn chưa điền mật khẩu');
        document.getElementById('txtpass').focus();
        return false;
    }

    return true;
}