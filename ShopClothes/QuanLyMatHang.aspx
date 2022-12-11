<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuanLyMatHang.aspx.cs" Inherits="ShopClothes.QuanLyMatHang" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="CSS/TrangChu.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="CSS/DangKy.css">
    <link rel="stylesheet" href="CSS/HienThiMatHang.css">
    <script src="JS/QuanLyMatHang.js"></script>
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


        <div class="contentDangKy">
            <center>
                <div class="DK_content">
                  
                    <h3>Mặt Hàng</h3>

                    <form onsubmit="return checkMH()" id="form1" runat="server">
                        <label for="ql_mathang">Tên mặt hàng</label>
                        <input type="text" name="txtMatHang" id="txtMatHang" placeholder="Tên hàng"> <br>
                        <label for="ql_gia">Giá</label>
                        <input type="number" name="txtGia" id="txtGia" placeholder="100000"> <br>
                        <label style="width:30px" for="ql_giamgia">Giảm giá</label>
                        <input type="number" name="txtgiamgia" id="txtgiamgia" placeholder="0"> <br>
                        <label for="type_">Loại</label>
                        <select name="type" id="type">
                            <option value="male">Nam</option>
                            <option value="female">Nữ</option>
                            <option value="children">Trẻ Em</option>
                        </select> <br>

                        <label for="ql_anh">Ảnh</label>
                        <asp:FileUpload ID="FileUpload1" runat="server"/>
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Thêm" class="btn" OnClick="Button1_Click"/>
                        <br>
                        <%--<input type="submit" value="Thêm" class="btn">--%>

                        
                    </form>
                </div>
            </center>
        </div>

      


         <br />
       <br />
       <div>
           <center>
               <table id="data" class="Khung">
                  
               </table>
           </center>
       </div>



    </div>
       

    <script>
        loadData();
    </script>
</body>
</html>
