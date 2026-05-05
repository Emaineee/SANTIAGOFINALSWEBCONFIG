using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SantiagoSoftDev225262V4
{
    public partial class ProgramCrud : Page
    {
        protected System.Web.UI.HtmlControls.HtmlGenericControl progTotalCount;
        protected System.Web.UI.HtmlControls.HtmlGenericControl progCollegeCount;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                DdlCollege.DataBind();
                InitializePage();
                LoadProgramCounts();
            }
        }

        private void LoadProgramCounts()
        {
            try
            {
                string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString3"].ConnectionString;
                using (System.Data.OleDb.OleDbConnection conn = new System.Data.OleDb.OleDbConnection(connStr))
                {
                    conn.Open();
                    progTotalCount.InnerText = new System.Data.OleDb.OleDbCommand("SELECT COUNT(*) FROM tbl_Program WHERE deleted = 0", conn).ExecuteScalar().ToString();
                    progCollegeCount.InnerText = new System.Data.OleDb.OleDbCommand("SELECT COUNT(DISTINCT collegeID) FROM tbl_Program WHERE deleted = 0", conn).ExecuteScalar().ToString();
                }
            }
            catch { }
        }

        #region INSERT

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (DdlCollege.SelectedIndex == 0)
            {
                ShowMessage("Please select a college.");
                return;
            }

            SqlDataSource1.Insert();

            // 🔥 FORCE BACK TO MAIN GRID
            GridView1.DataBind();
            Panel1.Visible = false;
            GridView1.Visible = true;
            LbtnAddNewRecord.Visible = true;

            LoadProgramCounts();
            ShowMessage("Record Inserted Successfully");
        }

        #endregion

        #region UPDATE

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedDataKey != null)
            {
                SqlDataSource1.UpdateParameters["programID"].DefaultValue =
                    GridView1.SelectedDataKey["programID"].ToString();

                SqlDataSource1.Update();

                // 🔥 RETURN TO MAIN PAGE
                GridView1.DataBind();
                Panel1.Visible = false;
                GridView1.Visible = true;
                LbtnAddNewRecord.Visible = true;

                LoadProgramCounts();
                ShowMessage("Record Updated Successfully");
            }
            else
            {
                ShowMessage("Please select a row to update.");
            }
        }

        #endregion

        #region DELETE

        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            GridView1.DataBind();

            Panel1.Visible = false;
            GridView1.Visible = true;
            LbtnAddNewRecord.Visible = true;

            ShowMessage("Record Deleted Successfully");
            LoadProgramCounts();
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
        }

        #endregion

        #region GRIDVIEW

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;

            TxtDescription.Text = row.Cells[1].Text;
            TxtCode.Text = row.Cells[2].Text;

            string collegeID = GridView1.DataKeys[row.RowIndex]["collegeID"].ToString();

            ListItem li = DdlCollege.Items.FindByValue(collegeID);
            if (li != null)
                DdlCollege.SelectedValue = collegeID;
            else
                DdlCollege.SelectedIndex = 0;

            Panel1.Visible = true;
            GridView1.Visible = false;
            LbtnAddNewRecord.Visible = false;

            BtnSave.Visible = false;
            BtnUpdate.Visible = true;
        }

        #endregion

        #region ADD / CANCEL

        protected void LbtnAddNewRecord_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            GridView1.Visible = false;
            LbtnAddNewRecord.Visible = false;

            lblMessege.Visible = false;

            TxtDescription.Text = "";
            TxtCode.Text = "";
            DdlCollege.SelectedIndex = 0;

            BtnSave.Visible = true;
            BtnUpdate.Visible = false;
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            InitializePage();
        }

        #endregion

        #region METHODS

        private void InitializePage()
        {
            TxtDescription.Text = "";
            TxtCode.Text = "";
            DdlCollege.SelectedIndex = 0;

            Panel1.Visible = false;

            GridView1.Visible = true;
            GridView1.DataBind();

            LbtnAddNewRecord.Visible = true;

            lblMessege.Visible = false;
            lblMessege.Text = "";
        }

        private void ShowMessage(string msg)
        {
            lblMessege.Visible = true;
            lblMessege.Text = msg;

            string script = @"<script type='text/javascript'>
                setTimeout(function() {
                    var lbl = document.getElementById('" + lblMessege.ClientID + @"');
                    if(lbl) lbl.style.display = 'none';
                }, 1500);
            </script>";

            ClientScript.RegisterStartupScript(this.GetType(), "HideMessage", script);
        }

        #endregion
    }
}