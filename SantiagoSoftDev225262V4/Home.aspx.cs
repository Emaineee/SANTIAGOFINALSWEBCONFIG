using System;
using System.Data.OleDb;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SantiagoSoftDev225262V4
{
    public partial class Home : Page
    {
        protected Literal litCollegeCount;
        protected Literal litProgramCount;
        protected Literal litStudentCount;
        protected Repeater rptRecentStudents;
        protected Literal litWelcomeUser;
        protected PlaceHolder phEmptyRecent;

        string connStr = System.Configuration.ConfigurationManager
            .ConnectionStrings["ConnectionString3"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                litWelcomeUser.Text = Session["User"].ToString();
                LoadStats();
                LoadRecentStudents();
            }
        }

        private void LoadStats()
        {
            try
            {
                using (OleDbConnection conn = new OleDbConnection(connStr))
                {
                    conn.Open();
                    litCollegeCount.Text = GetCount(conn,
                        "SELECT COUNT(*) FROM tbl_College WHERE deleted = 0");
                    litProgramCount.Text = GetCount(conn,
                        "SELECT COUNT(*) FROM tbl_Program WHERE deleted = 0");
                    litStudentCount.Text = GetCount(conn,
                        "SELECT COUNT(*) FROM tbl_StudentInfo WHERE deleted = 0");
                }
            }
            catch
            {
                litCollegeCount.Text = "—";
                litProgramCount.Text = "—";
                litStudentCount.Text = "—";
            }
        }

        private void LoadRecentStudents()
        {
            try
            {
                using (OleDbConnection conn = new OleDbConnection(connStr))
                {
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand(
                        "SELECT TOP 5 s.studentID, s.Firstname, s.Lastname, p.code AS ProgramCode, s.yearLevel " +
                        "FROM tbl_StudentInfo s " +
                        "LEFT JOIN tbl_Program p ON s.programID = p.programID " +
                        "WHERE s.deleted = 0 " +
                        "ORDER BY s.ID DESC", conn);
                    OleDbDataReader dr = cmd.ExecuteReader();
                    rptRecentStudents.DataSource = dr;
                    rptRecentStudents.DataBind();
                    bool hasData = dr.HasRows;
                    dr.Close();
                    phEmptyRecent.Visible = !hasData;
                    rptRecentStudents.Visible = hasData;
                }
            }
            catch
            {
                rptRecentStudents.Visible = false;
                phEmptyRecent.Visible = true;
            }
        }

        private string GetCount(OleDbConnection conn, string sql)
        {
            using (OleDbCommand cmd = new OleDbCommand(sql, conn))
            {
                object result = cmd.ExecuteScalar();
                return result != null ? result.ToString() : "0";
            }
        }
    }
}