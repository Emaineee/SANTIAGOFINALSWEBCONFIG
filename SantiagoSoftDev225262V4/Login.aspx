<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/MySite.Master"
    AutoEventWireup="true" CodeBehind="Login.aspx.cs"
    Inherits="SantiagoSoftDev225262V4.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
/* =============================================
   LOGIN PAGE  -  Shooting Stars Background
   ============================================= */

.auth-bg {
    position: fixed;
    inset: 0;
    background: linear-gradient(135deg, #0f172a 0%, #1e3a8a 40%, #38bdf8 100%);
    overflow: hidden;
    z-index: -1;
}

/* Shooting stars */
.shooting-star {
    position: absolute;
    top: 50%;
    left: 50%;
    width: 4px;
    height: 4px;
    background: #fff;
    border-radius: 50%;
    box-shadow: 0 0 6px 2px rgba(255, 255, 255, 0.6), 0 0 20px 4px rgba(147, 197, 253, 0.4);
    opacity: 0;
    animation: shoot 3s ease-in infinite;
}

.shooting-star::before {
    content: '';
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 120px;
    height: 1.5px;
    background: linear-gradient(90deg, rgba(255,255,255,0.8), transparent);
    right: 4px;
}

.shooting-star:nth-child(1) { top: 10%; left: 80%; animation-delay: 0s; animation-duration: 2.8s; }
.shooting-star:nth-child(2) { top: 25%; left: 60%; animation-delay: 1.2s; animation-duration: 3.2s; }
.shooting-star:nth-child(3) { top: 5%;  left: 40%; animation-delay: 2.5s; animation-duration: 2.5s; }
.shooting-star:nth-child(4) { top: 45%; left: 90%; animation-delay: 0.8s; animation-duration: 3.5s; }
.shooting-star:nth-child(5) { top: 70%; left: 30%; animation-delay: 3.1s; animation-duration: 2.9s; }
.shooting-star:nth-child(6) { top: 15%; left: 15%; animation-delay: 1.8s; animation-duration: 3.8s; }
.shooting-star:nth-child(7) { top: 85%; left: 70%; animation-delay: 4.0s; animation-duration: 2.6s; }
.shooting-star:nth-child(8) { top: 55%; left: 50%; animation-delay: 2.2s; animation-duration: 3.1s; }

@keyframes shoot {
    0%   { transform: rotate(-45deg) translateX(0); opacity: 0; }
    10%  { opacity: 1; }
    60%  { opacity: 0.8; }
    100% { transform: rotate(-45deg) translateX(-600px); opacity: 0; }
}

/* Floating particles */
.particle {
    position: absolute;
    width: 3px;
    height: 3px;
    background: rgba(255, 255, 255, 0.4);
    border-radius: 50%;
    animation: float-up 12s linear infinite;
}

.particle:nth-child(9)  { left: 10%; animation-delay: 0s; animation-duration: 14s; }
.particle:nth-child(10) { left: 25%; animation-delay: 2s; animation-duration: 11s; }
.particle:nth-child(11) { left: 40%; animation-delay: 4s; animation-duration: 16s; }
.particle:nth-child(12) { left: 55%; animation-delay: 1s; animation-duration: 13s; }
.particle:nth-child(13) { left: 70%; animation-delay: 3s; animation-duration: 15s; }
.particle:nth-child(14) { left: 85%; animation-delay: 5s; animation-duration: 12s; }
.particle:nth-child(15) { left: 95%; animation-delay: 6s; animation-duration: 10s; }

@keyframes float-up {
    0%   { transform: translateY(100vh) scale(0); opacity: 0; }
    20%  { opacity: 0.6; }
    100% { transform: translateY(-100px) scale(1.5); opacity: 0; }
}

/* Main container */
.auth-wrapper {
    min-height: calc(100vh - 70px);
    display: flex;
    align-items: center;
    justify-content: flex-end; /* Right side on desktop */
    padding: 32px 5%;
    position: relative;
}

.auth-card {
    width: 100%;
    max-width: 520px;
    animation: slideInRight 0.6s cubic-bezier(.22,1,.36,1) both;
}

@keyframes slideInRight {
    from { opacity: 0; transform: translateX(40px); }
    to   { opacity: 1; transform: translateX(0); }
}

/* Glass card */
.crud-card {
    background: rgba(255, 255, 255, 0.12);
    backdrop-filter: blur(24px);
    -webkit-backdrop-filter: blur(24px);
    border: 1.5px solid rgba(255, 255, 255, 0.2);
    border-radius: 24px;
    overflow: hidden;
    box-shadow: 0 8px 40px rgba(0, 0, 0, 0.3), inset 0 1px 0 rgba(255,255,255,0.15);
}

.crud-card.wide { max-width: 640px; }

/* Form panel */
.form-panel {
    padding: 32px 28px;
    animation: fadeUp .4s cubic-bezier(.22,1,.36,1) both;
}

@keyframes fadeUp {
    from { opacity:0; transform:translateY(16px); }
    to   { opacity:1; transform:translateY(0); }
}

/* Centered header for auth cards */
.auth-hdr {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    margin-bottom: 28px;
    animation: fadeUp .38s cubic-bezier(.22,1,.36,1) both;
}

.auth-hdr .page-hdr-icon {
    margin-bottom: 14px;
    width: 56px; height: 56px;
    background: rgba(255, 255, 255, 0.15);
    border: 2px solid rgba(255, 255, 255, 0.25);
    border-radius: 16px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 24px;
    color: #bae6fd;
}

.auth-hdr h2 {
    font-family: 'Quicksand', sans-serif;
    font-size: 1.6rem;
    font-weight: 800;
    color: #ffffff;
    margin-bottom: 6px;
    text-shadow: 0 2px 8px rgba(0,0,0,0.3);
}

.auth-hdr p {
    font-size: .875rem;
    color: rgba(255, 255, 255, 0.75);
    font-weight: 500;
}

/* Status pill */
.status-pill {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 6px;
    background: rgba(56, 189, 248, 0.15);
    border: 1.5px solid rgba(56, 189, 248, 0.3);
    border-radius: 999px;
    padding: 5px 14px;
    font-size: .72rem;
    color: #bae6fd;
    font-weight: 700;
    font-family: 'Quicksand', sans-serif;
    letter-spacing: .5px;
    text-transform: uppercase;
    margin-bottom: 20px;
    width: fit-content;
    animation: fadeUp .3s cubic-bezier(.22,1,.36,1) both;
}

.status-pill .pulse-dot {
    width: 7px; height: 7px;
    border-radius: 50%;
    background: #38bdf8;
    animation: blink 2s ease-in-out infinite;
}

@keyframes blink {
    0%,100% { opacity:1; transform:scale(1); }
    50%      { opacity:.4; transform:scale(.75); }
}

/* Form elements */
.form-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 14px;
    margin-bottom: 18px;
}

