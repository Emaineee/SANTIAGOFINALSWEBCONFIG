using System;
using System.Web.UI;

namespace SantiagoSoftDev225262V4
{
    public partial class MySite : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool isLoggedIn = Session["User"] != null;

            // Show/hide secured nav section
            pnlSecuredNav.Visible = isLoggedIn;
            pnlUserInfo.Visible   = isLoggedIn;
            pnlGuest.Visible      = !isLoggedIn;

            if (isLoggedIn)
                litUsername.Text = Server.HtmlEncode(Session["User"].ToString());
        }

        /// <summary>Destroys session and redirects to landing/login page.</summary>
        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            // Prevent back-button cache access
            Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));

            Response.Redirect("~/Login.aspx");
        }
    }
}
