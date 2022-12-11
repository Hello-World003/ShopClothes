using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopClothes.Models;
using System.IO;

namespace ShopClothes
{
    public partial class QuanLyMatHang : System.Web.UI.Page
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

            string path = "listProduct.xml";
            List<Product> products=new List<Product>();

            if (File.Exists(Server.MapPath(path)))
            {
                //Đọc file
                System.Xml.Serialization.XmlSerializer reader = new System.Xml.Serialization.XmlSerializer(typeof(List<Product>));
                StreamReader file = new StreamReader(Server.MapPath(path));

                products = (List<Product>)reader.Deserialize(file);
                products = products.OrderBy(p => p.Id).ToList();
                file.Close();
            }

            re += "var display=document.getElementById('data');\n";
            re += "var datas='';\n";

            foreach(Product product in products)
            {
                re += "datas+=`<tr>\n";
                re += "<td>\n";
                re+="<img height=\"200px\" src=\""+product.Url_img+"\" alt =\"\">\n";
                re += "</td>\n";
                re += "<td>\n";
                re += "<h4>" + product.Tensp + "</h4> <br><br>\n";
                re += "<p>Loại:" + (product.Loai.Equals("male") ? "Nam" : (product.Loai.Equals("female") ? "Nữ" : "Trẻ Em")) + "</p>\n";
                re += "</td>\n";
                re += "<td>\n";
                re +="<p class=\"gia\">Giá gốc:"+product.Gia+"</p>\n";
                re +="<p class=\"gia\">Giảm giá:"+product.Sale+"%</p>\n";
                re += "<p class=\"gia\">Giá:" + (product.Gia - (product.Gia * (product.Sale / (double)100))) + "</p>\n";
                re += "</td>\n";
                re += "<td>\n";
                re += "<form action=\"QuanLyMatHang.aspx\">\n";
                re += "<button class=\"btnDelete fa fa-remove\" type=\"submit\" value=\""+product.Id+"\" name=\"btnXoa\">\n";
                re += "Xóa\n";
                re += "</button>\n";
                re += "</form></td>\n";
                re += "</tr>`\n";
            }


            re += "\n display.innerHTML=datas}</script>";
            Response.Write(re);


            if (Request.QueryString["btnXoa"] != null)
            {
                foreach (var product in products)
                {
                    if (Request.QueryString["btnXoa"].Equals(Convert.ToString(product.Id)))
                    {
                        products.Remove(product);
                        
                        //Ghi file

                        System.Xml.Serialization.XmlSerializer writer =
                            new System.Xml.Serialization.XmlSerializer(typeof(List<Product>));
                        System.IO.FileStream _file = System.IO.File.Create(Server.MapPath(path));
                        
                        writer.Serialize(_file,products);
                        
                        _file.Close();
                        Response.Redirect(Request.Url.ToString(),true);
                        break;
                    }
                }
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //if(FileUpload1.HasFile)
            //{
            //    string fileName="Image/"+FileUpload1.FileName;
            //    string filePath=Server.MapPath(fileName);
            //   // FileUpload1.SaveAs(filePath);
            //    Image1.ImageUrl = fileName;
            //}    

            string fileName = "Image/" + FileUpload1.FileName;
            string filePath = Server.MapPath(fileName);
            FileUpload1.SaveAs(filePath);
            string path = "listProduct.xml";

            float costsss = Convert.ToInt32(Request.Form["txtGia"]);
            float sale = Convert.ToInt32(Request.Form["txtgiamgia"]);
            List<Product> list = new List<Product>();

            if(File.Exists(Server.MapPath(path)))
            {
                //Đọc file
                System.Xml.Serialization.XmlSerializer reader = new System.Xml.Serialization.XmlSerializer(typeof(List<Product>));
                StreamReader file=new StreamReader(Server.MapPath(path));

                list = (List<Product>)reader.Deserialize(file);
                list = list.OrderBy(p => p.Id).ToList();
                file.Close();
            }

            Product product = new Product(list.Count, Request.Form["txtMatHang"],(int)costsss, Request.Form["type"], fileName, (int)sale);


            bool checkSame=false;
            foreach(Product p in list)
            {
                if(p.Tensp == product.Tensp)
                {
                    product.Id= p.Id;
                    checkSame = true;
                    break;
                }    
            } 
            
            if(!checkSame)
            {
                list.Add(product);
                //Ghi file
                System.Xml.Serialization.XmlSerializer writer = new System.Xml.Serialization.XmlSerializer(typeof(List<Product>));

                System.IO.FileStream file2=System.IO.File.Create(Server.MapPath(path));
                writer.Serialize(file2, list);
                file2.Close();

                Response.Redirect(Request.Url.ToString(),true);
            }
            else
            {
                string ale = "";
                ale += "<script>alert('Mặt hàng đã tồn tại')</script>";
                Response.Write(ale);  
            }
        }
    }
}