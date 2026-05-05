<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/MySite.Master"
    AutoEventWireup="true" CodeBehind="Home.aspx.cs"
    Inherits="SantiagoSoftDev225262V4.Home" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="BreadContent" ContentPlaceHolderID="PageBreadcrumb" runat="server">
    System Overview
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
/* ═══════════════════════════════════════
   DASHBOARD / HOME PAGE
   ═══════════════════════════════════════ */
.dash-wrap {
    width: 100%;
    animation: fadeUp .45s cubic-bezier(.22,1,.36,1) both;
}

@keyframes fadeUp {
    from { opacity:0; transform:translateY(16px); }
    to   { opacity:1; transform:translateY(0); }
}

/* Welcome banner */
.welcome-banner {
    background: linear-gradient(135deg, #e0f2fe 0%, #bae6fd 30%, #f0f9ff 70%, #fce7f3 100%);
    border: 2px solid var(--border);
    border-radius: 22px;
    padding: 32px 36px;
    margin-bottom: 28px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 20px;
    box-shadow: var(--shadow);
    position: relative;
    overflow: hidden;
}

.welcome-banner::before {
    content: '';
    position: absolute;
    top: -30px; right: -30px;
    width: 120px; height: 120px;
    border-radius: 50%;
    background: rgba(255,255,255,0.35);
    pointer-events: none;
}

.welcome-banner::after {
    content: '';
    position: absolute;
    bottom: -20px; right: 80px;
    width: 70px; height: 70px;
    border-radius: 50%;
    background: rgba(255,255,255,0.2);
    pointer-events: none;
}

.welcome-text h1 {
    font-family: 'Quicksand', sans-serif;
    font-size: clamp(1.3rem, 3vw, 1.8rem);
    font-weight: 800;
    color: var(--text-dark);
    margin-bottom: 6px;
}

.welcome-text h1 .acc {
    color: var(--sky-600);
}

.welcome-text p {
    font-size: .88rem;
    color: var(--text-mid);
    font-weight: 500;
    max-width: 420px;
}

.welcome-actions {
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
    position: relative;
    z-index: 1;
}

.wbtn {
    display: inline-flex;
    align-items: center;
    gap: 7px;
    padding: 11px 22px;
    border-radius: 12px;
    font-family: 'Nunito', sans-serif;
    font-size: .85rem;
    font-weight: 700;
    text-decoration: none;
    transition: transform .2s, box-shadow .2s;
    white-space: nowrap;
}

.wbtn:hover { transform: translateY(-2px); text-decoration: none; }

.wbtn-primary {
    background: linear-gradient(135deg, var(--sky-400), var(--sky-600));
    color: white;
    box-shadow: 0 4px 14px rgba(56,189,248,0.35);
}

.wbtn-ghost {
    background: white;
    color: var(--sky-700);
    border: 2px solid var(--border);
}

/* Stats row */
.stats-row {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 16px;
    margin-bottom: 28px;
}

.stat-card {
    background: white;
    border: 2px solid var(--border-s);
    border-radius: 18px;
    padding: 24px 20px;
    display: flex;
    align-items: center;
    gap: 16px;
    box-shadow: var(--shadow);
    transition: transform .22s, box-shadow .22s, border-color .22s;
}

.stat-card:hover {
    transform: translateY(-3px);
    box-shadow: var(--shadow-md);
    border-color: var(--border);
}

.stat-icon {
    width: 52px; height: 52px;
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    flex-shrink: 0;
}

.stat-icon.sky  { background: var(--sky-100); border: 2px solid var(--border); }
.stat-icon.rose { background: var(--blush);  border: 2px solid var(--blush-d); }
.stat-icon.mint { background: var(--mint);   border: 2px solid #a7f3d0; }

.stat-info { display: flex; flex-direction: column; }

.stat-val {
    font-family: 'Quicksand', sans-serif;
    font-size: 1.9rem;
    font-weight: 800;
    color: var(--text-dark);
    line-height: 1;
    margin-bottom: 4px;
}

.stat-lbl {
    font-size: .72rem;
    font-weight: 700;
    color: var(--text-muted);
    text-transform: uppercase;
    letter-spacing: .6px;
    font-family: 'Quicksand', sans-serif;
}

/* Section divider */
.sec-div {
    display: flex;
    align-items: center;
    gap: 12px;
    color: var(--text-muted);
    font-size: .7rem;
    font-weight: 700;
    letter-spacing: .8px;
    text-transform: uppercase;
    margin: 0 0 18px;
    font-family: 'Quicksand', sans-serif;
}

.sec-div::before, .sec-div::after {
    content: '';
    flex: 1;
    height: 1.5px;
    background: var(--border-s);
}

/* Two-column layout */
.dash-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
    margin-bottom: 28px;
}

/* Card component */
.dash-card {
    background: white;
    border: 2px solid var(--border-s);
    border-radius: 20px;
    overflow: hidden;
    box-shadow: var(--shadow);
    animation: fadeUp .5s .08s cubic-bezier(.22,1,.36,1) both;
}

.dash-card-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 18px 22px;
    border-bottom: 2px solid var(--border-s);
    flex-wrap: wrap;
    gap: 8px;
}

