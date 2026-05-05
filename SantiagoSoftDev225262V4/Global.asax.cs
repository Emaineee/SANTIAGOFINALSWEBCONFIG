using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace SantiagoSoftDev225262V4
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            SeedSampleData();
        }

        private void SeedSampleData()
        {
            try
            {
                string connStr = System.Configuration.ConfigurationManager
                    .ConnectionStrings["ConnectionString3"].ConnectionString;

                using (OleDbConnection conn = new OleDbConnection(connStr))
                {
                    conn.Open();

                    int collegeCount = Convert.ToInt32(
                        new OleDbCommand("SELECT COUNT(*) FROM tbl_College WHERE deleted = 0", conn).ExecuteScalar());

                    if (collegeCount == 0)
                    {
                        // Colleges
                        var colleges = new[]
                        {
                            new { desc = "College of Engineering", code = "COE" },
                            new { desc = "College of Arts and Sciences", code = "CAS" },
                            new { desc = "College of Business Administration", code = "CBA" },
                            new { desc = "College of Education", code = "COED" },
                            new { desc = "College of Nursing", code = "CON" },
                        };

                        foreach (var c in colleges)
                        {
                            new OleDbCommand(
                                "INSERT INTO tbl_College (Description, Code, deleted) VALUES (?, ?, 0)", conn)
                            {
                                Parameters =
                                {
                                    new OleDbParameter("?", OleDbType.VarChar) { Value = c.desc },
                                    new OleDbParameter("?", OleDbType.VarChar) { Value = c.code }
                                }
                            }.ExecuteNonQuery();
                        }

                        // Programs
                        var programs = new[]
                        {
                            new { desc = "Bachelor of Science in Computer Science", code = "BSCS", college = "COE" },
                            new { desc = "Bachelor of Science in Information Technology", code = "BSIT", college = "COE" },
                            new { desc = "Bachelor of Science in Civil Engineering", code = "BSCE", college = "COE" },
                            new { desc = "Bachelor of Science in Psychology", code = "BSPSY", college = "CAS" },
                            new { desc = "Bachelor of Science in Biology", code = "BSBIO", college = "CAS" },
                            new { desc = "Bachelor of Science in Accountancy", code = "BSA", college = "CBA" },
                            new { desc = "Bachelor of Science in Business Administration", code = "BSBA", college = "CBA" },
                            new { desc = "Bachelor of Elementary Education", code = "BEED", college = "COED" },
                            new { desc = "Bachelor of Science in Nursing", code = "BSN", college = "CON" },
                        };

                        foreach (var p in programs)
                        {
                            OleDbCommand cmd = new OleDbCommand(
                                "INSERT INTO tbl_Program (description, code, collegeID, deleted) VALUES (?, ?, ?, 0)", conn);
                            cmd.Parameters.Add("?", OleDbType.VarChar).Value = p.desc;
                            cmd.Parameters.Add("?", OleDbType.VarChar).Value = p.code;
                            OleDbCommand collegeLookup = new OleDbCommand(
                                "SELECT collegeID FROM tbl_College WHERE Code = ? AND deleted = 0", conn);
                            collegeLookup.Parameters.AddWithValue("?", p.college);
                            cmd.Parameters.Add("?", OleDbType.Integer).Value = collegeLookup.ExecuteScalar();
                            cmd.ExecuteNonQuery();
                        }

                        // Students
                        var students = new[]
                        {
                            new { id = "23-0466-891", first = "Maria", middle = "Santos", last = "Cruz", sex = "Female", prog = "BSCS", year = 2 },
                            new { id = "23-0467-102", first = "Juan", middle = "Reyes", last = "Dela Cruz", sex = "Male", prog = "BSIT", year = 1 },
                            new { id = "23-0468-203", first = "Ana", middle = "Garcia", last = "Torres", sex = "Female", prog = "BSCE", year = 3 },
                            new { id = "23-0469-304", first = "Carlos", middle = "Mendoza", last = "Ramos", sex = "Male", prog = "BSPSY", year = 2 },
                            new { id = "23-0470-405", first = "Luisa", middle = "Flores", last = "Santos", sex = "Female", prog = "BSA", year = 1 },
                            new { id = "23-0471-506", first = "Miguel", middle = "Castro", last = "Gonzales", sex = "Male", prog = "BEED", year = 4 },
                            new { id = "23-0472-607", first = "Rosa", middle = "Aquino", last = "Hernandez", sex = "Female", prog = "BSN", year = 3 },
                            new { id = "23-0473-708", first = "Pedro", middle = "Lopez", last = "Rivera", sex = "Male", prog = "BSBA", year = 2 },
                        };

                        foreach (var s in students)
                        {
                            OleDbCommand cmd = new OleDbCommand(
                                "INSERT INTO tbl_StudentInfo (studentID, Firstname, Middlename, Lastname, Bday, Sex, programID, yearLevel, deleted) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 0)", conn);
                            cmd.Parameters.Add("?", OleDbType.VarChar).Value = s.id;
                            cmd.Parameters.Add("?", OleDbType.VarChar).Value = s.first;
                            cmd.Parameters.Add("?", OleDbType.VarChar).Value = s.middle;
                            cmd.Parameters.Add("?", OleDbType.VarChar).Value = s.last;
                            cmd.Parameters.Add("?", OleDbType.Date).Value = new DateTime(1995, 1, 1);
                            cmd.Parameters.Add("?", OleDbType.VarChar).Value = s.sex;
                            OleDbCommand progLookup = new OleDbCommand(
                                "SELECT programID FROM tbl_Program WHERE code = ? AND deleted = 0", conn);
                            progLookup.Parameters.AddWithValue("?", s.prog);
                            cmd.Parameters.Add("?", OleDbType.Integer).Value = progLookup.ExecuteScalar();
                            cmd.Parameters.Add("?", OleDbType.Integer).Value = s.year;
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
            }
            catch { }
        }
    }
}