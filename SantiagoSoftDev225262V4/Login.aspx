<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/MySite.Master"
    AutoEventWireup="true" CodeBehind="Login.aspx.cs"
    Inherits="SantiagoSoftDev225262V4.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
body {
    font-family: Arial;
    background: #eef2f7;
}

.auth-wrapper {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.card {
    width: 420px;
    background: #fff;
    padding: 30px;
    border-radius: 14px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.12);
}

h2 {
    text-align: center;
    margin-bottom: 18px;
}

.input {
    width: 100%;
    padding: 12px;
    margin-bottom: 12px;
    border: 1px solid #d0d7de;
    border-radius: 8px;
    outline: none;
}

.input:focus {
    border-color: #1a73e8;
    box-shadow: 0 0 0 2px rgba(26,115,232,0.2);
}

.btn {
    width: 100%;
    padding: 12px;
    margin-top: 8px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-weight: bold;
}

.primary { background: #1a73e8; color: white; }
.success { background: #188038; color: white; }
.gray { background: #e0e0e0; }
.orange { background: #f9ab00; color: white; }

.msg {
    text-align: center;
    color: red;
    margin-top: 8px;
}

.hint {
    font-size: 12px;
    color: #666;
    margin-top: -6px;
    margin-bottom: 10px;
    display: block;
}

.link {
    text-align: center;
    display: block;
    margin-top: 10px;
    color: #1a73e8;
    cursor: pointer;
}
</style>

<div class="auth-wrapper">

<!-- LANDING -->
<asp:Panel ID="pnlLanding" runat="server">
    <div class="card">
        <h2>SoftDev System</h2>

        <asp:Button ID="btnGoLogin" runat="server"
            Text="Login"
            CssClass="btn primary"
            OnClick="btnGoLogin_Click" />

        <asp:Button ID="btnGoSignUp" runat="server"
            Text="Create Account"
            CssClass="btn gray"
            OnClick="btnGoSignUp_Click" />
    </div>
</asp:Panel>

<!-- LOGIN -->
<asp:Panel ID="pnlLogin" runat="server" Visible="false">
    <div class="card">
        <h2>Login</h2>

        <asp:TextBox ID="txtUN" runat="server" CssClass="input" placeholder="Username" />
        <asp:TextBox ID="txtPW" runat="server" CssClass="input" TextMode="Password" placeholder="Password" />

        <asp:Button ID="btnLogIn" runat="server"
            Text="Login"
            CssClass="btn primary"
            OnClick="btnLogIn_Click" />

        <asp:LinkButton ID="btnForgot" runat="server"
            CssClass="link"
            OnClick="btnForgot_Click">
            Forgot password?
        </asp:LinkButton>

        <asp:Label ID="lblMessage" runat="server" CssClass="msg" />

        <asp:Button ID="btnBackFromLogin" runat="server"
            Text="Back"
            CssClass="btn gray"
            OnClick="btnBackFromLogin_Click" />
    </div>
</asp:Panel>

<!-- SIGN UP -->
<asp:Panel ID="pnlSignUp" runat="server" Visible="false">
    <div class="card">
        <h2>Create Account</h2>

        <asp:TextBox ID="txtStudIndex" runat="server"
            CssClass="input"
            placeholder="Student Number (23-0466-891 allowed)" />

        <asp:TextBox ID="txtNewUN" runat="server" CssClass="input" placeholder="Username" />
        <asp:TextBox ID="txtNewPW" runat="server" CssClass="input" TextMode="Password" placeholder="Password" />
        <asp:TextBox ID="txtEmail" runat="server" CssClass="input" placeholder="Email Address" />

        <asp:Button ID="btnSignUp" runat="server"
            Text="Send OTP"
            CssClass="btn primary"
            OnClick="btnSignUp_Click" />

        <asp:Label ID="lblSignUpMessage" runat="server" CssClass="msg" />

        <!-- OTP PANEL -->
        <asp:Panel ID="pnlOTP" runat="server" Visible="false">

            <asp:TextBox ID="txtOTP" runat="server"
                CssClass="input"
                placeholder="Enter OTP" />

            <asp:Label ID="lblOTPMessage" runat="server" CssClass="msg" />

            <asp:Button ID="btnVerifyOTP" runat="server"
                Text="Verify OTP"
                CssClass="btn orange"
                OnClick="btnVerifyOTP_Click" />

            <asp:Button ID="btnRegisterFinal" runat="server"
                Text="Create Account"
                CssClass="btn success"
                OnClick="btnRegisterFinal_Click" />

        </asp:Panel>

        <asp:Button ID="btnBackFromSignUp" runat="server"
            Text="Back"
            CssClass="btn gray"
            OnClick="btnBackFromSignUp_Click" />
    </div>
</asp:Panel>

<asp:Panel ID="pnlForgot" runat="server" Visible="false">
    <div class="card">
        <h2>Reset Password</h2>

        <!-- USERNAME -->
        <asp:TextBox ID="txtUNReset" runat="server"
            CssClass="input"
            placeholder="Username" />

        <!-- EMAIL (NEW - REQUIRED) -->
        <asp:TextBox ID="txtEmailReset" runat="server"
            CssClass="input"
            placeholder="Email Address" />

        <asp:Button ID="btnSendResetOTP" runat="server"
            Text="Send Reset Code"
            CssClass="btn primary"
            OnClick="btnSendResetOTP_Click" />

        <asp:Label ID="lblForgotMsg" runat="server" CssClass="msg" />

        <asp:TextBox ID="txtResetOTP" runat="server"
            CssClass="input"
            placeholder="Enter OTP" />

        <asp:TextBox ID="txtNewResetPassword" runat="server"
            CssClass="input"
            TextMode="Password"
            placeholder="New Password" />

        <asp:Button ID="btnResetPassword" runat="server"
            Text="Reset Password"
            CssClass="btn success"
            OnClick="btnResetPassword_Click" />

        <asp:Button ID="btnBackForgot" runat="server"
            Text="Back"
            CssClass="btn gray"
            OnClick="btnBackForgot_Click" />
    </div>
</asp:Panel>

</div>
</asp:Content>