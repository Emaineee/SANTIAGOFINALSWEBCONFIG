using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SantiagoSoftDev225262V4
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User"] != null)
                {
                    lblUser.Text = "Logged in as: " + Session["User"].ToString();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}