using System;
using System.Data.OleDb;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace SantiagoSoftDev225262V4
{
    public partial class Login : System.Web.UI.Page
    {
        string connStr = System.Configuration.ConfigurationManager
            .ConnectionStrings["ConnectionString3"].ConnectionString;

        static Random rnd = new Random();
        const int OTP_EXPIRY_MINUTES = 5;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowLanding();
            }
        }

        // ================= NAVIGATION =================
        private void ShowLanding()
        {
            pnlLanding.Visible = true;
            pnlLogin.Visible = false;
            pnlSignUp.Visible = false;
            pnlOTPSection.Visible = false;
            pnlForgot.Visible = false;
        }

        private void ShowLogin()
        {
            pnlLanding.Visible = false;
            pnlLogin.Visible = true;
            pnlSignUp.Visible = false;
            pnlOTPSection.Visible = false;
            pnlForgot.Visible = false;
        }

        private void ShowSignUp()
        {
            pnlLanding.Visible = false;
            pnlLogin.Visible = false;
            pnlSignUp.Visible = true;
            pnlOTPSection.Visible = false;
            pnlForgot.Visible = false;
            BindPrograms();
        }

        private void ShowOTPVerify()
        {
            pnlLanding.Visible = false;
            pnlLogin.Visible = false;
            pnlSignUp.Visible = true;
            pnlOTPSection.Visible = true;
            pnlForgot.Visible = false;
            lblTargetEmail.InnerText = txtEmail.Text.Trim();
        }

        private void ShowForgot()
        {
            pnlLanding.Visible = false;
            pnlLogin.Visible = false;
            pnlSignUp.Visible = false;
            pnlOTPSection.Visible = false;
            pnlForgot.Visible = true;
        }

        protected void btnGoLogin_Click(object sender, EventArgs e) => ShowLogin();
        protected void btnGoSignUp_Click(object sender, EventArgs e) => ShowSignUp();
        protected void btnBackFromLogin_Click(object sender, EventArgs e) => ShowLanding();
        protected void btnBackFromSignUp_Click(object sender, EventArgs e) => ShowLanding();
        protected void btnBackForgot_Click(object sender, EventArgs e) => ShowLogin();
        protected void btnForgot_Click(object sender, EventArgs e) => ShowForgot();

        // ================= PROGRAMS =================
        private void BindPrograms()
        {
            if (!IsPostBack || pnlSignUp.Visible)
            {
                using (OleDbConnection conn = new OleDbConnection(connStr))
                {
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand("SELECT programID, code FROM tbl_Program WHERE deleted = 0", conn);
                    OleDbDataReader dr = cmd.ExecuteReader();
                    ddlProgram.DataSource = dr;
                    ddlProgram.DataTextField = "code";
                    ddlProgram.DataValueField = "programID";
                    ddlProgram.DataBind();
                    ddlProgram.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Program --", ""));
                }
            }
        }

        // ================= PASSWORD HASHING =================
        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder sb = new StringBuilder();
                foreach (byte b in bytes)
                    sb.Append(b.ToString("x2"));
                return sb.ToString();
            }
        }

        // ================= LOGIN =================
        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            lblMessage.Visible = true;
            if (string.IsNullOrWhiteSpace(txtUN.Text) || string.IsNullOrWhiteSpace(txtPW.Text))
            {
                lblMessage.Text = "Please enter both username and password.";
                return;
            }

            string hashedPW = HashPassword(txtPW.Text.Trim());
            string plainPW = txtPW.Text.Trim();
            string input = txtUN.Text.Trim();
            string strippedInput = input.Replace("-", "");
            bool isNumeric = int.TryParse(strippedInput, out int studId);

            using (OleDbConnection conn = new OleDbConnection(connStr))
            {
                conn.Open();
                OleDbCommand cmd = new OleDbCommand(
                    "SELECT studIndex, UN, PW FROM tblUNPW WHERE UN = ? OR studIndex = ? OR studIndex = ?", conn);
                cmd.Parameters.AddWithValue("?", input);
                cmd.Parameters.Add(new OleDbParameter("?", OleDbType.Integer) { Value = isNumeric ? (object)studId : DBNull.Value });
                cmd.Parameters.Add(new OleDbParameter("?", OleDbType.Integer) { Value = isNumeric ? (object)studId : DBNull.Value });

                OleDbDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    string dbPassword = dr["PW"].ToString();
                    string dbStudIndex = dr["studIndex"].ToString();
                    string dbUsername = dr["UN"].ToString();

                    bool validLogin = (dbPassword == hashedPW) || (dbPassword == plainPW);

                    if (validLogin)
                    {
                        if (dbPassword == plainPW && dbPassword != hashedPW)
                        {
                            OleDbCommand upd = new OleDbCommand(
                                "UPDATE tblUNPW SET PW = ? WHERE studIndex = ?", conn);
                            upd.Parameters.AddWithValue("?", hashedPW);
                            upd.Parameters.AddWithValue("?", dbStudIndex);
                            upd.ExecuteNonQuery();
                        }

                        Session["User"] = dbUsername;
                        Session["StudIndex"] = dbStudIndex;
                        Session["LoggedIn"] = true;

                        Response.Redirect("Home.aspx", false);
                        Context.ApplicationInstance.CompleteRequest();
                    }
                    else
                    {
                        lblMessage.Text = "Invalid username or password.";
                    }
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
            lblSignUpMessage.Visible = true;
            if (!Page.IsValid)
            {
                lblSignUpMessage.Text = "Please fill in all required fields.";
                return;
            }

            string username = txtNewUN.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtNewPW.Text.Trim();

            if (password != txtConfirmPW.Text.Trim())
            {
                lblSignUpMessage.Text = "Passwords do not match."; return;
            }
            if (password.Length < 6)
            {
                lblSignUpMessage.Text = "Password must be at least 6 characters."; return;
            }

            using (OleDbConnection conn = new OleDbConnection(connStr))
            {
                conn.Open();
                if (Convert.ToInt32(new OleDbCommand("SELECT COUNT(*) FROM tblUNPW WHERE UN = ?", conn) { Parameters = { new OleDbParameter("?", username) } }.ExecuteScalar()) > 0)
                { lblSignUpMessage.Text = "Username already exists."; return; }
                if (Convert.ToInt32(new OleDbCommand("SELECT COUNT(*) FROM tblUNPW WHERE Email = ?", conn) { Parameters = { new OleDbParameter("?", email) } }.ExecuteScalar()) > 0)
                { lblSignUpMessage.Text = "Email already registered."; return; }
            }

            string otp = rnd.Next(100000, 999999).ToString();
            Session["OTP"] = otp;
            Session["OTPSentAt"] = DateTime.Now;
            Session["OTPVerified"] = false;
            Session["SignupData"] = new System.Collections.Specialized.ListDictionary()
            {
                ["studIndex"] = txtStudIndex.Text.Trim(),
                ["firstName"] = txtFirstName.Text.Trim(),
                ["lastName"] = txtLastName.Text.Trim(),
                ["bday"] = txtBday.Text.Trim(),
                ["sex"] = ddlSex.SelectedValue,
                ["programId"] = ddlProgram.SelectedValue,
                ["yearLevel"] = txtYearLevel.Text.Trim(),
                ["username"] = username,
                ["email"] = email,
                ["password"] = password
            };

            ShowOTPVerify();

            try
            {
                SendEmail(email, username, otp);
                lblOTPMessage.Text = "A 6-digit verification code was sent to " + email + ".";
                lblOTPMessage.CssClass = "msg-bar msg-success";
            }
            catch (Exception ex)
            {
                lblOTPMessage.Text = "Failed to send OTP: " + ex.Message;
                lblOTPMessage.CssClass = "msg-bar msg-error";
            }
        }

        protected void btnVerifyOTP_Click(object sender, EventArgs e)
        {
            lblOTPMessage.Visible = true;
            if (Session["OTP"] == null)
            { lblOTPMessage.Text = "No OTP was sent."; return; }

            DateTime sentAt = (DateTime)(Session["OTPSentAt"] ?? DateTime.MinValue);
            if ((DateTime.Now - sentAt).TotalMinutes > OTP_EXPIRY_MINUTES)
            {
                lblOTPMessage.Text = "OTP expired. Request a new one.";
                Session["OTP"] = null; return;
            }

            if (txtOTP.Text == Session["OTP"]?.ToString())
            {
                Session["OTPVerified"] = true;
                lblOTPMessage.Text = "Verified! Click Complete Registration.";
                lblOTPMessage.CssClass = "msg-bar msg-success";
            }
            else
            {
                lblOTPMessage.Text = "Incorrect code.";
                lblOTPMessage.CssClass = "msg-bar msg-error";
            }
        }

        protected void btnResendOTP_Click(object sender, EventArgs e)
        {
            lblOTPMessage.Visible = true;
            var signupData = Session["SignupData"] as System.Collections.Specialized.ListDictionary;
            if (signupData == null)
            { lblOTPMessage.Text = "Session expired."; ShowSignUp(); return; }

            string otp = rnd.Next(100000, 999999).ToString();
            Session["OTP"] = otp;
            Session["OTPSentAt"] = DateTime.Now;
            Session["OTPVerified"] = false;

            try
            {
                SendEmail(signupData["email"].ToString(), signupData["username"].ToString(), otp);
                lblOTPMessage.Text = "New code sent.";
                lblOTPMessage.CssClass = "msg-bar msg-success";
            }
            catch (Exception ex)
            {
                lblOTPMessage.Text = "Failed to resend: " + ex.Message;
                lblOTPMessage.CssClass = "msg-bar msg-error";
            }
        }

        // ================= REGISTER (NO TRANSACTIONS) =================
        protected void btnRegisterFinal_Click(object sender, EventArgs e)
        {
            lblOTPMessage.Visible = true;
            try
            {
                if (Session["OTPVerified"] == null || !(bool)Session["OTPVerified"])
                    throw new Exception("Verify OTP first.");

                var data = Session["SignupData"] as System.Collections.Specialized.ListDictionary;
                if (data == null) throw new Exception("Session expired.");

                DateTime sentAt = (DateTime)(Session["OTPSentAt"] ?? DateTime.MinValue);
                if ((DateTime.Now - sentAt).TotalMinutes > OTP_EXPIRY_MINUTES)
                    throw new Exception("OTP expired. Request a new one.");

                // Parse safely
                string studIndexInput = data["studIndex"].ToString();
                string studClean = studIndexInput.Replace("-", "");
                if (!int.TryParse(studClean, out int studIndex)) throw new Exception("Invalid Student ID.");
                
                DateTime birthDate;
                if (!DateTime.TryParse(data["bday"].ToString(), out birthDate)) throw new Exception("Invalid Birthday.");

                int yearLevel = 1; int.TryParse(data["yearLevel"].ToString(), out yearLevel);
                int progId = 0; int.TryParse(data["programId"].ToString(), out progId);

                using (OleDbConnection conn = new OleDbConnection(connStr))
                {
                    conn.Open();

                    // 1. Login Table
                    using (OleDbCommand cmd1 = new OleDbCommand(
                        "INSERT INTO tblUNPW (studIndex, UN, PW, Email) VALUES (?, ?, ?, ?)", conn))
                    {
                        cmd1.Parameters.Add("?", OleDbType.Integer).Value = studIndex;
                        cmd1.Parameters.Add("?", OleDbType.VarChar).Value = data["username"].ToString();
                        cmd1.Parameters.Add("?", OleDbType.VarChar).Value = HashPassword(data["password"].ToString());
                        cmd1.Parameters.Add("?", OleDbType.VarChar).Value = data["email"].ToString();
                        cmd1.ExecuteNonQuery();
                    }

                    // 2. Student Table
                    using (OleDbCommand cmd2 = new OleDbCommand(
                        "INSERT INTO tbl_StudentInfo (studentID, Firstname, Middlename, Lastname, Bday, Sex, programID, yearLevel, deleted) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 0)", conn))
                    {
                        cmd2.Parameters.Add("?", OleDbType.VarChar).Value = studIndexInput;
                        cmd2.Parameters.Add("?", OleDbType.VarChar).Value = data["firstName"].ToString();
                        cmd2.Parameters.Add("?", OleDbType.VarChar).Value = DBNull.Value;
                        cmd2.Parameters.Add("?", OleDbType.VarChar).Value = data["lastName"].ToString();
                        cmd2.Parameters.Add("?", OleDbType.Date).Value = birthDate;
                        cmd2.Parameters.Add("?", OleDbType.VarChar).Value = data["sex"].ToString();
                        cmd2.Parameters.Add("?", OleDbType.Integer).Value = progId;
                        cmd2.Parameters.Add("?", OleDbType.Integer).Value = yearLevel;
                        cmd2.ExecuteNonQuery();
                    }
                }

                Session["User"] = data["username"].ToString();
                Session["StudIndex"] = studIndex.ToString();
                Session["LoggedIn"] = true;
                Session["OTPVerified"] = false;
                Session["OTP"] = null;
                Session["SignupData"] = null;

                lblOTPMessage.Text = "Success! Redirecting...";
                lblOTPMessage.CssClass = "msg-bar msg-success";
                System.Threading.Thread.Sleep(1000);
                Response.Redirect("Home.aspx");
            }
            catch (Exception ex)
            {
                lblOTPMessage.Text = "Error: " + ex.Message;
                lblOTPMessage.CssClass = "msg-bar msg-error";
            }
        }

        // ================= FORGOT PASSWORD =================
        protected void btnSendResetOTP_Click(object sender, EventArgs e)
        {
            Page.Validate("SendResetGroup");
            lblForgotMsg.Visible = true;
            if (!Page.IsValid) { return; }

            string input = txtUNReset.Text.Trim();
            string email = txtForgotEmail.Text.Trim();

            if (string.IsNullOrEmpty(input) || string.IsNullOrEmpty(email))
            { lblForgotMsg.Text = "Please fill in all fields."; return; }

            using (OleDbConnection conn = new OleDbConnection(connStr))
            {
                conn.Open();
                OleDbCommand cmd = new OleDbCommand(
                    "SELECT studIndex, UN, Email FROM tblUNPW WHERE UN = ?", conn);
                cmd.Parameters.AddWithValue("?", input);

                OleDbDataReader dr = cmd.ExecuteReader();
                if (!dr.Read())
                {
                    dr.Close();
                    lblForgotMsg.Text = "Account not found.";
                    return;
                }

                string dbEmail = dr["Email"].ToString();
                if (dbEmail != email)
                {
                    dr.Close();
                    lblForgotMsg.Text = "Email does not match.";
                    return;
                }

                string otp = rnd.Next(100000, 999999).ToString();
                Session["ResetOTP"] = otp;
                Session["ResetOTPSentAt"] = DateTime.Now;
                Session["ResetUser"] = dr["UN"].ToString();
                dr.Close();

                try
                {
                    SendEmail(email, Session["ResetUser"].ToString(), otp);
                    lblForgotMsg.Text = "Reset code sent to " + email + ".";
                    lblForgotMsg.CssClass = "msg-bar msg-success";
                }
                catch (Exception ex)
                {
                    lblForgotMsg.Text = "Failed to send OTP: " + ex.Message;
                    lblForgotMsg.CssClass = "msg-bar msg-error";
                }
            }
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            Page.Validate("ConfirmResetGroup");
            lblForgotMsg.Visible = true;
            if (!Page.IsValid) { return; }

            if (Session["ResetOTP"] == null) { lblForgotMsg.Text = "Request a reset code first."; return; }

            DateTime sentAt = (DateTime)(Session["ResetOTPSentAt"] ?? DateTime.MinValue);
            if ((DateTime.Now - sentAt).TotalMinutes > OTP_EXPIRY_MINUTES)
            { lblForgotMsg.Text = "Code expired. Request a new one."; Session["ResetOTP"] = null; return; }

            if (txtResetOTP.Text != Session["ResetOTP"]?.ToString()) { lblForgotMsg.Text = "Invalid code."; return; }
            if (txtNewResetPassword.Text.Trim().Length < 6) { lblForgotMsg.Text = "Password must be at least 6 characters."; return; }

            string hashedPW = HashPassword(txtNewResetPassword.Text.Trim());
            using (OleDbConnection conn = new OleDbConnection(connStr))
            {
                conn.Open();
                OleDbCommand cmd = new OleDbCommand("UPDATE tblUNPW SET PW = ? WHERE UN = ?", conn);
                cmd.Parameters.AddWithValue("?", hashedPW);
                cmd.Parameters.AddWithValue("?", Session["ResetUser"].ToString());
                int rows = cmd.ExecuteNonQuery();
                if (rows == 0) { lblForgotMsg.Text = "Failed to update password."; return; }
            }

            lblForgotMsg.Text = "Password reset successful! Please sign in.";
            lblForgotMsg.CssClass = "msg-bar msg-success";
            Session["ResetOTP"] = null;
            Session["ResetOTPSentAt"] = null;
            Session["ResetUser"] = null;
            System.Threading.Thread.Sleep(1200);
            ShowLogin();
        }

        // ================= EMAIL =================
        private void SendEmail(string to, string username, string otp)
        {
            string htmlBody = $@"
<html>
<head>
<style>
  body {{ font-family: 'Segoe UI', Arial, sans-serif; margin: 0; padding: 0; background: #f3f4f6; }}
  .container {{ max-width: 520px; margin: 40px auto; background: #ffffff; border-radius: 16px; overflow: hidden; box-shadow: 0 4px 24px rgba(0,0,0,0.08); }}
  .header {{ background: linear-gradient(135deg, #38bdf8, #0284c7); padding: 32px 28px; text-align: center; color: white; }}
  .header h1 {{ margin: 0 0 6px; font-size: 22px; font-weight: 700; }}
  .header p {{ margin: 0; font-size: 13px; opacity: 0.9; }}
  .body {{ padding: 32px 28px; text-align: center; }}
  .body p {{ margin: 0 0 16px; color: #374151; font-size: 14px; line-height: 1.6; }}
  .otp-code {{ display: inline-block; background: #f0f9ff; border: 2px solid #bae6fd; border-radius: 12px; padding: 18px 36px; font-size: 32px; font-weight: 700; letter-spacing: 6px; color: #0369a1; font-family: 'Courier New', monospace; margin: 12px 0 18px; }}
  .footer {{ background: #f9fafb; padding: 20px 28px; text-align: center; border-top: 1px solid #e5e7eb; }}
  .footer p {{ margin: 0; font-size: 12px; color: #9ca3af; }}
  .badge {{ display: inline-block; background: #fef3c7; border: 1px solid #fcd34d; color: #92400e; font-size: 11px; font-weight: 600; padding: 4px 12px; border-radius: 99px; margin-top: 8px; }}
</style>
</head>
<body>
  <div class='container'>
    <div class='header'>
      <h1>SoftDev System</h1>
      <p>Student Account Verification</p>
    </div>
    <div class='body'>
      <p>Hello <strong>{username}</strong>,</p>
      <p>Use the verification code below to complete your registration. This code is valid for <strong>5 minutes</strong>.</p>
      <div class='otp-code'>{otp}</div>
      <br>
      <span class='badge'>Expires in {OTP_EXPIRY_MINUTES} minutes</span>
      <p style='margin-top:20px; color:#9ca3af; font-size:12px;'>If you did not request this code, please ignore this email.</p>
    </div>
    <div class='footer'>
      <p>SoftDev Student Management System — Do not reply to this email.</p>
    </div>
  </div>
</body>
</html>";

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("lorainesantiago1310@gmail.com", "SoftDev System");
            mail.To.Add(to);
            mail.Subject = "Verification Code — SoftDev System";
            mail.Body = htmlBody;
            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("lorainesantiago1310@gmail.com", "krznsjjtwrmgvwtq");
            smtp.Send(mail);
        }
    }
}
