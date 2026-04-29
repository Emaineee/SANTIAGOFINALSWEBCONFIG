<%@ Page Title="Logging Out" Language="C#" MasterPageFile="~/MySite.Master"
    AutoEventWireup="true" CodeBehind="Logout.aspx.cs"
    Inherits="SantiagoSoftDev225262V4.Logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .logout-box {
            max-width: 400px;
            margin: 60px auto;
            background: white;
            padding: 25px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 6px 18px rgba(0,0,0,0.08);
        }

        .logout-box h2 {
            margin-bottom: 10px;
        }

        .logout-box p {
            color: #555;
        }
    </style>

    <div class="logout-box">
        <h2>Logging Out...</h2>
        <p>You have been logged out due to inactivity.</p>
        <p>Redirecting to Login page...</p>
    </div>

</asp:Content>