.fg { margin-bottom: 16px; }

.fg label {
    display: block;
    font-size: .73rem;
    font-weight: 700;
    color: rgba(255, 255, 255, 0.85);
    letter-spacing: .5px;
    text-transform: uppercase;
    margin-bottom: 7px;
    font-family: 'Quicksand', sans-serif;
}

.fg .hint {
    font-size: .72rem;
    color: rgba(255, 255, 255, 0.5);
    font-style: italic;
    margin-top: 4px;
    display: block;
}

.inp {
    width: 100%;
    padding: 13px 15px;
    background: rgba(255, 255, 255, 0.1);
    border: 1.5px solid rgba(255, 255, 255, 0.2);
    border-radius: 12px;
    color: #ffffff;
    font-family: 'Nunito', sans-serif;
    font-size: .915rem;
    font-weight: 500;
    outline: none;
    transition: border-color 0.3s, box-shadow 0.3s, background 0.3s;
}

.inp::placeholder { color: rgba(255, 255, 255, 0.4); }

.inp:focus {
    border-color: #38bdf8;
    background: rgba(255, 255, 255, 0.15);
    box-shadow: 0 0 0 3px rgba(56, 189, 248, 0.2);
}

select.inp {
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' fill='none'%3E%3Cpath d='M1 1l5 5 5-5' stroke='%23bae6fd' stroke-width='1.8' stroke-linecap='round'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 14px center;
    padding-right: 36px;
    cursor: pointer;
}

