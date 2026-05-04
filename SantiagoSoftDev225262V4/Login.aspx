<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/MySite.Master"
    AutoEventWireup="true" CodeBehind="Login.aspx.cs"
    Inherits="SantiagoSoftDev225262V4.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
/* ═══════════════════════════════════════════════
   LOGIN PAGE  —  Light Blue Feminine Theme
═══════════════════════════════════════════════ */

/* Full-page wrapper that centres the cards */
.auth-wrap {
    min-height: calc(100vh - 70px);
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 32px 16px;
}

/* Central card */
.auth-card {
    width: 100%;
    max-width: 460px;
    background: white;
    border: 2px solid var(--border);
    border-radius: 24px;
    padding: 40px 36px 34px;
    box-shadow: 0 8px 40px rgba(14,165,233,0.13);
    animation: popIn .38s cubic-bezier(.22,1,.36,1) both;
    position: relative;
    overflow: hidden;
}

/* Decorative corner ribbon */
.auth-card::before {
    content: '';
    position: absolute;
    top: -40px; right: -40px;
    width: 120px; height: 120px;
    background: radial-gradient(circle, rgba(56,189,248,0.15) 0%, transparent 70%);
    border-radius: 50%;
}

.auth-card::after {
    content: '';
    position: absolute;
    bottom: -50px; left: -30px;
    width: 140px; height: 140px;
    background: radial-gradient(circle, rgba(252,207,243,0.35) 0%, transparent 70%);
    border-radius: 50%;
}

@keyframes popIn {
    from { opacity: 0; transform: translateY(22px) scale(.97); }
    to   { opacity: 1; transform: translateY(0) scale(1); }
}

/* Wider card for signup (has more fields) */
.auth-card.wide { max-width: 560px; }

/* Card icon bubble */
.card-icon {
    width: 60px; height: 60px;
    border-radius: 50%;
    background: linear-gradient(135deg, var(--sky-200) 0%, var(--blush-d) 100%);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 26px;
    margin: 0 auto 16px;
    border: 3px solid white;
    box-shadow: 0 4px 16px rgba(56,189,248,0.25);
}

/* Title */
.auth-title {
    font-family: 'Quicksand', sans-serif;
    font-size: 1.6rem;
    font-weight: 700;
    color: var(--text-dark);
    text-align: center;
    margin-bottom: 4px;
    letter-spacing: -.2px;
}

.auth-sub {
    text-align: center;
    font-size: .845rem;
    color: var(--text-muted);
    margin-bottom: 28px;
    font-weight: 500;
}

/* Status pill */
.status-pill {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 6px;
    background: var(--sky-100);
    border: 1.5px solid var(--border);
    border-radius: 999px;
    padding: 5px 14px;
    font-size: .72rem;
    color: var(--sky-700);
    font-weight: 700;
    font-family: 'Quicksand', sans-serif;
    letter-spacing: .5px;
    text-transform: uppercase;
    margin: 0 auto 18px;
    width: fit-content;
}

.status-pill .pulse-dot {
    width: 7px; height: 7px;
    border-radius: 50%;
    background: var(--sky-400);
    animation: blink 2s ease-in-out infinite;
}

@keyframes blink {
    0%,100% { opacity:1; transform:scale(1); }
    50%      { opacity:.4; transform:scale(.75); }
}

/* Form group */
.fg { margin-bottom: 17px; }

.fg label {
    display: block;
    font-size: .75rem;
    font-weight: 700;
    color: var(--text-dark);
    letter-spacing: .5px;
    text-transform: uppercase;
    margin-bottom: 7px;
    font-family: 'Quicksand', sans-serif;
}

.fg .hint {
    font-size: .72rem;
    color: var(--text-muted);
    font-style: italic;
    margin-top: 4px;
    display: block;
}

/* Input */
.inp {
    width: 100%;
    padding: 12px 16px;
    background: var(--sky-50);
    border: 2px solid var(--border);
    border-radius: 10px;
    color: var(--text-dark);
    font-family: 'Nunito', sans-serif;
    font-size: .935rem;
    font-weight: 500;
    outline: none;
    transition: border-color var(--transition), box-shadow var(--transition), background var(--transition);
}

.inp::placeholder { color: var(--text-muted); }

