using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SantiagoSoftDev225262V4
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void btnRadioButton_Click(object sender, EventArgs e)
        {
            var val1 = "";
            RadioButton selectedRadioButton = Panel1.Controls.OfType<RadioButton>().FirstOrDefault
                (rb => rb.GroupName == "YearLevel" && rb.Checked);
            if (selectedRadioButton != null)
            {
                switch (selectedRadioButton.ID)
                {
                    case "rdbtn1":
                        val1 = rdbtn1.Text;
                        break;
                    case "rdbtn2":
                        val1 = rdbtn2.Text;
                        break;
                    case "rdbtn3":
                        val1 = rdbtn3.Text;
                        break;
                    case "rdbtn4":
                        val1 = rdbtn4.Text;
                        break;
                }
                lblRadioButton.Text = "The year level selected is " + val1;
            }
        }
    }
}