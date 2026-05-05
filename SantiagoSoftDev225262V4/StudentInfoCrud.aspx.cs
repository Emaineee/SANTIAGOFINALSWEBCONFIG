using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SantiagoSoftDev225262V4
{
    public partial class StudentInfoCrud : System.Web.UI.Page
    {
        protected System.Web.UI.HtmlControls.HtmlGenericControl studTotalCount;
        protected System.Web.UI.HtmlControls.HtmlGenericControl studMaleCount;
        protected System.Web.UI.HtmlControls.HtmlGenericControl studFemaleCount;

        protected void Page_Load(object sender, EventArgs e)
        {
            //  FIX: Session check must come FIRST before anything else runs
            if (Session["User"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                PanelStudent.Visible = false;
                GridView1.Visible = true;
                lblMessage.Visible = false;

                BindProgramDropdown();
                GridView1.DataBind();
                LoadStudentCounts();
            }
        }

        private void LoadStudentCounts()
        {
            try
            {
                string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString3"].ConnectionString;
                using (System.Data.OleDb.OleDbConnection conn = new System.Data.OleDb.OleDbConnection(connStr))
                {
                    conn.Open();
                    studTotalCount.InnerText = new System.Data.OleDb.OleDbCommand("SELECT COUNT(*) FROM tbl_StudentInfo WHERE deleted = 0", conn).ExecuteScalar().ToString();
                    studMaleCount.InnerText = new System.Data.OleDb.OleDbCommand("SELECT COUNT(*) FROM tbl_StudentInfo WHERE deleted = 0 AND Sex = 'Male'", conn).ExecuteScalar().ToString();
                    studFemaleCount.InnerText = new System.Data.OleDb.OleDbCommand("SELECT COUNT(*) FROM tbl_StudentInfo WHERE deleted = 0 AND Sex = 'Female'", conn).ExecuteScalar().ToString();
                }
            }
            catch { }
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
                ShowMessage("Student added successfully!", isError: false);
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, isError: true);
            }

            ResetView();
        }

        #endregion


        #region UPDATE

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow == null) return;

            hfStudentID.Value = GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString();

            txtStudentID.Text   = Server.HtmlDecode(GridView1.SelectedRow.Cells[2].Text);
            txtFirstname.Text   = Server.HtmlDecode(GridView1.SelectedRow.Cells[3].Text);
            txtMiddlename.Text  = Server.HtmlDecode(GridView1.SelectedRow.Cells[4].Text);
            txtLastname.Text    = Server.HtmlDecode(GridView1.SelectedRow.Cells[5].Text);

            //  FIX: TextMode="Date" requires yyyy-MM-dd format.
            // The grid displays MM/dd/yyyy (DataFormatString), so we parse and reformat.
            string rawBday = Server.HtmlDecode(GridView1.SelectedRow.Cells[6].Text);
            if (DateTime.TryParse(rawBday, out DateTime bday))
                txtBday.Text = bday.ToString("yyyy-MM-dd");
            else
                txtBday.Text = "";

            // FIX: Sex values are "Male"/"Female" - match exactly
            string sex = Server.HtmlDecode(GridView1.SelectedRow.Cells[7].Text);
            ListItem sexItem = ddlSex.Items.FindByValue(sex);
            if (sexItem != null)
                ddlSex.SelectedValue = sex;

            // Program: grid shows code text; find matching item by text
            string programCode = Server.HtmlDecode(GridView1.SelectedRow.Cells[8].Text);
            BindProgramDropdown();
            ListItem programItem = ddlProgram.Items.FindByText(programCode);
            if (programItem != null)
                ddlProgram.SelectedValue = programItem.Value;

            txtYearLevel.Text = Server.HtmlDecode(GridView1.SelectedRow.Cells[9].Text);

            PanelStudent.Visible = true;
            GridView1.Visible = false;
            btnSaveStudent.Visible = false;
            btnUpdateStudent.Visible = true;
            lbtnAddNewRecord.Visible = false;
        }

        protected void btnUpdateStudent_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(hfStudentID.Value))
                {
                    //  FIX: Re-bind program dropdown so SelectedValue is available for the update
                    BindProgramDropdown();
                    SqlDataSource1.Update();
                    ShowMessage("Student updated successfully!", isError: false);
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, isError: true);
            }

            ResetView();
        }

        #endregion


        #region DELETE

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                ShowMessage("Student deleted successfully!", isError: false);
            }
            else
            {
                ShowMessage("Error deleting student: " + e.Exception.Message, isError: true);
                e.ExceptionHandled = true;
            }

            GridView1.DataBind();
        }

        #endregion


        #region CANCEL

        protected void btnCancelStudent_Click(object sender, EventArgs e)
        {
            ResetView();
            lblMessage.Visible = false;
        }

        #endregion


        #region METHODS

        /// <summary>
        ///  FIX: Shows lblMessage with the correct CSS class (green = success, red = error).
        /// Previously the class was hardcoded to msg-success even for errors.
        /// </summary>
        private void ShowMessage(string message, bool isError)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = isError
                ? "msg-bar msg-error"
                : "msg-bar msg-success";
            lblMessage.Visible = true;
        }

        private void BindProgramDropdown()
        {
            ddlProgram.DataBind();

            if (ddlProgram.Items.Count == 0)
                ddlProgram.Items.Add(new ListItem("-- No programs available --", "0"));
        }

        private void ClearForm()
        {
            hfStudentID.Value   = "";
            txtStudentID.Text   = "";
            txtFirstname.Text   = "";
            txtMiddlename.Text  = "";
            txtLastname.Text    = "";
            txtBday.Text        = "";
            ddlSex.SelectedIndex = 0;
            ddlProgram.SelectedIndex = 0;   //  FIX: also reset program dropdown
            txtYearLevel.Text   = "";
        }

        private void ResetView()
        {
            ClearForm();

            PanelStudent.Visible = false;
            GridView1.Visible = true;
            lbtnAddNewRecord.Visible = true;

            GridView1.DataBind();
            LoadStudentCounts();
        }

        #endregion
    }
}
