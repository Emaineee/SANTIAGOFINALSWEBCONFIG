using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SantiagoSoftDev225262V4
{
    public partial class CollegeCrud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                Panel1.Visible = false;
                lblMessege.Visible = false;
                GridView1.Visible = true;

            }
            if (Session["User"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

        }

        #region "INSERT"

        protected void LbtnAddNewRecord_Click(object sender, EventArgs e)
        {
            PageAddEdit();
            GridView1.Visible = false;
            LbtnAddNewRecord.Visible = false;
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Insert();
        }

        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            PageInitialize();
            MyMessage("Record Inserted Successfully");
        }

        #endregion 

        #region "UPDATE"
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            PageAddEdit();
            BtnSave.Visible = false;
            BtnUpdate.Visible = true;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
   
            TxtDescription.Text = HttpUtility.HtmlDecode(row.Cells[2].Text);
            TxtCode.Text = HttpUtility.HtmlDecode(row.Cells[3].Text);


            PageAddEdit();
            BtnSave.Visible = false;
            BtnUpdate.Visible = true;
        }
        
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            PageInitialize();
            lblMessege.Visible = true;
            lblMessege.Text = "Record Updated Successfully";
        }


        #endregion

        #region "DELETE"
        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            MyMessage("Record Deleted Successfully");
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            PageInitialize();
        }

        #endregion

        #region "My Methods"
        private void PageInitialize()
        {
           TxtCode.Text = "";
            TxtDescription.Text = "";
            Panel1.Visible = false;
            GridView1.Visible = true;
            LbtnAddNewRecord.Visible = true;
        }

        private void PageAddEdit()
        {
           Panel1.Visible = true;
            GridView1.Visible = false;
            LbtnAddNewRecord.Visible = false;
        }

        public void MyMessage(string msg)
        {
            lblMessege.Visible = true;
            lblMessege.Text = msg;
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
        #endregion
    }
}