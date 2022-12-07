using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopClothes
{
    public partial class LogOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Session["Login"] = false;
            Session["Id"] = "";
            Session["NickName"] = "";
            Session["Pass"] = "";
            Response.Redirect("TrangChu.aspx");
        }
    }
}