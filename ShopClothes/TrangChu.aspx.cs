using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopClothes
{
    public partial class TrangChu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string re = "";
            if((bool)Session["Login"] && Session["NickName"].Equals("admin@gmail.com"))
            {
                re += "document.getElementsByClassName('sub-menu')[0].style.visibility = 'hidden';\n";
                re += "let logOut= document.getElementById('logOut');\n";
                re += "let abc=`<a href=\"#\">Tài khoản</a>\n";
                re += "<div class=\"sub-menu\">\n";
                re += "<p>ID:"+Session["Id"]+"</p>\n";
                re += "<strong>Email:"+Session["NickName"]+"</strong>\n";
                re += "<a href=\"#\"><p class=\"fas fa-th\">Quản lý mặt hàng</p></a>\n";
                re += "<a href=\"#\"><p class=\"fas fa-users\">Quản lý tài khoản</p></a>\n";
                re += "<a href=\"LogOut.aspx\"><p class=\"fa fa-power-off btnThoat\">Thoát</p></a>\n";
                re += "</div>`\n";
                re += "logOut.innerHTML=abc";

                
            }    
            else if ((bool)Session["Login"])
            {
                re += "document.getElementsByClassName('sub-menu')[0].style.visibility = 'hidden';\n";
                re += "let logOut= document.getElementById('logOut');\n";
                re += "let abc=`<a href=\"#\">Tài khoản</a><div class=\"sub-menu\"> <p>ID:" + Session["Id"] + "</p><strong>Email:" + Session["NickName"] + "</strong><p style=\"background-color:red;color:white;width:100%;border:1px solid red;border-radius:8px\" class=\"fa fa-power-off btnThoat\"><a style=\"text-decoration:none;color:white\" href=\"LogOut.aspx\">Thoát</a></p></div>`\n";
                re += "logOut.innerHTML=abc";
            }






            // var aa= Global.listProduct.FirstOrDefault();



            // Session["Trangchu"] = aa;
            string result = "<script>function loadData(){"+ "var s = document.getElementById('listItemNew'); var sa=\"\"";
            foreach (var aa in Global.listProduct)
            {

                result +=         
                ";sa+=`<div class='item'>" +
                   "<img src ='" + aa.Url_img + "' alt = 'image'>" +
                   "<div class=\"line1\">" +
                        "<p class=\"new\">Mới</p>" +
                        "<p class=\"cost\">" + aa.Gia + "</p>" +
                    "</div>" +

                     "<div class=\"line2\">" +
                       "<center>" +
                            "<ul class=\"buy\">" +
                                "<a href = \"#\" > <li><p class=\"fa fa-heart-o\"></p></li></a>" +
                                "<a href = \"#\" > <li><p class=\"fa fas fa-plus\"></p></li></a>" +

                             "</ul>" +
                        "</center>" +
                    "</div>" +

                    "</div>`;"  ;
            }    
           result += "\ns.innerHTML=sa;\n"+re+"}</script>";


            Response.Write(result);

        }
}
}