<%@ Page Title="Home" Language="C#" MasterPageFile="~/MySite.Master"
AutoEventWireup="true" CodeBehind="Home.aspx.cs"
Inherits="SantiagoSoftDev225262V4.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .home-container {
        text-align: center;
        padding: 70px 20px;
        font-family: Arial;
    }

    .title {
        font-size: 34px;
        font-weight: bold;
        color: #3A8DFF;
        margin-bottom: 10px;
    }

    .subtitle {
        font-size: 18px;
        color: #555;
        margin-bottom: 30px;
    }

    .card {
        display: inline-block;
        background: #f5f9ff;
        padding: 25px 30px;
        border-radius: 14px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.08);
        max-width: 600px;
        margin: auto;
    }

    .info {
        font-size: 16px;
        color: #333;
        line-height: 1.8;
    }

    .instructor {
        margin-top: 25px;
        font-weight: bold;
        color: #2f7dff;
    }
</style>

<div class="home-container">

    <div class="title">ELECTIVE 2 - SOFTWARE DEVELOPMENT 2</div>

    <div class="card">

        <div class="info">
            Ulrica Loraine D.S. Santiago<br />
            BS Computer Engineering - 3rd Year<br />
            2nd Semester S.Y. 2025–2026
        </div>

        <div class="instructor">
            Instructor: Jerome Refan, CPE
        </div>

    </div>

</div>

</asp:Content>