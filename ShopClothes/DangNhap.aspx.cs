using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopClothes.Models;
using System.IO;
using System.Threading;

namespace ShopClothes
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if((bool)Session["Login"])
            {
                Response.Redirect("TrangChu.aspx");
            }
            string path = "listMember.xml";

            List<Member> list = new List<Member>();

            if(File.Exists(Server.MapPath(path)))
            {
                //Doc file 
                System.Xml.Serialization.XmlSerializer reader = new System.Xml.Serialization.XmlSerializer(typeof(List<Member>));
                StreamReader file=new StreamReader(Server.MapPath(path));

                list = (List<Member>)reader.Deserialize(file);
                list = list.OrderBy(Member => Member.Id).ToList();
                file.Close();
            } 
            
            Member a=new Member(0,Request.QueryString["txtemail"],Request.QueryString["txtpass"]);

            bool checkSame = false;
            foreach(Member me in list)
            {
                if(me.NickName.Equals(a.NickName) && me.Pass.Equals(a.Pass))
                {
                    a.Id=me.Id;
                    checkSame= true;
                    break;
                }    
            }  
            
            if(checkSame)
            {
                Session["Login"] = true;
                Session["NickName"] = a.NickName;
                Session["Id"] = a.Id;
                Session["Pass"] = a.Pass;
            }
            else
            {
                string alert = "";
                alert += "<script>alert('Tài khoản và mật khẩu không đúng')</script>";
                Response.Write(alert);
            }


            if((bool)Session["Login"])
            {
                Response.Redirect("TrangChu.aspx");
            }    
        }
    }
}