select.inp option { background: #1e3a8a; color: #fff; }

.form-actions { display: flex; gap: 10px; flex-wrap: wrap; flex-direction: column; }

/* Action buttons */
.abtn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 7px;
    padding: 13px 20px;
    border-radius: 12px;
    font-family: 'Nunito', sans-serif;
    font-size: .9rem;
    font-weight: 700;
    cursor: pointer;
    border: none;
    transition: transform 0.2s, box-shadow 0.2s, opacity 0.2s;
    letter-spacing: .1px;
    width: 100%;
}

.abtn:hover  { opacity: .9; transform: translateY(-2px); }
.abtn:active { transform: translateY(0); }

.abtn-primary { background: linear-gradient(135deg, #38bdf8 0%, #0284c7 100%); color: white; box-shadow: 0 4px 16px rgba(56, 189, 248, 0.35); }
.abtn-success { background: linear-gradient(135deg, #34d399 0%, #10b981 100%); color: white; box-shadow: 0 4px 14px rgba(16, 185, 129, 0.3); }
.abtn-warning { background: linear-gradient(135deg, #fbbf24 0%, #f59e0b 100%); color: white; box-shadow: 0 4px 14px rgba(245, 158, 11, 0.3); }
.abtn-ghost   { background: rgba(255,255,255,0.1); color: rgba(255,255,255,0.85); border: 1.5px solid rgba(255,255,255,0.25); }
.abtn-ghost:hover { background: rgba(255,255,255,0.15); }

/* Link-style button */
.link-btn {
    display: block;
    text-align: center;
    margin-top: 14px;
    font-size: .875rem;
    color: #bae6fd;
    cursor: pointer;
    background: none;
    border: none;
    font-family: 'Nunito', sans-serif;
    font-weight: 700;
    text-decoration: none;
    transition: color 0.3s;
    width: 100%;
}
.link-btn:hover { color: #ffffff; }

/* Messages */
.msg-bar {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 14px 18px;
    border-radius: 12px;
    font-size: .875rem;
    font-weight: 600;
    margin-bottom: 20px;
    animation: fadeUp .3s cubic-bezier(.22,1,.36,1) both;
    font-family: 'Nunito', sans-serif;
    text-align: center;
    justify-content: center;
}

.msg-success {
    background: rgba(52, 211, 153, 0.15);
    border: 1.5px solid rgba(52, 211, 153, 0.3);
    color: #a7f3d0;
}

.msg-error {
    background: rgba(239, 68, 68, 0.15);
    border: 1.5px solid rgba(239, 68, 68, 0.3);
    color: #fca5a5;
}

/* Divider */
.divider {
    display: flex;
    align-items: center;
    gap: 10px;
    margin: 22px 0 8px;
    color: rgba(255, 255, 255, 0.4);
    font-size: .72rem;
    letter-spacing: .6px;
    text-transform: uppercase;
    font-weight: 600;
}

.divider::before, .divider::after {
    content: '';
    flex: 1;
    height: 1.5px;
    background: rgba(255, 255, 255, 0.15);
}

/* OTP section */
.otp-section {
    margin-top: 24px;
    border-top: 1.5px dashed rgba(255, 255, 255, 0.2);
    padding-top: 24px;
}

.otp-input-wrap {
    max-width: 260px;
    margin: 0 auto 16px;
}

.otp-input {
    text-align: center;
    letter-spacing: 8px;
    font-size: 1.4rem;
    font-weight: 800;
    font-family: 'Courier New', monospace;
}

/* Section heading */
.section-mini {
    font-family: 'Quicksand', sans-serif;
    font-size: .72rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: .8px;
    color: #bae6fd;
    margin: 20px 0 12px;
    display: flex;
    align-items: center;
    gap: 8px;
}

.section-mini::after {
    content: '';
    flex: 1;
    height: 1.5px;
    background: rgba(255, 255, 255, 0.15);
}

/* Info table */
.info-table-wrap {
    background: rgba(255, 255, 255, 0.08);
    border: 1.5px solid rgba(255, 255, 255, 0.15);
    border-radius: 14px;
    overflow: hidden;
    margin-bottom: 18px;
}

.info-table {
    width: 100%;
    border-collapse: collapse;
    font-size: .82rem;
}

.info-table th {
    background: rgba(56, 189, 248, 0.15);
    color: #bae6fd;
    padding: 10px 14px;
    text-align: left;
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    font-size: .72rem;
    letter-spacing: .4px;
    border-bottom: 1.5px solid rgba(255, 255, 255, 0.1);
}

.info-table td {
    padding: 10px 14px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.08);
    color: rgba(255, 255, 255, 0.8);
    font-weight: 500;
}

.info-table tr:last-child td { border-bottom: none; }
.info-table tr:hover td { background: rgba(255, 255, 255, 0.05); }

/* Validation error text */
.val-error {
    display: block;
    font-size: .72rem;
    color: #fca5a5;
    font-weight: 600;
    margin-top: 4px;
}

/* Responsive */
@media (max-width: 768px) {
    .auth-wrapper {
        justify-content: center; /* Center on tablet/mobile */
        padding: 20px 16px;
    }
    
    .crud-card, .crud-card.wide { max-width: 100%; }
    
    .form-panel { padding: 24px 20px; }
    
    .auth-hdr h2 { font-size: 1.4rem; }
    
    .form-grid { grid-template-columns: 1fr; }
}

@media (max-width: 400px) {
    .auth-wrapper { padding: 12px 10px; }
    .form-panel { padding: 20px 16px; }
    .abtn { padding: 11px 16px; font-size: .85rem; }
}
</style>

<%-- Shooting Stars Background --%>
<div class="auth-bg">
    <div class="shooting-star"></div>
    <div class="shooting-star"></div>
    <div class="shooting-star"></div>
    <div class="shooting-star"></div>
    <div class="shooting-star"></div>
    <div class="shooting-star"></div>
    <div class="shooting-star"></div>
    <div class="shooting-star"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
</div>

<div class="auth-wrapper">

<%-- ============================================
     LANDING PANEL
     ============================================ --%>
<asp:Panel ID="pnlLanding" runat="server">
    <div class="auth-card">
        <div class="crud-card">
            <div class="form-panel" style="text-align:center;">
                <div class="auth-hdr">
                    <div class="page-hdr-icon"> </div>
                    <h2>Welcome!</h2>
                    <p>Sign in to your student account or create one to get started with the system.</p>
                </div>

                <div class="status-pill"><span class="pulse-dot"></span> SoftDev System</div>

                <asp:Button ID="btnGoLogin"  runat="server" Text="Sign In"
                    CssClass="abtn abtn-primary" OnClick="btnGoLogin_Click" />
                <asp:Button ID="btnGoSignUp" runat="server" Text="Create Account"
                    CssClass="abtn abtn-ghost"  OnClick="btnGoSignUp_Click" />
            </div>
        </div>
    </div>
</asp:Panel>

<%-- ============================================
     LOGIN PANEL
     ============================================ --%>
<asp:Panel ID="pnlLogin" runat="server" Visible="false">
    <div class="auth-card">
        <div class="crud-card">
            <div class="form-panel">
                <div class="auth-hdr">
                    <div class="page-hdr-icon"> </div>
                    <h2>Sign In</h2>
                    <p>Enter your credentials to access the system.</p>
                </div>

                <div class="fg">
                    <label>Username</label>
                    <asp:TextBox ID="txtUN" runat="server" CssClass="inp" placeholder="Your username" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUN"
                        ErrorMessage="Username is required." Display="Dynamic"
                        ValidationGroup="LoginGroup"
                        CssClass="val-error" />
                </div>

                <div class="fg">
                    <label>Password</label>
                    <asp:TextBox ID="txtPW" runat="server" CssClass="inp"
                        TextMode="Password" placeholder="Your password" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPW"
                        ErrorMessage="Password is required." Display="Dynamic"
                        ValidationGroup="LoginGroup"
                        CssClass="val-error" />
                </div>

                <asp:Button ID="btnLogIn" runat="server" Text="Sign In"
                    CssClass="abtn abtn-primary" OnClick="btnLogIn_Click"
                    ValidationGroup="LoginGroup" />

                <asp:LinkButton ID="btnForgot" runat="server"
                    CssClass="link-btn" OnClick="btnForgot_Click">
                    Forgot your password?
                </asp:LinkButton>

                <asp:Label ID="lblMessage" runat="server" CssClass="msg-bar msg-error" Visible="false" />

                <div class="divider">or</div>

                <asp:Button ID="btnBackFromLogin" runat="server"
                    Text="Back" CssClass="abtn abtn-ghost" OnClick="btnBackFromLogin_Click" />
            </div>
        </div>
    </div>
</asp:Panel>

<%-- ============================================
     SIGN UP PANEL (Unified with OTP Section)
     ============================================ --%>
<asp:Panel ID="pnlSignUp" runat="server" Visible="false">
    <div class="auth-card">
        <div class="crud-card wide">
            <div class="form-panel">
                <div class="auth-hdr">
                    <div class="page-hdr-icon"> </div>
                    <h2>Create Account</h2>
                    <p>Fill in your details to register in the system.</p>
                </div>

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
                            <tr><td>Student Number</td><td>Institutional ID (e.g. 23-0466-891)</td><td><span style="color:#fca5a5; font-weight:700;">Yes</span></td></tr>
                            <tr><td>First Name</td><td>Your legal first name</td><td><span style="color:#fca5a5; font-weight:700;">Yes</span></td></tr>
                            <tr><td>Last Name</td><td>Your legal last name</td><td><span style="color:#fca5a5; font-weight:700;">Yes</span></td></tr>
                            <tr><td>Program</td><td>Enrolled academic program</td><td><span style="color:#fca5a5; font-weight:700;">Yes</span></td></tr>
                            <tr><td>Username</td><td>Unique login username</td><td><span style="color:#fca5a5; font-weight:700;">Yes</span></td></tr>
                            <tr><td>Password</td><td>Minimum 6 characters</td><td><span style="color:#fca5a5; font-weight:700;">Yes</span></td></tr>
                            <tr><td>Email Address</td><td>Valid email for OTP</td><td><span style="color:#fca5a5; font-weight:700;">Yes</span></td></tr>
                        </tbody>
                    </table>
                </div>

                <div class="section-mini">Account Details</div>

                <div class="fg">
                    <label>Student Number</label>
                    <asp:TextBox ID="txtStudIndex" runat="server" CssClass="inp" placeholder="e.g. 23-0466-891" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtStudIndex"
                        ErrorMessage="Student number is required." Display="Dynamic" ValidationGroup="SignupGroup" CssClass="val-error" />
                    <span class="hint">Hyphens are accepted and stripped automatically.</span>
                </div>

                <div class="form-grid">
                    <div class="fg">
                        <label>First Name</label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="inp" placeholder="First name" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFirstName"
                            ErrorMessage="First Name is required." Display="Dynamic" ValidationGroup="SignupGroup" CssClass="val-error" />
                    </div>
                    <div class="fg">
                        <label>Last Name</label>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="inp" placeholder="Last name" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLastName"
                            ErrorMessage="Last Name is required." Display="Dynamic" ValidationGroup="SignupGroup" CssClass="val-error" />
                    </div>
                </div>

                <div class="form-grid">
                    <div class="fg">
                        <label>Birthday</label>
                        <asp:TextBox ID="txtBday" runat="server" CssClass="inp" TextMode="Date" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtBday"
                            ErrorMessage="Birthday is required." Display="Dynamic" ValidationGroup="SignupGroup" CssClass="val-error" />
                    </div>
                    <div class="fg">
                        <label>Sex</label>
                        <asp:DropDownList ID="ddlSex" runat="server" CssClass="inp">
                            <asp:ListItem Text="Male" Value="Male" />
                            <asp:ListItem Text="Female" Value="Female" />
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-grid">
                    <div class="fg">
                        <label>Year Level</label>
                        <asp:TextBox ID="txtYearLevel" runat="server" CssClass="inp" placeholder="1 - 4" MaxLength="1" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtYearLevel"
                            ErrorMessage="Year Level is required." Display="Dynamic" ValidationGroup="SignupGroup" CssClass="val-error" />
                    </div>
                    <div class="fg">
                        <label>Program</label>
                        <asp:DropDownList ID="ddlProgram" runat="server" CssClass="inp" DataTextField="code" DataValueField="programID" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlProgram"
                            ErrorMessage="Program is required." InitialValue="" Display="Dynamic" ValidationGroup="SignupGroup" CssClass="val-error" />
                    </div>
                </div>

                <div class="form-grid">
                    <div class="fg">
                        <label>Username</label>
                        <asp:TextBox ID="txtNewUN" runat="server" CssClass="inp" placeholder="Choose a username" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNewUN"
                            ErrorMessage="Username is required." Display="Dynamic" ValidationGroup="SignupGroup" CssClass="val-error" />
                    </div>
                    <div class="fg">
                        <label>Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="inp" TextMode="Email" placeholder="your@email.com" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Email is required." Display="Dynamic" ValidationGroup="SignupGroup" CssClass="val-error" />
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Invalid email format." Display="Dynamic"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="SignupGroup" CssClass="val-error" />
                    </div>
                </div>

                <div class="form-grid">
                    <div class="fg">
                        <label>Password</label>
                        <asp:TextBox ID="txtNewPW" runat="server" CssClass="inp" TextMode="Password" placeholder="Create password" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNewPW"
                            ErrorMessage="Password is required." Display="Dynamic" ValidationGroup="SignupGroup" CssClass="val-error" />
                    </div>
                    <div class="fg">
                        <label>Confirm Password</label>
                        <asp:TextBox ID="txtConfirmPW" runat="server" CssClass="inp" TextMode="Password" placeholder="Re-enter password" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConfirmPW"
                            ErrorMessage="Please confirm your password." Display="Dynamic" ValidationGroup="SignupGroup" CssClass="val-error" />
                        <asp:CompareValidator runat="server" ControlToValidate="txtConfirmPW" ControlToCompare="txtNewPW"
                            ErrorMessage="Passwords do not match." Display="Dynamic" ValidationGroup="SignupGroup" CssClass="val-error" />
                    </div>
                </div>

                <asp:Button ID="btnSignUp" runat="server" Text="Send Verification Code"
                    CssClass="abtn abtn-primary" OnClick="btnSignUp_Click" ValidationGroup="SignupGroup" />

                <asp:Label ID="lblSignUpMessage" runat="server" CssClass="msg-bar msg-error" Visible="false" />

                <%-- OTP Verification Section --%>
                <asp:Panel ID="pnlOTPSection" runat="server" Visible="false" CssClass="otp-section">
                    <div class="section-mini">Step 2: Verify Your Email</div>
                    <p style="text-align:center; color:rgba(255,255,255,0.6); margin-bottom:18px; font-size:.9rem;">
                        A 6-digit code was sent to <strong id="lblTargetEmail" runat="server"></strong>. This code expires in 5 minutes.
                    </p>

                    <div class="otp-input-wrap">
                        <label style="display:block; font-size:.73rem; font-weight:700; color:rgba(255,255,255,0.85); text-transform:uppercase; margin-bottom:7px; font-family:'Quicksand',sans-serif;">Verification Code</label>
                        <asp:TextBox ID="txtOTP" runat="server" CssClass="inp otp-input" placeholder="######" MaxLength="6" />
                    </div>

                    <asp:Label ID="lblOTPMessage" runat="server" CssClass="msg-bar msg-error" Visible="false" />

                    <div class="form-actions">
                        <asp:Button ID="btnVerifyOTP" runat="server" Text="Verify Code" CssClass="abtn abtn-warning" OnClick="btnVerifyOTP_Click" />
                        <asp:Button ID="btnResendOTP" runat="server" Text="Resend Code" CssClass="abtn abtn-ghost" OnClick="btnResendOTP_Click" />
                    </div>

                    <div class="divider">verified?</div>

                    <asp:Button ID="btnRegisterFinal" runat="server" Text="Complete Registration" CssClass="abtn abtn-success" OnClick="btnRegisterFinal_Click" />

                    <div class="divider">or</div>

                    <asp:Button ID="btnBackFromSignUp" runat="server" Text="Back" CssClass="abtn abtn-ghost" OnClick="btnBackFromSignUp_Click" />
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Panel>

<%-- ============================================
     FORGOT PASSWORD PANEL
     ============================================ --%>
<asp:Panel ID="pnlForgot" runat="server" Visible="false">
    <div class="auth-card">
        <div class="crud-card">
            <div class="form-panel">
                <div class="auth-hdr">
                    <div class="page-hdr-icon"> </div>
                    <h2>Reset Password</h2>
                    <p>We'll send a reset code to the email linked with your account.</p>
                </div>

                <div class="fg">
                    <label>Username</label>
                    <asp:TextBox ID="txtUNReset" runat="server" CssClass="inp" placeholder="Enter your username" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUNReset"
                        ErrorMessage="Username is required." Display="Dynamic" ValidationGroup="SendResetGroup" CssClass="val-error" />
                </div>

                <div class="fg">
                    <label>Email Address</label>
                    <asp:TextBox ID="txtForgotEmail" runat="server" CssClass="inp" TextMode="Email" placeholder="your@email.com" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtForgotEmail"
                        ErrorMessage="Email is required." Display="Dynamic" ValidationGroup="SendResetGroup" CssClass="val-error" />
                </div>

                <asp:Button ID="btnSendResetOTP" runat="server" Text="Send Reset Code"
                    CssClass="abtn abtn-primary" OnClick="btnSendResetOTP_Click" ValidationGroup="SendResetGroup" />

                <asp:Label ID="lblForgotMsg" runat="server" CssClass="msg-bar msg-error" Visible="false" />

                <div class="divider">enter code &amp; new password</div>

                <div class="fg">
                    <label>Reset Code</label>
                    <asp:TextBox ID="txtResetOTP" runat="server" CssClass="inp" placeholder="6-digit code from email" MaxLength="6" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtResetOTP"
                        ErrorMessage="Reset code is required." Display="Dynamic" ValidationGroup="ConfirmResetGroup" CssClass="val-error" />
                </div>

                <div class="fg">
                    <label>New Password</label>
                    <asp:TextBox ID="txtNewResetPassword" runat="server" CssClass="inp" TextMode="Password" placeholder="Your new password" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNewResetPassword"
                        ErrorMessage="New password is required." Display="Dynamic" ValidationGroup="ConfirmResetGroup" CssClass="val-error" />
                </div>

                <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password"
                    CssClass="abtn abtn-success" OnClick="btnResetPassword_Click" ValidationGroup="ConfirmResetGroup" />

                <div class="divider">or</div>

                <asp:Button ID="btnBackForgot" runat="server" Text="Back to Sign In" CssClass="abtn abtn-ghost" OnClick="btnBackForgot_Click" />
            </div>
        </div>
    </div>
</asp:Panel>

</div><%-- end auth-wrapper --%>

</asp:Content>
