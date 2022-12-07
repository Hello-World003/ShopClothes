function checkMH() {
    var tenmh = document.getElementById('txtMatHang').value;
    var gia = document.getElementById('txtGia').value;
    var giamgia = document.getElementById('txtgiamgia').value;
    var anh = document.getElementById('FileUpload1').value;
    if (tenmh.trim() == '') {
        alert('Vui lòng nhập tên mặt hàng');
        document.getElementById('txtMatHang').focus();
        return false;
    }
    if (gia.trim() == '') {
        alert('Vui lòng nhập giá tiền');
        document.getElementById('txtgiamgia').value;
        return false;
    }
    if (giamgia.trim() == '') {
        alert('Vui lòng nhập giảm giá');
        document.getElementById('txtgiamgia').focus();
        return false;
    }
    let pa = anh[anh.length - 4] + anh[anh.length - 3] + anh[anh.length - 2] + anh[anh.length - 1];
    let result = checkType(pa);

    return result;
}


function checkType(nameType) {
    nameType = nameType.toLowerCase();
    if (nameType == '.jpg' || nameType == '.png' || nameType == '.gif') {
        return true;
    }
    else {
        alert('Không hỗ trợ file ' + nameType);
        return false;
    }
}