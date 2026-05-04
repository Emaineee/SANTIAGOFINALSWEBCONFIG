<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/MySite.Master"
    AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs"
    Inherits="SantiagoSoftDev225262V4.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
/* ═══════════════════════════════════════
   DASHBOARD PAGE
═══════════════════════════════════════ */
.dash-wrap { max-width: 1060px; margin: 0 auto; }

/* Welcome banner */
.welcome-banner {
    background: linear-gradient(135deg, #bae6fd 0%, #e0f2fe 55%, #fce7f3 100%);
    border: 2px solid var(--border);
    border-radius: 22px;
    padding: 32px 36px;
    margin-bottom: 28px;
    display: flex;
    align-items: center;
    gap: 20px;
    box-shadow: var(--shadow);
    animation: fadeUp .4s cubic-bezier(.22,1,.36,1) both;
    flex-wrap: wrap;
}

@keyframes fadeUp {
    from { opacity:0; transform:translateY(16px); }
    to   { opacity:1; transform:translateY(0); }
}

.welcome-avatar {
    width: 64px; height: 64px;
    background: linear-gradient(135deg, var(--sky-300) 0%, var(--blush-d) 100%);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 28px;
    flex-shrink: 0;
    border: 3px solid white;
    box-shadow: 0 4px 16px rgba(56,189,248,0.25);
}

.welcome-text h2 {
    font-family: 'Quicksand', sans-serif;
    font-size: 1.45rem;
    font-weight: 700;
    color: var(--text-dark);
    margin-bottom: 4px;
}

.welcome-text p {
    font-size: .875rem;
    color: var(--text-muted);
    font-weight: 500;
}

.welcome-text .uname {
    color: var(--sky-600);
    font-weight: 700;
}

/* Quick-stat row */
.quick-stats {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
    gap: 16px;
    margin-bottom: 28px;
    animation: fadeUp .45s .06s cubic-bezier(.22,1,.36,1) both;
}

.qs-card {
    background: white;
    border: 2px solid var(--border-s);
    border-radius: 16px;
    padding: 20px 16px;
    text-align: center;
    box-shadow: var(--shadow);
    transition: transform .2s, box-shadow .2s;
}

.qs-card:hover { transform: translateY(-3px); box-shadow: var(--shadow-md); }

.qs-icon { font-size: 24px; margin-bottom: 8px; }

.qs-val {
    font-family: 'Quicksand', sans-serif;
    font-size: 1.8rem;
    font-weight: 700;
    color: var(--sky-600);
    line-height: 1;
    margin-bottom: 5px;
}

.qs-lbl {
    font-size: .7rem;
    font-weight: 700;
    color: var(--text-muted);
    text-transform: uppercase;
    letter-spacing: .6px;
    font-family: 'Quicksand', sans-serif;
}

/* Table card */
.table-card {
    background: white;
    border: 2px solid var(--border-s);
    border-radius: 20px;
    overflow: hidden;
    box-shadow: var(--shadow);
    margin-bottom: 24px;
    animation: fadeUp .5s .1s cubic-bezier(.22,1,.36,1) both;
}

.table-card-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 18px 22px;
    border-bottom: 2px solid var(--border-s);
    flex-wrap: wrap;
    gap: 10px;
}

.table-card-title {
    font-family: 'Quicksand', sans-serif;
    font-size: 1rem;
    font-weight: 700;
    color: var(--text-dark);
    display: flex;
    align-items: center;
    gap: 8px;
}

.table-card-sub {
    font-size: .78rem;
    color: var(--text-muted);
    font-weight: 500;
}

.table-scroll { overflow-x: auto; }

/* GridView override */
.dash-grid { width: 100% !important; border-collapse: collapse !important; font-size: .875rem; }

.dash-grid th {
    background: var(--sky-100) !important;
    color: var(--text-dark) !important;
    padding: 13px 16px !important;
    text-align: left !important;
    font-family: 'Quicksand', sans-serif !important;
    font-weight: 700 !important;
    font-size: .75rem !important;
    letter-spacing: .4px !important;
    border-bottom: 2px solid var(--border) !important;
    white-space: nowrap;
}

.dash-grid td {
    padding: 12px 16px !important;
    border-bottom: 1px solid var(--border-s) !important;
    color: var(--text-body) !important;
    font-weight: 500;
    vertical-align: middle;
}

.dash-grid tr:last-child td { border-bottom: none !important; }
.dash-grid tr:hover td { background: var(--sky-50) !important; }

/* Empty state */
.empty-state {
    text-align: center;
    padding: 52px 20px;
    color: var(--text-muted);
}

.empty-state .ei { font-size: 40px; margin-bottom: 14px; }
.empty-state p { font-size: .9rem; font-weight: 500; }

@media (max-width: 580px) {
    .welcome-banner { padding: 24px 20px; }
    .quick-stats { grid-template-columns: repeat(2, 1fr); }
}
</style>

<div class="dash-wrap">

    <!-- Welcome Banner -->
    <div class="welcome-banner">
        <div class="welcome-avatar">🌸</div>
        <div class="welcome-text">
            <h2>Welcome back, <span class="uname"><asp:Label ID="lblUser" runat="server" /></span>! 💙</h2>
            <p>Here's a quick overview of all student records in the system.</p>
        </div>
    </div>

    <!-- Quick Stats -->
    <div class="quick-stats">
        <div class="qs-card">
            <div class="qs-icon">🏛️</div>
            <div class="qs-val">—</div>
            <div class="qs-lbl">Colleges</div>
        </div>
        <div class="qs-card">
            <div class="qs-icon">📚</div>
            <div class="qs-val">—</div>
            <div class="qs-lbl">Programs</div>
        </div>
        <div class="qs-card">
            <div class="qs-icon">👩‍🎓</div>
            <div class="qs-val">—</div>
            <div class="qs-lbl">Students</div>
        </div>
    </div>

    <!-- Student Records Table -->
    <div class="table-card">
        <div class="table-card-header">
            <div>
                <div class="table-card-title">👩‍🎓 Student Records Overview</div>
                <div class="table-card-sub">All enrolled students with their program details</div>
            </div>
        </div>
        <div class="table-scroll">
            <asp:GridView ID="GridView1" runat="server"
                AutoGenerateColumns="False"
                DataSourceID="SqlDataSource1"
                CssClass="dash-grid"
                GridLines="None"
                Width="100%">
                <EmptyDataTemplate>
                    <div class="empty-state">
                        <div class="ei">👩‍🎓</div>
                        <p>No student records found yet.</p>
                    </div>
                </EmptyDataTemplate>
                <Columns>
                    <asp:BoundField DataField="ID"         HeaderText="ID"           ReadOnly="True" />
                    <asp:BoundField DataField="studIndex"  HeaderText="Student No."  />
                    <asp:BoundField DataField="UN"         HeaderText="Username"     />
                    <asp:BoundField DataField="Firstname"  HeaderText="First Name"   />
                    <asp:BoundField DataField="Lastname"   HeaderText="Last Name"    />
                    <asp:BoundField DataField="code"       HeaderText="Program Code" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

</div>

<!-- SQL Data Source (logic unchanged) -->
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

</asp:Content>