.dash-card-header h3 {
    font-family: 'Quicksand', sans-serif;
    font-size: .95rem;
    font-weight: 700;
    color: var(--text-dark);
    display: flex;
    align-items: center;
    gap: 8px;
}

.dash-card-header a {
    font-size: .78rem;
    font-weight: 700;
    color: var(--sky-600);
    text-decoration: none;
    font-family: 'Quicksand', sans-serif;
    transition: color .2s;
}

.dash-card-header a:hover { color: var(--sky-700); }

.dash-card-body {
    padding: 0;
}

.dash-card-body.pad {
    padding: 22px;
}

/* Recent students mini table */
.recent-table {
    width: 100%;
    border-collapse: collapse;
    font-size: .83rem;
}

.recent-table th {
    background: var(--sky-50);
    color: var(--text-muted);
    padding: 11px 18px;
    text-align: left;
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    font-size: .7rem;
    letter-spacing: .5px;
    text-transform: uppercase;
    border-bottom: 1.5px solid var(--border-s);
}

.recent-table td {
    padding: 12px 18px;
    border-bottom: 1px solid var(--border-s);
    color: var(--text-body);
    font-weight: 500;
}

.recent-table tr:last-child td { border-bottom: none; }
.recent-table tr:hover td { background: var(--sky-50); }

.student-name {
    font-weight: 700;
    color: var(--text-dark);
}

.program-tag {
    display: inline-flex;
    padding: 3px 10px;
    background: var(--sky-100);
    border: 1px solid var(--border);
    border-radius: 6px;
    font-size: .75rem;
    font-weight: 700;
    color: var(--sky-700);
}

.year-dot {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 24px; height: 24px;
    background: var(--mint);
    border: 1px solid #a7f3d0;
    border-radius: 6px;
    font-size: .74rem;
    font-weight: 800;
    color: #065f46;
}

/* Empty state */
.empty-mini {
    text-align: center;
    padding: 36px 20px;
    color: var(--text-muted);
}

.empty-mini .ei { font-size: 32px; margin-bottom: 8px; }
.empty-mini p { font-size: .84rem; font-weight: 500; }

/* Quick action cards */
.quick-grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 12px;
    padding: 18px 22px;
}

.qaction {
    display: flex;
    align-items: center;
    gap: 14px;
    padding: 14px 16px;
    border-radius: 14px;
    background: var(--sky-50);
    border: 1.5px solid var(--border-s);
    text-decoration: none;
    transition: transform .2s, box-shadow .2s, border-color .2s, background .2s;
}

.qaction:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow);
    border-color: var(--border);
    background: white;
    text-decoration: none;
}

.qaction-icon {
    width: 42px; height: 42px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
    flex-shrink: 0;
}

