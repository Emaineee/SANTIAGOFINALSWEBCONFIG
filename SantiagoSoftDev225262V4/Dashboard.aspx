<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/MySite.Master"
AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs"
Inherits="SantiagoSoftDev225262V4.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="dash-container">

    <!-- TITLE CARD -->
    <div class="card header-card">
        <h2>Dashboard</h2>
        <p>Welcome, <asp:Label ID="lblUser" runat="server" CssClass="user-text" /></p>
    </div>

    <!-- GRID CARD -->
    <div class="card">

        <h3>Student Records Overview</h3>

        <div class="table-wrapper">

            <asp:GridView ID="GridView1" runat="server"
                AutoGenerateColumns="False"
                DataSourceID="SqlDataSource1"
                CssClass="grid-table"
                GridLines="None"
                Width="100%">

                <Columns>

                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="studIndex" HeaderText="Student Index" />
                    <asp:BoundField DataField="UN" HeaderText="Username" />
                    <asp:BoundField DataField="Firstname" HeaderText="First Name" />
                    <asp:BoundField DataField="Lastname" HeaderText="Last Name" />
                    <asp:BoundField DataField="code" HeaderText="Program Code" />

                </Columns>

            </asp:GridView>

        </div>

    </div>

    <!-- INFO CARD -->
    <div class="card info-card">
        <p>Logged-in user data overview system</p>
    </div>

</div>

<!-- ================= SQL (UNCHANGED) ================= -->
<asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>"
    ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>"
    SelectCommand="
    SELECT A.ID,
           A.studIndex,
           A.UN,
           B.Firstname,
           B.Lastname,
           C.code
    FROM ((tblUNPW A
    INNER JOIN tbl_StudentInfo B ON A.studIndex = B.ID)
    INNER JOIN tbl_Program C ON B.programID = C.programID)">
</asp:SqlDataSource>

<!-- ================= DASHBOARD STYLES ================= -->
<style>

.dash-container {
    max-width: 1100px;
    margin: 40px auto;
}

/* reusable card (matches CRUD pages) */
.card {
    background: white;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 12px;
    box-shadow: 0 6px 18px rgba(0,0,0,0.08);
}

/* header */
.header-card {
    text-align: center;
    background: linear-gradient(90deg, #3A8DFF, #4CAFF9);
    color: white;
}

.header-card h2 {
    margin: 0;
}

.user-text {
    font-weight: bold;
}

/* table wrapper */
.table-wrapper {
    overflow-x: auto;
}

/* GRID STYLE (MATCH CRUD LOOK) */
.grid-table {
    width: 100%;
    border-collapse: collapse;
}

.grid-table th {
    background: #3A8DFF;
    color: white;
    padding: 10px;
    text-align: left;
}

.grid-table td {
    padding: 10px;
    border-bottom: 1px solid #eee;
}

.grid-table tr:nth-child(even) {
    background: #f5f9ff;
}

.grid-table tr:hover {
    background: #dbe8ff;
    transition: 0.2s;
}

/* info card */
.info-card {
    text-align: center;
    color: #555;
    font-size: 14px;
}

</style>

</asp:Content>