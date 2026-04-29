<%@ Page Title="" Language="C#" MasterPageFile="~/MySite.Master"
    AutoEventWireup="true" CodeBehind="Login.aspx.cs"
    Inherits="SantiagoSoftDev225262V4.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
    body {
        background: linear-gradient(120deg,#e6f0ff,#f6f9ff);
        font-family: Arial;
    }

    .card {
        max-width: 420px;
        margin: 30px auto;
        background: white;
        padding: 25px;
        border-radius: 14px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.08);
    }

    h2 {
        text-align: center;
        margin-bottom: 15px;
    }

    .input {
        width: 100%;
        padding: 10px;
        margin-bottom: 12px;
        border-radius: 8px;
        border: 1px solid #ddd;
    }

    .btn {
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 8px;
        color: white;
        cursor: pointer;
    }

    .blue { background: #007bff; }
    .green { background: #28a745; }
    .cyan { background: #17a2b8; }
    .gray { background: #6c757d; }
    .orange { background: orange; }

    .msg {
        text-align: center;
        display: block;
        margin-top: 10px;
    }

    /* GRID */
    .grid-container {
        max-width: 900px;
        margin: 40px auto;
        background: white;
        padding: 15px;
        border-radius: 12px;
        box-shadow: 0 6px 18px rgba(0,0,0,0.08);
    }

    .table {
        width: 100%;
        border-collapse: collapse;
    }

    .table th {
        background: #007bff;
        color: white;
        padding: 10px;
    }

    .table td {
        padding: 10px;
        border-bottom: 1px solid #eee;
        text-align: center;
    }
</style>

<!-- ================= LOGIN ================= -->
<div class="card">

    <h2>Login</h2>

    <asp:TextBox ID="txtUN" runat="server" CssClass="input" placeholder="Username"></asp:TextBox>

    <asp:TextBox ID="txtPW" runat="server" CssClass="input"
        TextMode="Password" placeholder="Password"></asp:TextBox>

    <asp:Button ID="btnLogIn" runat="server"
        Text="Login"
        OnClick="btnLogIn_Click"
        CssClass="btn blue" />

    <asp:Label ID="lblMessage" runat="server" CssClass="msg"></asp:Label>

</div>

<!-- ================= SIGNUP BUTTON ================= -->
<div class="card">
    <asp:Button ID="btnShowSignUp" runat="server"
        Text="Create Account"
        OnClick="btnShowSignUp_Click"
        CssClass="btn green" />
</div>

<!-- ================= SIGNUP ================= -->
<asp:Panel ID="pnlSignUp" runat="server" Visible="false">

<div class="card">

    <h2>Sign Up</h2>

    <asp:TextBox ID="txtEmail" runat="server" CssClass="input" placeholder="Email"></asp:TextBox>

    <asp:TextBox ID="txtStudIndex" runat="server" CssClass="input"
        placeholder="Student Number (23-0466-891)"></asp:TextBox>

    <asp:TextBox ID="txtNewUN" runat="server" CssClass="input" placeholder="Username"></asp:TextBox>

    <asp:TextBox ID="txtNewPW" runat="server" CssClass="input" TextMode="Password" placeholder="Password"></asp:TextBox>

    <asp:TextBox ID="txtConfirmPW" runat="server" CssClass="input" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>

    <asp:Button ID="btnSignUp" runat="server"
        Text="Send OTP"
        OnClick="btnSignUp_Click"
        CssClass="btn cyan" />

    <asp:Label ID="lblSignUpMessage" runat="server" CssClass="msg"></asp:Label>

    <hr />

    <!-- ================= OTP ================= -->
    <asp:Panel ID="pnlOTP" runat="server" Visible="false">

        <h3 style="text-align:center;">OTP Verification</h3>

        <asp:TextBox ID="txtOTP" runat="server" CssClass="input" placeholder="Enter OTP"></asp:TextBox>

        <asp:Button ID="btnVerifyOTP" runat="server"
            Text="Verify OTP"
            OnClick="btnVerifyOTP_Click"
            CssClass="btn orange" />

        <asp:Label ID="lblOTPMessage" runat="server" CssClass="msg"></asp:Label>

        <asp:Button ID="btnResendOTP" runat="server"
            Text="Resend OTP"
            OnClick="btnResendOTP_Click"
            CssClass="btn gray" />

        <asp:Label ID="lblTimer" runat="server" CssClass="msg"></asp:Label>

        <asp:HiddenField ID="hfTimeLeft" runat="server" Value="0" />

        <asp:Button ID="btnRegisterFinal" runat="server"
            Text="Create Account"
            OnClick="btnRegisterFinal_Click"
            CssClass="btn green" />

    </asp:Panel>

</div>

</asp:Panel>
</asp:Content>