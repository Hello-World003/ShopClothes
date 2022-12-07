function checkTK() {
    let account = document.getElementById("txtAccount").value;
    let pass = document.getElementById('txtPass').value;
    let repass = document.getElementById('txtRepass').value;
    let radiocheck = document.getElementById('Nam').checked;
    let re = document.getElementById('Nu').checked;
    if (account.trim() == '') {
        alert('Bạn chưa nhập Email');
        document.getElementById('txtAccount').focus();
        return false;
    }
    else if (pass.trim() == '') {
        alert('Bạn chưa nhập mật khẩu');
        document.getElementById('txtPass').focus();
        return false;
    }
    else if (repass.trim() == '') {
        alert('Bạn chưa nhập lại mật khẩu');
        document.getElementById('txtRepass').focus();
        return false;
    }
    if (repass != pass) {
        alert('Mật khẩu nhập lại của bạn không khớp');
        document.getElementById('txtRepass').focus();
        return false;
    }

    return true;
}