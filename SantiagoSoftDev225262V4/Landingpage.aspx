<%@ Page Title="" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="Landingpage.aspx.cs" Inherits="SantiagoSoftDev225262V4.Landingpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

body {
    background: #f4f6f9;
}

/* HERO */
.hero {
    text-align: center;
    padding: 90px 25px;
    background: linear-gradient(135deg, #1f6feb, #4da3ff);
    color: white;
    border-radius: 16px;
    box-shadow: 0 12px 30px rgba(0,0,0,0.15);
}

.hero h1 {
    font-size: 42px;
    margin-bottom: 10px;
    font-weight: 800;
    color: #ffffff;
    text-shadow: 0 2px 10px rgba(0,0,0,0.2);
}

.hero p {
    font-size: 18px;
    opacity: 0.95;
    color: #ffffff;
}

/* BUTTONS */
.btn-group {
    margin-top: 25px;
}

.btn {
    display: inline-block;
    padding: 12px 22px;
    margin: 6px;
    border-radius: 10px;
    text-decoration: none;
    font-weight: 600;
    color: white;
    transition: 0.3s ease;
}

.login-btn { background: #28a745; }
.signup-btn { background: #ff9800; }

.login-btn:hover { background: #1f7a34; }
.signup-btn:hover { background: #d17f00; }

/* FEATURES */
.section-title {
    text-align: center;
    margin-top: 50px;
    font-size: 26px;
    font-weight: bold;
    color: #333;
}

.features {
    margin-top: 25px;
    display: flex;
    justify-content: center;
    gap: 25px;
    flex-wrap: wrap;
}

.box {
    width: 280px;
    background: white;
    padding: 25px;
    border-radius: 14px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.08);
    text-align: center;
    transition: transform 0.3s ease;
}

.box:hover {
    transform: translateY(-5px);
}

.box i {
    font-size: 34px;
    color: #1f6feb;
    margin-bottom: 12px;
}

.box h3 {
    margin-bottom: 8px;
}

/* MODULE CARDS */
.modules {
    margin-top: 40px;
    display: flex;
    justify-content: center;
    gap: 25px;
    flex-wrap: wrap;
}

.module-card {
    width: 300px;
    background: white;
    border-radius: 14px;
    padding: 25px;
    box-shadow: 0 8px 22px rgba(0,0,0,0.1);
    text-align: center;
    border-top: 4px solid #1f6feb;
}

.module-card h2 {
    margin-bottom: 10px;
    color: #1f6feb;
    font-weight: 700;
}

.module-card p {
    color: #666;
    font-size: 14px;
    line-height: 1.5;
}

.module-card a {
    display: inline-block;
    margin-top: 12px;
    padding: 10px 16px;
    background: #1f6feb;
    color: white;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 600;
}

.module-card a:hover {
    background: #1557c0;
}

</style>

<!-- HERO SECTION -->
<div class="hero">
    <h1>SoftDev Management System</h1>
    <p>Efficiently manage Students, Programs, and Colleges in one centralized system</p>

    <div class="btn-group">
        <a href="Login.aspx" class="b'tn login-btn">Login</a>
        <a href="Login.aspx" class="btn signup-btn">Create Account</a>
    </div>
</div>

<!-- MODULE TITLE -->
<div class="section-title">System Modules</div>

<!-- MODULES -->
<div class="modules">

    <div class="module-card">
        <h2>Student Information</h2>
        <p>Manage student profiles, records, and personal details efficiently.</p>
        <a href="StudentInfoCrud.aspx">Open Module</a>
    </div>

    <div class="module-card">
        <h2>Program Management</h2>
        <p>Create, update, and organize academic programs per college.</p>
        <a href="ProgramCrud.aspx">Open Module</a>
    </div>

    <div class="module-card">
        <h2>College Management</h2>
        <p>Maintain college records and structure within the institution.</p>
        <a href="CollegeCrud.aspx">Open Module</a>
    </div>

</div>

</asp:Content>