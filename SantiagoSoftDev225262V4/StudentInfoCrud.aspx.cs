using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SantiagoSoftDev225262V4
{
    public partial class StudentInfoCrud : System.Web.UI.Page
    {
        private const bool V = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PanelStudent.Visible = false;
                GridView1.Visible = true;
                lblMessage.Visible = V;

                BindProgramDropdown();
                GridView1.DataBind(); // ✅ IMPORTANT (forces load)
            }
            if (Session["User"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
        }

        #region INSERT

        protected void lbtnAddNewRecord_Click(object sender, EventArgs e)
        {
            PanelStudent.Visible = true;
            GridView1.Visible = false;
            lbtnAddNewRecord.Visible = false;

            ClearForm();

            btnSaveStudent.Visible = true;
            btnUpdateStudent.Visible = false;
        }

        protected void btnSaveStudent_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.Insert();
                lblMessage.Text = "Student added successfully!";
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.Visible = true;
            }

            ResetView();
        }

        #endregion


        #region UPDATE

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow != null)
            {
                hfStudentID.Value = GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString();

                // ✅ FIX: safer cell reading
                txtStudentID.Text = Server.HtmlDecode(GridView1.SelectedRow.Cells[2].Text);
                txtFirstname.Text = Server.HtmlDecode(GridView1.SelectedRow.Cells[3].Text);
                txtMiddlename.Text = Server.HtmlDecode(GridView1.SelectedRow.Cells[4].Text);
                txtLastname.Text = Server.HtmlDecode(GridView1.SelectedRow.Cells[5].Text);
                txtBday.Text = Server.HtmlDecode(GridView1.SelectedRow.Cells[6].Text);

                string sex = Server.HtmlDecode(GridView1.SelectedRow.Cells[7].Text);
                if (ddlSex.Items.FindByValue(sex) != null)
                    ddlSex.SelectedValue = sex;

                string programCode = Server.HtmlDecode(GridView1.SelectedRow.Cells[8].Text);

                BindProgramDropdown();
                ListItem item = ddlProgram.Items.FindByText(programCode);
                if (item != null)
                    ddlProgram.SelectedValue = item.Value;

                txtYearLevel.Text = Server.HtmlDecode(GridView1.SelectedRow.Cells[9].Text);

                PanelStudent.Visible = true;
                GridView1.Visible = false;
                btnSaveStudent.Visible = false;
                btnUpdateStudent.Visible = true;
                lbtnAddNewRecord.Visible = false;
            }
        }

        protected void btnUpdateStudent_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(hfStudentID.Value))
                {
                    SqlDataSource1.Update();
                    lblMessage.Text = "Student updated successfully!";
                    lblMessage.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.Visible = true;
            }

            ResetView();
        }

        #endregion


        #region DELETE

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                lblMessage.Text = "Student deleted successfully!";
            }
            else
            {
                lblMessage.Text = "Error deleting student: " + e.Exception.Message;
                e.ExceptionHandled = true;
            }

            lblMessage.Visible = true;
            GridView1.DataBind();
        }

        #endregion


        #region CANCEL

        protected void btnCancelStudent_Click(object sender, EventArgs e)
        {
            ResetView();
            lblMessage.Text = "";
        }

        #endregion


        #region METHODS

        private void BindProgramDropdown()
        {
            ddlProgram.DataBind();

            if (ddlProgram.Items.Count == 0)
            {
                ddlProgram.Items.Add(new ListItem("-- No programs available --", "0"));
            }
        }

        private void ClearForm()
        {
            hfStudentID.Value = "";
            txtStudentID.Text = "";
            txtFirstname.Text = "";
            txtMiddlename.Text = "";
            txtLastname.Text = "";
            txtBday.Text = "";
            ddlSex.SelectedIndex = 0;
            txtYearLevel.Text = "";
        }

        // ✅ NEW CLEAN METHOD (VERY IMPORTANT)
        private void ResetView()
        {
            ClearForm();

            PanelStudent.Visible = false;
            GridView1.Visible = true;
            lbtnAddNewRecord.Visible = true;

            GridView1.DataBind();
        }

        #endregion
    }
}