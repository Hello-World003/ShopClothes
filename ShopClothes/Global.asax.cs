using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using ShopClothes.Models;

namespace ShopClothes
{
    public class Global : System.Web.HttpApplication
    {
        public static List<Product> listProduct=new List<Product>();
        protected void Application_Start(object sender, EventArgs e)
        {
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            //listProduct.Add(new Product(1, "Giay", 350000, "Image/1.png", 0));

            Session["Login"] = false;
            Session["Id"] = "";
            Session["NickName"] = "";
            Session["Pass"] = "";

           // Session["Cart"] = "";
        }
    }
}