.inp:focus {
    border-color: var(--sky-400);
    background: white;
    box-shadow: 0 0 0 3px rgba(56,189,248,0.18);
}

/* Two-col grid for form */
.form-grid-2 {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 0 16px;
}

@media (max-width: 500px) { .form-grid-2 { grid-template-columns: 1fr; } }

/* Buttons */
.abtn {
    display: block;
    width: 100%;
    padding: 13px;
    margin-top: 10px;
    border: none;
    border-radius: 11px;
    font-family: 'Nunito', sans-serif;
    font-size: .925rem;
    font-weight: 700;
    cursor: pointer;
    letter-spacing: .15px;
    transition: transform var(--transition), box-shadow var(--transition), opacity var(--transition);
    text-align: center;
}

.abtn:hover  { opacity: .9; transform: translateY(-2px); }
.abtn:active { transform: translateY(0); opacity: 1; }

.abtn-primary {
    background: linear-gradient(135deg, var(--sky-400) 0%, var(--sky-600) 100%);
    color: white;
    box-shadow: 0 4px 18px rgba(56,189,248,0.38);
}

.abtn-primary:hover { box-shadow: 0 6px 26px rgba(56,189,248,0.52); }

.abtn-success {
    background: linear-gradient(135deg, #34d399 0%, #10b981 100%);
    color: white;
    box-shadow: 0 4px 14px rgba(16,185,129,0.3);
}

.abtn-warning {
    background: linear-gradient(135deg, #fbbf24 0%, #f59e0b 100%);
    color: white;
    box-shadow: 0 4px 14px rgba(245,158,11,0.3);
}

.abtn-ghost {
    background: var(--sky-50);
    color: var(--text-mid);
    border: 2px solid var(--border);
}

.abtn-ghost:hover { background: var(--sky-100); }

/* Link-style button */
.link-btn {
    display: block;
    text-align: center;
    margin-top: 14px;
    font-size: .855rem;
    color: var(--sky-600);
    cursor: pointer;
    background: none;
    border: none;
    font-family: 'Nunito', sans-serif;
    font-weight: 700;
    text-decoration: none;
    transition: color var(--transition);
}
.link-btn:hover { color: var(--sky-700); }

/* Messages */
.msg {
    display: block;
    text-align: center;
    font-size: .84rem;
    color: var(--rose);
    margin-top: 10px;
    min-height: 18px;
    font-weight: 600;
}

/* Divider */
.divider {
    display: flex;
    align-items: center;
    gap: 10px;
    margin: 20px 0 6px;
    color: var(--text-muted);
    font-size: .72rem;
    letter-spacing: .6px;
    text-transform: uppercase;
    font-weight: 600;
}

.divider::before, .divider::after {
    content: '';
    flex: 1;
    height: 1.5px;
    background: var(--border-s);
}

/* OTP box */
.otp-box {
    background: var(--sky-50);
    border: 2px solid var(--border);
    border-radius: 14px;
    padding: 20px 18px;
    margin-top: 18px;
    animation: popIn .3s cubic-bezier(.22,1,.36,1) both;
}

.otp-hint {
    font-size: .84rem;
    color: var(--sky-700);
    text-align: center;
    margin-bottom: 14px;
    font-weight: 600;
}

/* Section heading inside signup */
.section-mini {
    font-family: 'Quicksand', sans-serif;
    font-size: .72rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: .8px;
    color: var(--sky-500);
    margin: 20px 0 12px;
    display: flex;
    align-items: center;
    gap: 8px;
}

.section-mini::after {
    content: '';
    flex: 1;
    height: 1.5px;
    background: var(--border-s);
}

/* Student info mini-table (readonly preview in signup) */
.info-table-wrap {
    background: var(--sky-50);
    border: 2px solid var(--border);
    border-radius: 14px;
    overflow: hidden;
    margin-bottom: 16px;
}

.info-table {
    width: 100%;
    border-collapse: collapse;
    font-size: .82rem;
}

.info-table th {
    background: var(--sky-100);
    color: var(--text-dark);
    padding: 10px 14px;
    text-align: left;
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    font-size: .72rem;
    letter-spacing: .4px;
    border-bottom: 1.5px solid var(--border);
}

.info-table td {
    padding: 10px 14px;
    border-bottom: 1px solid var(--border-s);
    color: var(--text-body);
    font-weight: 500;
}

.info-table tr:last-child td { border-bottom: none; }
.info-table tr:hover td { background: #f0f9ff; }

/* Floating hearts decoration */
.hearts { text-align:center; margin-bottom:10px; font-size:13px; opacity:.5; letter-spacing:4px; }
</style>

<div class="auth-wrap">

<%-- ══════════════════════════════════════════════
     LANDING PANEL
══════════════════════════════════════════════ --%>
<asp:Panel ID="pnlLanding" runat="server">
    <div class="auth-card" style="text-align:center;">
        <div class="hearts">💙 💙 💙</div>
        <div class="card-icon">🎓</div>
        <div class="status-pill"><span class="pulse-dot"></span> SoftDev System</div>
        <h2 class="auth-title">Welcome!</h2>
        <p class="auth-sub">Sign in to your student account or create one to get started with the system.</p>

        <asp:Button ID="btnGoLogin"  runat="server" Text="Sign In →"
            CssClass="abtn abtn-primary" OnClick="btnGoLogin_Click" />
        <asp:Button ID="btnGoSignUp" runat="server" Text="✨ Create Account"
            CssClass="abtn abtn-ghost"  OnClick="btnGoSignUp_Click" />
    </div>
</asp:Panel>

<%-- ══════════════════════════════════════════════
     LOGIN PANEL
══════════════════════════════════════════════ --%>
<asp:Panel ID="pnlLogin" runat="server" Visible="false">
    <div class="auth-card">
        <div class="card-icon">🔑</div>
        <h2 class="auth-title">Sign In</h2>
        <p class="auth-sub">Enter your credentials to access the system.</p>

        <div class="fg">
            <label>Username</label>
            <asp:TextBox ID="txtUN" runat="server" CssClass="inp" placeholder="Your username" />
        </div>

        <div class="fg">
            <label>Password</label>
            <asp:TextBox ID="txtPW" runat="server" CssClass="inp"
                TextMode="Password" placeholder="Your password" />
        </div>

        <asp:Button ID="btnLogIn" runat="server" Text="Sign In →"
            CssClass="abtn abtn-primary" OnClick="btnLogIn_Click" />

        <asp:LinkButton ID="btnForgot" runat="server"
            CssClass="link-btn" OnClick="btnForgot_Click">
            Forgot your password?
        </asp:LinkButton>

        <asp:Label ID="lblMessage" runat="server" CssClass="msg" />

        <div class="divider">or</div>

        <asp:Button ID="btnBackFromLogin" runat="server"
            Text="← Back" CssClass="abtn abtn-ghost" OnClick="btnBackFromLogin_Click" />
    </div>
</asp:Panel>

<%-- ══════════════════════════════════════════════
     SIGN UP PANEL  (with student info table preview)
══════════════════════════════════════════════ --%>
<asp:Panel ID="pnlSignUp" runat="server" Visible="false">
    <div class="auth-card wide">
        <div class="card-icon">✨</div>
        <h2 class="auth-title">Create Account</h2>
        <p class="auth-sub">Fill in your details to register in the system.</p>

        <%-- ── Student Info Reference Table ── --%>
        <div class="section-mini">Student Information Fields</div>

        <div class="info-table-wrap">
            <table class="info-table">
                <thead>
                    <tr>
                        <th>Field</th>
                        <th>Description</th>
                        <th>Required</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Student Number</td>
                        <td>Your institutional student ID (e.g. 23-0466-891)</td>
                        <td><span style="color:var(--rose); font-weight:700;">Yes</span></td>
                    </tr>
                    <tr>
                        <td>Username</td>
                        <td>Choose a unique login username</td>
                        <td><span style="color:var(--rose); font-weight:700;">Yes</span></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td>Minimum 6 characters recommended</td>
                        <td><span style="color:var(--rose); font-weight:700;">Yes</span></td>
                    </tr>
                    <tr>
                        <td>Email Address</td>
                        <td>A valid email — OTP code will be sent here</td>
                        <td><span style="color:var(--rose); font-weight:700;">Yes</span></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <%-- ── Registration Form ── --%>
        <div class="section-mini">Account Details</div>

        <div class="fg">
            <label>Student Number</label>
            <asp:TextBox ID="txtStudIndex" runat="server" CssClass="inp"
                placeholder="e.g. 23-0466-891" />
            <span class="hint">Hyphens are accepted and stripped automatically.</span>
        </div>

        <div class="form-grid-2">
            <div class="fg">
                <label>Username</label>
                <asp:TextBox ID="txtNewUN" runat="server" CssClass="inp"
                    placeholder="Choose a username" />
            </div>
            <div class="fg">
                <label>Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="inp"
                    TextMode="Email" placeholder="your@email.com" />
            </div>
        </div>

        <div class="form-grid-2">
            <div class="fg">
                <label>Password</label>
                <asp:TextBox ID="txtNewPW" runat="server" CssClass="inp"
                    TextMode="Password" placeholder="Create password" />
            </div>
            <div class="fg">
                <label>Confirm Password</label>
                <asp:TextBox ID="txtConfirmPW" runat="server" CssClass="inp"
                    TextMode="Password" placeholder="Re-enter password" />
            </div>
        </div>

        <asp:Button ID="btnSignUp" runat="server"
            Text="📬 Send Verification Code"
            CssClass="abtn abtn-primary" OnClick="btnSignUp_Click" />

        <asp:Label ID="lblSignUpMessage" runat="server" CssClass="msg" />

        <%-- OTP Panel --%>
        <asp:Panel ID="pnlOTP" runat="server" Visible="false">
            <div class="otp-box">
                <p class="otp-hint">📬 A 6-digit code was sent to your email address.</p>

                <div class="fg">
                    <label>One-Time Password</label>
                    <asp:TextBox ID="txtOTP" runat="server" CssClass="inp"
                        placeholder="Enter 6-digit code" MaxLength="6" />
                </div>

                <asp:Label ID="lblOTPMessage" runat="server" CssClass="msg" />

                <asp:Button ID="btnVerifyOTP" runat="server"
                    Text="✔ Verify Code" CssClass="abtn abtn-warning"
                    OnClick="btnVerifyOTP_Click" />

                <asp:Button ID="btnRegisterFinal" runat="server"
                    Text="Complete Registration 🌸" CssClass="abtn abtn-success"
                    OnClick="btnRegisterFinal_Click" />
            </div>
        </asp:Panel>

        <div class="divider">or</div>

        <asp:Button ID="btnBackFromSignUp" runat="server"
            Text="← Back" CssClass="abtn abtn-ghost" OnClick="btnBackFromSignUp_Click" />
    </div>
</asp:Panel>

<%-- ══════════════════════════════════════════════
     FORGOT PASSWORD PANEL
══════════════════════════════════════════════ --%>
<asp:Panel ID="pnlForgot" runat="server" Visible="false">
    <div class="auth-card">
        <div class="card-icon">🔒</div>
        <h2 class="auth-title">Reset Password</h2>
        <p class="auth-sub">We'll send a reset code to the email linked with your account.</p>

        <div class="fg">
            <label>Username</label>
            <asp:TextBox ID="txtUNReset" runat="server" CssClass="inp"
                placeholder="Enter your username" />
        </div>

        <asp:Button ID="btnSendResetOTP" runat="server"
            Text="📬 Send Reset Code"
            CssClass="abtn abtn-primary" OnClick="btnSendResetOTP_Click" />

        <asp:Label ID="lblForgotMsg" runat="server" CssClass="msg" />

        <div class="divider">enter code &amp; new password</div>

        <div class="fg">
            <label>Reset Code</label>
            <asp:TextBox ID="txtResetOTP" runat="server" CssClass="inp"
                placeholder="6-digit code from email" MaxLength="6" />
        </div>

        <div class="fg">
            <label>New Password</label>
            <asp:TextBox ID="txtNewResetPassword" runat="server"
                CssClass="inp" TextMode="Password"
                placeholder="Your new password" />
        </div>

        <asp:Button ID="btnResetPassword" runat="server"
            Text="✔ Reset Password"
            CssClass="abtn abtn-success" OnClick="btnResetPassword_Click" />

        <div class="divider">or</div>

        <asp:Button ID="btnBackForgot" runat="server"
            Text="← Back to Sign In" CssClass="abtn abtn-ghost"
            OnClick="btnBackForgot_Click" />
    </div>
</asp:Panel>

</div><%-- end auth-wrap --%>

</asp:Content>
