using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SantiagoSoftDev225262V4
{
    public partial class MySite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool loggedIn = Session["User"] != null;

            // Show/hide sidebar panels based on login state
            pnlLogin.Visible        = !loggedIn;
            pnlUser.Visible         = loggedIn;
            pnlMenu.Visible         = loggedIn;
            pnlLogoutSidebar.Visible = loggedIn;
            pnlTopUser.Visible      = loggedIn;

            if (loggedIn)
            {
                lblUser.Text    = Session["User"].ToString();
                lblTopUser.Text = Session["User"].ToString();
                lblAppName.Text = "SoftDev Management System";
            }
            else
            {
                lblAppName.Text = "SoftDev Management System";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Destroy session and prevent back-button access
            Session.Clear();
            Session.Abandon();

            Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));

            Response.Redirect("~/Login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
