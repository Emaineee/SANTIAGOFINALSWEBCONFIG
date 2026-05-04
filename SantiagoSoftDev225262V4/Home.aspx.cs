using System;
using System.Data.OleDb;
using System.Web.UI;
using System.Web.UI.WebControls; // Added for Literal support

namespace SantiagoSoftDev225262V4
{
    public partial class Home : Page
    {
        // Fix for CS0103: Manually declaring the controls 
        // linked to the IDs in your .aspx file.
        protected Literal litCollegeCount;
        protected Literal litProgramCount;
        protected Literal litStudentCount;

        string connStr = System.Configuration.ConfigurationManager
            .ConnectionStrings["ConnectionString3"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadStats();
        }

        /// <summary>Loads aggregate counts for the hero stats row.</summary>
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
                // Silently fail – counts are decorative on the public page.
                litCollegeCount.Text = "—";
                litProgramCount.Text = "—";
                litStudentCount.Text = "—";
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