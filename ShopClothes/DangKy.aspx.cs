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
    public partial class DangKy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = "listMember.xml";

            if((bool)Session["Login"]==true)
            {
                Response.Redirect("TrangChu.aspx");
            }
            List<Member> list = new List<Member>();

            if(File.Exists(Server.MapPath(path)))
            {
                //Doc file
                System.Xml.Serialization.XmlSerializer reader=new System.Xml.Serialization.XmlSerializer(typeof(List<Member>));
                StreamReader file=new StreamReader(Server.MapPath(path));

                list = (List<Member>)reader.Deserialize(file);
                list = list.OrderBy(Member => Member.Id).ToList();
                file.Close();
            }

            Member a = new Member(list.Count,Request.QueryString["txtAccount"],Request.QueryString["txtPass"]);


            bool checkSameValue = false;
            foreach(Member m in list)
            {
                if(a.NickName == m.NickName)
                {
                    checkSameValue = true;
                    break;
                }    
            }    

            if(!checkSameValue)
            {
                list.Add(a);

                //Ghi file
                System.Xml.Serialization.XmlSerializer writer = new System.Xml.Serialization.XmlSerializer(typeof(List<Member>));
                System.IO.FileStream _file=System.IO.File.Create(Server.MapPath(path));

                writer.Serialize(_file, list);
                _file.Close();


                //Tạo session
                Session["Login"] = true;
                Session["Id"] = a.Id;
                Session["NickName"] = a.NickName;
                Session["Pass"] = a.Pass;

                if((bool)Session["Login"]==true)
                {
                    Response.Redirect("TrangChu.aspx");
                }
            }
            else
            {
                string alert = "";
                alert += "<script> alert('Tài khoản đã tồn tại!')</script>";
                Response.Write(alert);
            }
        }
    }
}