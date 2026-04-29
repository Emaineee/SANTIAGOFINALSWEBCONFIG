using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SantiagoSoftDev225262V4
{
    public partial class MySite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool loggedIn = Session["User"] != null;

            // LOGIN / LOGOUT UI
            pnlLogin.Visible = !loggedIn;
            pnlUser.Visible = loggedIn;
            pnlMenu.Visible = loggedIn;

            if (loggedIn)
            {
                lblUser.Text = Session["User"].ToString();
                lblAppName.Text = Session["User"].ToString() + " | Web Application";
            }
            else
            {
                lblAppName.Text = "Web Application";
            }

            // ACTIVE PAGE HIGHLIGHT
            string page = Request.AppRelativeCurrentExecutionFilePath.ToLower();

            ResetNav();

            if (page.Contains("student"))
                lnkStudent.Attributes["class"] = "nav-link active";

            else if (page.Contains("program"))
                lnkProgram.Attributes["class"] = "nav-link active";

            else if (page.Contains("college"))
                lnkCollege.Attributes["class"] = "nav-link active";
        }

        private void ResetNav()
        {
            lnkStudent.Attributes["class"] = "nav-link";
            lnkProgram.Attributes["class"] = "nav-link";
            lnkCollege.Attributes["class"] = "nav-link";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}