<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuanLyTaiKhoan.aspx.cs" Inherits="ShopClothes.QuanLyTaiKhoan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản Lý Tài Khoản</title>
     <link rel="stylesheet" href="CSS/TrangChu.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="CSS/HienThiTaiKhoan.css">
</head>
<body>
     <div class="page">
        <header>
             <div class="Header">
                <img src="Image/sasy.png" alt="Logo">
                <ul class="navigation">
                    <li class="fa fa-cart-arrow-down"><a href="#">Giỏ hàng</a></li>
                    <li class="fa fa-heart"><a href="#">Ưa thích</a></li>
                    <li class="fa fa-user" id="logOut">
                        <a href="#">Tài khoản</a>
                        <ul class="sub-menu">
                            <li class="fa fa-sign-in"><a href="DangNhap.html">Đăng nhập</a></li>
                            <li class="fa fa-user-plus">
                                <a href="DangKy.html">Đăng ký</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>


            <div class="MyMenu">
                <center>
                    <ul class="Menu">
                        <li> <a href="#">HOME</a></li>
                        <li> <a href="#">WOMEN</a></li>
                        <li> <a href="#">MEN</a></li>
                        <li> <a href="#">CHILDREN</a></li>
                        <li> <a href="#">ABOUT</a></li>
                    </ul>
                </center>
            </div>
        </header>


         <center>
             <br /><br />
             <h5>Tài Khoản</h5>
        <div class="TK_Content">
            <table id="dataTK">
               
            </table>
        </div>
    </center>

    </div>


    <script>
        loadData();
    </script>
</body>
</html>
