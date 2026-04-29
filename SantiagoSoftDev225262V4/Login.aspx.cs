using System;
using System.Data.OleDb;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

namespace SantiagoSoftDev225262V4
{
    public partial class Login : System.Web.UI.Page
    {
        string connStr = System.Configuration.ConfigurationManager
            .ConnectionStrings["ConnectionString3"].ConnectionString;

        static Random rnd = new Random();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlSignUp.Visible = false;
                pnlOTP.Visible = false;

                Session["OTPVerified"] = false;
                Session["OTP"] = null;
                Session["OTPTime"] = null;
            }

            HandleOTPCountdown();
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            using (OleDbConnection conn = new OleDbConnection(connStr))
            {
                conn.Open();

                OleDbCommand cmd = new OleDbCommand(
                    "SELECT studIndex, UN FROM tblUNPW WHERE UN = ? AND PW = ?", conn);

                cmd.Parameters.AddWithValue("@UN", txtUN.Text.Trim());
                cmd.Parameters.AddWithValue("@PW", txtPW.Text.Trim());

                OleDbDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    Session["User"] = dr["UN"].ToString();
                    Session["StudIndex"] = dr["studIndex"].ToString();

                    // ROLE SYSTEM
                    Session["Role"] = (txtUN.Text.Trim().ToLower() == "admin")
                        ? "Admin"
                        : "User";

                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid username or password.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void btnShowSignUp_Click(object sender, EventArgs e)
        {
            pnlSignUp.Visible = !pnlSignUp.Visible;
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();

            if (string.IsNullOrWhiteSpace(email))
            {
                lblSignUpMessage.Text = "Enter email first.";
                lblSignUpMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string otp = rnd.Next(100000, 999999).ToString();

            Session["OTP"] = otp;
            Session["OTPVerified"] = false;
            Session["OTPTime"] = DateTime.Now;

            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("lorainesantiago1310@gmail.com"); 
                mail.To.Add(email);
                mail.Subject = "Your OTP Code";
                mail.Body = "Your OTP is: " + otp;

                SmtpClient smtp = new SmtpClient("smtp.gmail.com");
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential(
                    "lorainesantiago1310@gmail.com",  
                    "vocfquhpyjzcrpgc"                 
                );

                smtp.Send(mail);

                pnlOTP.Visible = true;

                lblSignUpMessage.Text = "OTP sent. Check your email.";
                lblSignUpMessage.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblSignUpMessage.Text = "Email failed: " + ex.Message;
                lblSignUpMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnVerifyOTP_Click(object sender, EventArgs e)
        {
            if (Session["OTP"] == null)
            {
                lblOTPMessage.Text = "No OTP generated.";
                lblOTPMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (txtOTP.Text.Trim() == Session["OTP"].ToString())
            {
                Session["OTPVerified"] = true;

                lblOTPMessage.Text = "OTP Verified ✔";
                lblOTPMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Session["OTPVerified"] = false;

                lblOTPMessage.Text = "Wrong OTP!";
                lblOTPMessage.ForeColor = System.Drawing.Color.Red;
            }

            pnlOTP.Visible = true;
        }

        protected void btnResendOTP_Click(object sender, EventArgs e)
        {
            if (Session["OTPTime"] != null)
            {
                DateTime last = (DateTime)Session["OTPTime"];
                int seconds = (int)(DateTime.Now - last).TotalSeconds;

                if (seconds < 30)
                {
                    lblOTPMessage.Text = "Wait " + (30 - seconds) + " seconds.";
                    lblOTPMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }
            }

            btnSignUp_Click(sender, e);
        }

        private void HandleOTPCountdown()
        {
            if (Session["OTPTime"] == null)
            {
                btnResendOTP.Enabled = true;
                btnResendOTP.Text = "Resend OTP";
                return;
            }

            DateTime last = (DateTime)Session["OTPTime"];
            int seconds = (int)(DateTime.Now - last).TotalSeconds;

            if (seconds < 30)
            {
                btnResendOTP.Enabled = false;
                btnResendOTP.Text = "Resend in " + (30 - seconds) + "s";
            }
            else
            {
                btnResendOTP.Enabled = true;
                btnResendOTP.Text = "Resend OTP";
            }
        }

        protected void btnRegisterFinal_Click(object sender, EventArgs e)
        {
            if (Session["OTPVerified"] == null || !(bool)Session["OTPVerified"])
            {
                lblSignUpMessage.Text = "Verify OTP first.";
                lblSignUpMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string studIndex = txtStudIndex.Text.Trim().Replace("-", "");
            string username = txtNewUN.Text.Trim();
            string password = txtNewPW.Text.Trim();
            string confirm = txtConfirmPW.Text.Trim();

            using (OleDbConnection conn = new OleDbConnection(connStr))
            {
                conn.Open();

                OleDbCommand check = new OleDbCommand(
                    "SELECT COUNT(*) FROM tblUNPW WHERE UN = ?", conn);

                check.Parameters.AddWithValue("@p1", username);

                int exists = Convert.ToInt32(check.ExecuteScalar());

                if (exists > 0)
                {
                    lblSignUpMessage.Text = "Username already exists.";
                    lblSignUpMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                OleDbCommand cmd = new OleDbCommand(
                    "INSERT INTO tblUNPW (studIndex, UN, PW) VALUES (?, ?, ?)", conn);

                cmd.Parameters.AddWithValue("@p1", studIndex);
                cmd.Parameters.AddWithValue("@p2", username);
                cmd.Parameters.AddWithValue("@p3", password);

                cmd.ExecuteNonQuery();
            }

            lblSignUpMessage.Text = "Account created successfully!";
            lblSignUpMessage.ForeColor = System.Drawing.Color.Green;

            pnlOTP.Visible = false;
            pnlSignUp.Visible = false;
        }
    }
}