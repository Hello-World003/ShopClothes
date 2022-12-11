using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopClothes.Models;

namespace ShopClothes
{
    public partial class QuanLyTaiKhoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string re = "<script> function loadData(){";
            if ((bool)Session["Login"] && Session["NickName"].Equals("admin@gmail.com"))
            {
                re += "document.getElementsByClassName('sub-menu')[0].style.visibility = 'hidden';\n";
                re += "let logOut= document.getElementById('logOut');\n";
                re += "let abc=`<a href=\"#\">Tài khoản</a>\n";
                re += "<div style=\"z-index:2;\" class=\"sub-menu\">\n";
                re += "<p>ID:" + Session["Id"] + "</p>\n";
                re += "<strong>Email:" + Session["NickName"] + "</strong>\n";
                re += "<a href=\"QuanLyMatHang.aspx\"><p class=\"fas fa-th\">Quản lý mặt hàng</p></a>\n";
                re += "<a href=\"QuanLyTaiKhoan.aspx\"><p class=\"fas fa-users\">Quản lý tài khoản</p></a>\n";
                re += "<a href=\"LogOut.aspx\"><p class=\"fa fa-power-off btnThoat\">Thoát</p></a>\n";
                re += "</div>`\n";
                re += "logOut.innerHTML=abc\n";
            }
            else
            {
                Response.Redirect("TrangChu.aspx");
            }


            string path = "listMember.xml";
            List<Member> members= new List<Member>();

            if (File.Exists(Server.MapPath(path)))
            {
                //Đọc file
                System.Xml.Serialization.XmlSerializer reader = new System.Xml.Serialization.XmlSerializer(typeof(List<Member>));
                StreamReader file = new StreamReader(Server.MapPath(path));

                members = (List<Member>)reader.Deserialize(file);
                members = members.OrderBy(p => p.Id).ToList();
                file.Close();
            }

            re += "var display=document.getElementById('dataTK');\n";
            re += "var datas='';\n";
            re += "datas=`\n";
            re += "<tr>\n";
            re += "<th style=\"width:10%;\">ID</th>\n";
            re += "<th style=\"width:60%;\">Email</th>\n";
            re += "<th style=\"width:15%;\">Pass</th>\n";
            re += "<th style=\"width:15%;\">Chức năng</th>\n";
            re += "</tr>\n";

            foreach (Member m in members)
            {
                re += "<tr>\n";
                re +="<td style=\"width:10%\">"+m.Id+"</td>\n";
                re+="<td style=\"width:10%\">"+m.NickName+"</td>\n";
                re+="<td style=\"width:10%\">"+m.Pass+"</td>\n";
                re += "<td style=\"width:10%\">\n";
                re += "<form action=\"QuanLyTaiKhoan.aspx\">\n";
                re += "<button class=\"btnRemove fa fa-remove\" type=\"submit\" value=\"" + m.Id + "\" name=\"btnXoaTK\">Xóa</button>";
                re += "</form>\n";
                re += "</td>\n";
                re += "</tr>\n";
            }
            re += "`\n";
            re += "display.innerHTML=datas\n";
            re += "}</script>\n";

            Response.Write(re);


            if (Request.QueryString["btnXoaTK"] != null)
            {
                foreach (var m in members)
                {
                    if (Request.QueryString["btnXoaTK"].Equals(Convert.ToString(m.Id)))
                    {
                        members.Remove(m);
                        
                        //Ghi file
                        System.Xml.Serialization.XmlSerializer writer =
                            new System.Xml.Serialization.XmlSerializer(typeof(List<Member>));
                        System.IO.FileStream _file = System.IO.File.Create(Server.MapPath(path));
                        
                        writer.Serialize(_file,members);
                        _file.Close();
                        
                        Response.Redirect(Request.Url.ToString(),true);
                        break;
                    }
                }
            }
        }
    }
}