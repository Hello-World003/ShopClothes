<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="ShopClothes.TrangChu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="CSS/TrangChu.css">
    <title>Trang Chu</title>
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

        <div class="content1">
            <img src="Image/slider-1-3.png" alt="Slider" cl>
            <div class="chu">
                <p>SASSY GIRL </p>
                <p>LOVE MINIMAL STYLE</p>
            </div>
        </div>

        <div class="content2">
             <div class="newArrival">
                    <div class="title">
                        <p>SẢN PHẨM MỚI</p>
                    </div>

                    <div id="listItemNew">
                
                   
                    </div>
            </div>


             <div class="bestSeller">
                <div class="title">
                    <p>BÁN CHẠY</p>
                </div>


                <div class="listBestSell">
                    <div class="itemSell">
                        <img src="Image/1sell.png" alt="">
                        <div class="chuTo">
                            <p>Aó thun</p>
                            <p>350000</p>
                            <img src="5-Star-Rating-PNG-High-Quality-Image.png" alt="">
                        </div>
                    </div>
                    <div class="itemSell">
                        <img src="1sell.png" alt="">
                        <div class="chuTo">
                            <p>Aó thun</p>
                            <p>350000</p>
                            <img src="5-Star-Rating-PNG-High-Quality-Image.png" alt="">
                        </div>
                    </div>
                    <div class="itemSell">
                        <img src="1sell.png" alt="">
                        <div class="chuTo">
                            <p>Aó thun</p>
                            <p>350000</p>
                            <img src="5-Star-Rating-PNG-High-Quality-Image.png" alt="">
                        </div>
                    </div>
                    <div class="itemSell">
                        <img src="1sell.png" alt="">
                        <div class="chuTo">
                            <p>Aó thun</p>
                            <p>350000</p>
                            <img src="5-Star-Rating-PNG-High-Quality-Image.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
       
     

    <script>
       /* document.getElementsByClassName('sub-menu')[0].style.visibility = 'hidden';*/
        loadData();
    </script>
</body>
</html>