.qaction-icon.sky  { background: var(--sky-100); border: 2px solid var(--border); }
.qaction-icon.rose { background: var(--blush);  border: 2px solid var(--blush-d); }
.qaction-icon.mint { background: var(--mint);   border: 2px solid #a7f3d0; }
.qaction-icon.violet { background: var(--lavender); border: 2px solid #c4b5fd; }

.qaction-text h4 {
    font-family: 'Quicksand', sans-serif;
    font-size: .88rem;
    font-weight: 700;
    color: var(--text-dark);
    margin-bottom: 2px;
}

.qaction-text p {
    font-size: .74rem;
    color: var(--text-muted);
    font-weight: 500;
}

.qaction-arrow {
    margin-left: auto;
    font-size: 16px;
    color: var(--text-muted);
    transition: transform .2s, color .2s;
}

.qaction:hover .qaction-arrow {
    transform: translateX(3px);
    color: var(--sky-500);
}

/* Feature row */
.feat-row {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 16px;
    margin-bottom: 28px;
}

.feat-card {
    background: white;
    border: 2px solid var(--border-s);
    border-radius: 18px;
    padding: 24px 20px;
    box-shadow: var(--shadow);
    transition: transform .22s, box-shadow .22s, border-color .22s;
    position: relative;
    overflow: hidden;
}

.feat-card::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 4px;
    border-radius: 18px 18px 0 0;
}

.feat-card.sky::before  { background: linear-gradient(90deg, var(--sky-300), var(--sky-500)); }
.feat-card.rose::before { background: linear-gradient(90deg, #fb7185, #fbbf24); }
.feat-card.mint::before { background: linear-gradient(90deg, #34d399, #0ea5e9); }

.feat-card:hover {
    transform: translateY(-4px);
    box-shadow: var(--shadow-md);
    border-color: var(--border);
}

.feat-icon {
    width: 44px; height: 44px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 19px;
    margin-bottom: 14px;
    border: 2px solid var(--border-s);
}

.feat-icon.sky  { background: var(--sky-100); }
.feat-icon.rose { background: var(--blush); }
.feat-icon.mint { background: var(--mint); }

.feat-card h4 {
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    font-size: .92rem;
    color: var(--text-dark);
    margin-bottom: 6px;
}

.feat-card p {
    font-size: .8rem;
    color: var(--text-muted);
    line-height: 1.6;
    font-weight: 500;
    margin-bottom: 14px;
}

.feat-link {
    font-size: .78rem;
    font-weight: 700;
    color: var(--sky-600);
    text-decoration: none;
    font-family: 'Quicksand', sans-serif;
    display: inline-flex;
    align-items: center;
    gap: 4px;
    transition: gap .18s;
}

.feat-link:hover { gap: 8px; color: var(--sky-700); text-decoration: none; }

/* Footer info */
.dash-footer {
    text-align: center;
    padding: 20px 0 8px;
    border-top: 1.5px solid var(--border-s);
    margin-top: 8px;
}

.dash-footer p {
    font-size: .74rem;
    color: var(--text-muted);
    font-weight: 500;
}

/* ═══════════════════════════════════════
   RESPONSIVE
   ═══════════════════════════════════════ */
@media (max-width: 900px) {
    .dash-grid { grid-template-columns: 1fr; }
    .feat-row { grid-template-columns: 1fr; }
}

@media (max-width: 768px) {
    .stats-row { grid-template-columns: 1fr; }
    .welcome-banner { padding: 24px 20px; }
    .welcome-text h1 { font-size: 1.2rem; }
    .welcome-actions { width: 100%; }
    .wbtn { flex: 1; justify-content: center; }
    .stat-card { padding: 18px 16px; }
    .stat-val { font-size: 1.5rem; }
}
</style>

<div class="dash-wrap">

    <!-- ═══════════════ WELCOME BANNER ═══════════════ -->
    <div class="welcome-banner">
        <div class="welcome-text">
            <h1>Hello, <span class="acc"><asp:Literal ID="litWelcomeUser" runat="server" /></span>!</h1>
            <p>Welcome back to the Student Management System. Manage colleges, programs, and student records all in one place.</p>
        </div>
        <div class="welcome-actions">
            <a href="StudentInfoCrud.aspx" class="wbtn wbtn-primary"> Manage Students →</a>
            <a href="CollegeCrud.aspx" class="wbtn wbtn-ghost"> View Colleges</a>
        </div>
    </div>

    <!-- ═══════════════ STATS ROW ═══════════════ -->
    <div class="stats-row">
        <div class="stat-card">
            <div class="stat-icon sky"></div>
            <div class="stat-info">
                <div class="stat-val"><asp:Literal ID="litCollegeCount" runat="server">0</asp:Literal></div>
                <div class="stat-lbl">Colleges</div>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-icon rose"></div>
            <div class="stat-info">
                <div class="stat-val"><asp:Literal ID="litProgramCount" runat="server">0</asp:Literal></div>
                <div class="stat-lbl">Programs</div>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-icon mint"></div>
            <div class="stat-info">
                <div class="stat-val"><asp:Literal ID="litStudentCount" runat="server">0</asp:Literal></div>
                <div class="stat-lbl">Students</div>
            </div>
        </div>
    </div>

    <!-- ═══════════════ TWO-COLUMN SECTION ═══════════════ -->
    <div class="sec-div">Overview</div>
    <div class="dash-grid">

        <!-- Recent Students -->
        <div class="dash-card">
            <div class="dash-card-header">
                <h3> Recent Students</h3>
                <a href="StudentInfoCrud.aspx">View All →</a>
            </div>
            <div class="dash-card-body">
                <asp:Repeater ID="rptRecentStudents" runat="server">
                    <HeaderTemplate>
                        <table class="recent-table">
                            <thead>
                                <tr>
                                    <th>Student ID</th>
                                    <th>Name</th>
                                    <th>Program</th>
                                    <th>Yr</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("studentID") %></td>
                            <td><span class="student-name"><%# Eval("Firstname") %> <%# Eval("Lastname") %></span></td>
                            <td><span class="program-tag"><%# Eval("ProgramCode") %></span></td>
                            <td><span class="year-dot"><%# Eval("yearLevel") %></span></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                            </tbody>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <asp:PlaceHolder ID="phEmptyRecent" runat="server" Visible="false">
                    <div class="empty-mini">
                        <div class="ei"></div>
                        <p>No students yet. Add your first record!</p>
                    </div>
                </asp:PlaceHolder>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="dash-card">
            <div class="dash-card-header">
                <h3> Quick Actions</h3>
            </div>
            <div class="quick-grid">
                <a href="CollegeCrud.aspx" class="qaction">
                    <div class="qaction-icon sky"></div>
                    <div class="qaction-text">
                        <h4>Manage Colleges</h4>
                        <p>Add, edit, or remove college records</p>
                    </div>
                    <span class="qaction-arrow">→</span>
                </a>
                <a href="ProgramCrud.aspx" class="qaction">
                    <div class="qaction-icon rose"></div>
                    <div class="qaction-text">
                        <h4>Manage Programs</h4>
                        <p>Organize programs under colleges</p>
                    </div>
                    <span class="qaction-arrow">→</span>
                </a>
                <a href="StudentInfoCrud.aspx" class="qaction">
                    <div class="qaction-icon mint"></div>
                    <div class="qaction-text">
                        <h4>Student Records</h4>
                        <p>Full CRUD for student information</p>
                    </div>
                    <span class="qaction-arrow">→</span>
                </a>
                <a href="Dashboard.aspx" class="qaction">
                    <div class="qaction-icon violet"></div>
                    <div class="qaction-text">
                        <h4>Dashboard</h4>
                        <p>View detailed system analytics</p>
                    </div>
                    <span class="qaction-arrow">→</span>
                </a>
            </div>
        </div>
    </div>

    <!-- ═══════════════ FEATURE CARDS ═══════════════ -->
    <div class="sec-div">System Modules</div>
    <div class="feat-row">
        <div class="feat-card sky">
            <div class="feat-icon sky"></div>
            <h4>College Management</h4>
            <p>Add, update, and organize colleges. Keep your institutional structure clean and accurate.</p>
            <a href="CollegeCrud.aspx" class="feat-link">Go to Colleges →</a>
        </div>
        <div class="feat-card rose">
            <div class="feat-icon rose"></div>
            <h4>Program Management</h4>
            <p>Manage academic programs linked to their respective colleges with full CRUD support.</p>
            <a href="ProgramCrud.aspx" class="feat-link">Go to Programs →</a>
        </div>
        <div class="feat-card mint">
            <div class="feat-icon mint"></div>
            <h4>Student Records</h4>
            <p>Maintain complete student profiles: ID, name, birthday, sex, program, and year level.</p>
            <a href="StudentInfoCrud.aspx" class="feat-link">Go to Students →</a>
        </div>
    </div>

    <!-- ═══════════════ FOOTER ═══════════════ -->
    <div class="dash-footer">
        <p>SoftDev Student Management System v4 — Built with ASP.NET Web Forms & Access</p>
    </div>

</div>

</asp:Content>
