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
                ShowLanding();

                if (pnlOTP != null)
                    pnlOTP.Visible = false;

                Session["OTPVerified"] = false;
            }
        }

        // ================= NAVIGATION =================
        private void ShowLanding()
        {
            pnlLanding.Visible = true;
            pnlLogin.Visible = false;
            pnlSignUp.Visible = false;
            pnlForgot.Visible = false;
        }

        private void ShowLogin()
        {
            pnlLanding.Visible = false;
            pnlLogin.Visible = true;
            pnlSignUp.Visible = false;
            pnlForgot.Visible = false;
        }

        private void ShowSignUp()
        {
            pnlLanding.Visible = false;
            pnlLogin.Visible = false;
            pnlSignUp.Visible = true;
            pnlForgot.Visible = false;
        }

        private void ShowForgot()
        {
            pnlLanding.Visible = false;
            pnlLogin.Visible = false;
            pnlSignUp.Visible = false;
            pnlForgot.Visible = true;
        }

        protected void btnGoLogin_Click(object sender, EventArgs e) => ShowLogin();
        protected void btnGoSignUp_Click(object sender, EventArgs e) => ShowSignUp();
        protected void btnBackFromLogin_Click(object sender, EventArgs e) => ShowLanding();
        protected void btnBackFromSignUp_Click(object sender, EventArgs e) => ShowLanding();
        protected void btnBackForgot_Click(object sender, EventArgs e) => ShowLogin();
        protected void btnForgot_Click(object sender, EventArgs e) => ShowForgot();

        // ================= LOGIN (DO NOT REMOVE DASHBOARD SESSION) =================
        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            using (OleDbConnection conn = new OleDbConnection(connStr))
            {
                conn.Open();

                OleDbCommand cmd = new OleDbCommand(
                    "SELECT studIndex, UN FROM tblUNPW WHERE UN = ? AND PW = ?", conn);

                cmd.Parameters.AddWithValue("?", txtUN.Text.Trim());
                cmd.Parameters.AddWithValue("?", txtPW.Text.Trim());

                OleDbDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    Session["User"] = dr["UN"].ToString();
                    Session["StudIndex"] = dr["studIndex"].ToString();
                    Session["LoggedIn"] = true;

                    Response.Redirect("Home.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                else
                {
                    lblMessage.Text = "Invalid username or password.";
                }
            }
        }

        // ================= SIGN UP =================
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string otp = rnd.Next(100000, 999999).ToString();

            Session["OTP"] = otp;
            Session["OTPVerified"] = false;

            if (pnlOTP != null)
                pnlOTP.Visible = true;

            SendEmail(txtEmail.Text.Trim(), "OTP Code", "Your OTP is: " + otp);
        }

        protected void btnVerifyOTP_Click(object sender, EventArgs e)
        {
            if (txtOTP.Text == Session["OTP"]?.ToString())
            {
                Session["OTPVerified"] = true;
                lblOTPMessage.Text = "Verified ✔";
            }
            else
            {
                lblOTPMessage.Text = "Wrong OTP ❌";
            }
        }

        // ================= REGISTER =================
        protected void btnRegisterFinal_Click(object sender, EventArgs e)
        {
            if (Session["OTPVerified"] == null || !(bool)Session["OTPVerified"])
            {
                lblSignUpMessage.Text = "Verify OTP first.";
                return;
            }

            string studIndex = txtStudIndex.Text.Trim().Replace("-", "");

            using (OleDbConnection conn = new OleDbConnection(connStr))
            {
                conn.Open();

                OleDbCommand cmd = new OleDbCommand(
                    "INSERT INTO tblUNPW (studIndex, UN, PW, Email) VALUES (?, ?, ?, ?)", conn);

                cmd.Parameters.AddWithValue("?", studIndex);
                cmd.Parameters.AddWithValue("?", txtNewUN.Text.Trim());
                cmd.Parameters.AddWithValue("?", txtNewPW.Text.Trim());
                cmd.Parameters.AddWithValue("?", txtEmail.Text.Trim());

                cmd.ExecuteNonQuery();
            }

            ShowLogin();
        }

        // ================= FORGOT PASSWORD =================
        protected void btnSendResetOTP_Click(object sender, EventArgs e)
        {
            string username = txtUNReset.Text.Trim();
            string otp = rnd.Next(100000, 999999).ToString();

            using (OleDbConnection conn = new OleDbConnection(connStr))
            {
                conn.Open();

                OleDbCommand cmd = new OleDbCommand(
                    "SELECT Email FROM tblUNPW WHERE UN = ?", conn);

                cmd.Parameters.AddWithValue("?", username);

                object result = cmd.ExecuteScalar();

                if (result == null)
                {
                    lblForgotMsg.Text = "Username not found.";
                    return;
                }

                string email = result.ToString();

                Session["ResetOTP"] = otp;
                Session["ResetUser"] = username;

                SendEmail(email, "Reset OTP", "Your OTP is: " + otp);

                lblForgotMsg.Text = "OTP sent to registered email.";
            }
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            if (txtResetOTP.Text != Session["ResetOTP"]?.ToString())
            {
                lblForgotMsg.Text = "Invalid OTP";
                return;
            }

            using (OleDbConnection conn = new OleDbConnection(connStr))
            {
                conn.Open();

                OleDbCommand cmd = new OleDbCommand(
                    "UPDATE tblUNPW SET PW = ? WHERE UN = ?", conn);

                cmd.Parameters.AddWithValue("?", txtNewResetPassword.Text.Trim());
                cmd.Parameters.AddWithValue("?", Session["ResetUser"].ToString());

                cmd.ExecuteNonQuery();
            }

            ShowLogin();
        }

        // ================= EMAIL =================
        private void SendEmail(string to, string subject, string body)
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("yourgmail@gmail.com");
            mail.To.Add(to);
            mail.Subject = subject;
            mail.Body = body;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;

            smtp.Credentials = new NetworkCredential(
               "lorainesantiago1310@gmail.com",
                "krznsjjtwrmgvwtq"
            );

            smtp.Send(mail);
        }
    }
}