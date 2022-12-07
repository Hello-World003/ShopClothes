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