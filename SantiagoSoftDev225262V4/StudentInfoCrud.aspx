<%@ Page Title="Students" Language="C#" MasterPageFile="~/MySite.Master"
    AutoEventWireup="true" CodeBehind="StudentInfoCrud.aspx.cs"
    Inherits="SantiagoSoftDev225262V4.StudentInfoCrud" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="PageTitle" runat="server">
    Student Management
</asp:Content>

<asp:Content ID="BreadContent" ContentPlaceHolderID="PageBreadcrumb" runat="server">
    Management › Students
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
:root {
    --navy:        #0b1120;
    --navy-mid:    #131d31;
    --navy-card:   rgba(19,29,49,0.80);
    --blue:        #3b82f6;
    --blue-light:  #60a5fa;
    --teal:        #14b8a6;
    --red:         #f87171;
    --green:       #34d399;
    --amber:       #f59e0b;
    --text:        #e2e8f0;
    --text-muted:  #94a3b8;
    --border:      rgba(148,163,184,0.12);
    --border-focus:rgba(59,130,246,0.6);
    --transition:  .22s cubic-bezier(.4,0,.2,1);
}
@keyframes fadeUp {
    from { opacity:0; transform:translateY(18px); }
    to   { opacity:1; transform:translateY(0); }
}
.page-header { display:flex; align-items:center; justify-content:space-between; margin-bottom:28px; flex-wrap:wrap; gap:14px; animation:fadeUp .4s cubic-bezier(.22,1,.36,1) both; }
.page-header-text h2 { font-family:'Playfair Display',serif; font-size:1.5rem; font-weight:700; color:var(--text); margin-bottom:3px; }
.page-header-text p  { font-size:.8rem; color:var(--text-muted); }
.crud-card { background:var(--navy-card); border:1px solid var(--border); border-radius:18px; backdrop-filter:blur(20px); overflow:hidden; animation:fadeUp .45s .05s cubic-bezier(.22,1,.36,1) both; }
.btn-add { display:inline-flex; align-items:center; gap:7px; padding:9px 18px; background:linear-gradient(135deg,#3b82f6 0%,#2563eb 100%); color:#fff; border:none; border-radius:9px; font-family:'DM Sans',sans-serif; font-size:.855rem; font-weight:600; cursor:pointer; box-shadow:0 3px 14px rgba(59,130,246,0.35); transition:transform var(--transition),box-shadow var(--transition),opacity var(--transition); text-decoration:none; }
.btn-add:hover { transform:translateY(-1px); box-shadow:0 5px 20px rgba(59,130,246,0.5); }
.btn-save   { background:linear-gradient(135deg,#059669 0%,#047857 100%); color:#fff; box-shadow:0 3px 14px rgba(5,150,105,0.32); }
.btn-update { background:linear-gradient(135deg,#f59e0b 0%,#d97706 100%); color:#fff; box-shadow:0 3px 14px rgba(245,158,11,0.32); }
.btn-cancel { background:rgba(255,255,255,0.06); color:var(--text-muted); border:1px solid var(--border); }
.btn-action { display:inline-flex; align-items:center; gap:6px; padding:8px 16px; border-radius:8px; font-family:'DM Sans',sans-serif; font-size:.845rem; font-weight:600; cursor:pointer; border:none; transition:transform var(--transition),opacity var(--transition); text-decoration:none; }
.btn-action:hover { transform:translateY(-1px); opacity:.9; }
.grid-wrap { overflow-x:auto; }
.grid-wrap table { width:100%; border-collapse:collapse; font-size:.875rem; }
.grid-wrap th { background:rgba(255,255,255,0.04); color:var(--text-muted); font-size:.72rem; font-weight:700; letter-spacing:.8px; text-transform:uppercase; padding:13px 18px; text-align:left; border-bottom:1px solid var(--border); white-space:nowrap; }
.grid-wrap td { padding:13px 18px; color:var(--text); border-bottom:1px solid rgba(148,163,184,0.06); vertical-align:middle; }
.grid-wrap tr:last-child td { border-bottom:none; }
.grid-wrap tr:hover td { background:rgba(59,130,246,0.04); }
.row-num { display:inline-flex; align-items:center; justify-content:center; width:26px; height:26px; background:rgba(59,130,246,0.12); color:var(--blue-light); border-radius:6px; font-size:.78rem; font-weight:700; }
.grid-edit   { padding:5px 13px; border-radius:7px; background:rgba(59,130,246,0.15); border:1px solid rgba(59,130,246,0.22); color:var(--blue-light); font-size:.8rem; font-weight:600; cursor:pointer; font-family:'DM Sans',sans-serif; transition:background var(--transition); text-decoration:none; }
.grid-edit:hover { background:rgba(59,130,246,0.25); }
.grid-delete { padding:5px 13px; border-radius:7px; background:rgba(248,113,113,0.12); border:1px solid rgba(248,113,113,0.2); color:var(--red); font-size:.8rem; font-weight:600; cursor:pointer; font-family:'DM Sans',sans-serif; transition:background var(--transition); text-decoration:none; }
.grid-delete:hover { background:rgba(248,113,113,0.22); }
.form-panel { padding:28px 26px; animation:fadeUp .35s cubic-bezier(.22,1,.36,1) both; }
.form-title { font-family:'Playfair Display',serif; font-size:1.15rem; font-weight:700; color:var(--text); margin-bottom:22px; padding-bottom:14px; border-bottom:1px solid var(--border); }
/* 3-column form grid for student (more fields) */
.form-grid { display:grid; grid-template-columns:repeat(auto-fit,minmax(200px,1fr)); gap:16px; margin-bottom:26px; }
.fg label { display:block; font-size:.72rem; font-weight:700; color:var(--text-muted); letter-spacing:.7px; text-transform:uppercase; margin-bottom:7px; }
.input { width:100%; padding:12px 15px; background:rgba(255,255,255,0.045); border:1px solid var(--border); border-radius:9px; color:var(--text); font-family:'DM Sans',sans-serif; font-size:.92rem; outline:none; transition:border-color var(--transition),box-shadow var(--transition),background var(--transition); caret-color:var(--blue-light); }
.input::placeholder { color:rgba(148,163,184,0.35); }
.input:focus { border-color:var(--border-focus); background:rgba(255,255,255,0.07); box-shadow:0 0 0 3px rgba(59,130,246,0.13),0 1px 5px rgba(0,0,0,0.2); }
/* Date input color fix */
input[type=date].input::-webkit-calendar-picker-indicator { filter: invert(0.6); }
.form-actions { display:flex; gap:10px; flex-wrap:wrap; }
.msg-bar { display:flex; align-items:center; gap:10px; padding:12px 18px; border-radius:10px; font-size:.875rem; font-weight:500; margin-bottom:18px; animation:fadeUp .3s cubic-bezier(.22,1,.36,1) both; }
.msg-success { background:rgba(52,211,153,0.1); border:1px solid rgba(52,211,153,0.22); color:var(--green); }
.msg-error   { background:rgba(248,113,113,0.1); border:1px solid rgba(248,113,113,0.22); color:var(--red); }
.empty-state { text-align:center; padding:56px 20px; color:var(--text-muted); }
.empty-state .empty-icon { font-size:40px; margin-bottom:14px; }
select.input, input[type=date].input { appearance:none; }
select.input { background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' fill='none'%3E%3Cpath d='M1 1l5 5 5-5' stroke='%2394a3b8' stroke-width='1.5' stroke-linecap='round'/%3E%3C/svg%3E"); background-repeat:no-repeat; background-position:right 14px center; padding-right:36px; }
/* Sex badge */
.sex-badge { display:inline-flex; align-items:center; gap:4px; padding:3px 10px; border-radius:999px; font-size:.75rem; font-weight:600; }
.sex-m { background:rgba(59,130,246,0.12); color:var(--blue-light); }
.sex-f { background:rgba(20,184,166,0.12); color:#2dd4bf; }
/* Year level chip */
.year-chip { display:inline-flex; align-items:center; justify-content:center; width:28px; height:28px; border-radius:8px; background:rgba(245,158,11,0.12); color:var(--amber); font-size:.82rem; font-weight:700; }
</style>

<!-- Message -->
<asp:Label ID="lblMessage" runat="server" CssClass="msg-bar msg-success" Visible="false" />

<!-- Page Header -->
<div class="page-header">
    <div class="page-header-text">
        <h2>👤 Student Management</h2>
        <p>Full student records with program enrollment</p>
    </div>
    <asp:LinkButton ID="lbtnAddNewRecord" runat="server"
        CssClass="btn-add btn-action"
        OnClick="lbtnAddNewRecord_Click">
        ＋ Add New Student
    </asp:LinkButton>
</div>

<div class="crud-card">

    <!-- FORM -->
    <asp:Panel ID="PanelStudent" runat="server" Visible="false">
        <div class="form-panel">
            <div class="form-title">Student Information</div>

            <asp:HiddenField ID="hfStudentID" runat="server" />

            <div class="form-grid">
                <div class="fg">
                    <label>Student ID Number</label>
                    <asp:TextBox ID="txtStudentID" runat="server" CssClass="input"
                        placeholder="e.g. 23-0466-891" />
                </div>
                <div class="fg">
                    <label>First Name</label>
                    <asp:TextBox ID="txtFirstname" runat="server" CssClass="input"
                        placeholder="First name" />
                </div>
                <div class="fg">
                    <label>Middle Name</label>
                    <asp:TextBox ID="txtMiddlename" runat="server" CssClass="input"
                        placeholder="Middle name" />
                </div>
                <div class="fg">
                    <label>Last Name</label>
                    <asp:TextBox ID="txtLastname" runat="server" CssClass="input"
                        placeholder="Last name" />
                </div>
                <div class="fg">
                    <label>Birthday</label>
                    <asp:TextBox ID="txtBday" runat="server" CssClass="input"
                        TextMode="Date" />
                </div>
                <div class="fg">
                    <label>Sex</label>
                    <asp:DropDownList ID="ddlSex" runat="server" CssClass="input">
                        <asp:ListItem Text="Male"   Value="Male" />
                        <asp:ListItem Text="Female" Value="Female" />
                    </asp:DropDownList>
                </div>
                <div class="fg">
                    <label>Program</label>
                    <asp:DropDownList ID="ddlProgram" runat="server"
                        CssClass="input"
                        DataSourceID="SqlDataSourceProgram"
                        DataTextField="code"
                        DataValueField="programID">
                    </asp:DropDownList>
                </div>
                <div class="fg">
                    <label>Year Level</label>
                    <asp:TextBox ID="txtYearLevel" runat="server" CssClass="input"
                        placeholder="1 – 4" MaxLength="1" />
                </div>
            </div>

            <div class="form-actions">
                <asp:Button ID="btnSaveStudent" runat="server" Text="💾 Save Student"
                    CssClass="btn-action btn-save" OnClick="btnSaveStudent_Click" />
                <asp:Button ID="btnUpdateStudent" runat="server" Text="✏️ Update Student"
                    CssClass="btn-action btn-update" OnClick="btnUpdateStudent_Click" Visible="false" />
                <asp:Button ID="btnCancelStudent" runat="server" Text="✕ Cancel"
                    CssClass="btn-action btn-cancel" OnClick="btnCancelStudent_Click" />
            </div>
        </div>
    </asp:Panel>

    <!-- GRID -->
    <div class="grid-wrap">
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="ID"
            DataSourceID="SqlDataSource1"
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
            OnRowDeleted="GridView1_RowDeleted"
            GridLines="None"
            Width="100%">
            <EmptyDataTemplate>
                <div class="empty-state">
                    <div class="empty-icon">👤</div>
                    <p>No students found. Add your first student!</p>
                </div>
            </EmptyDataTemplate>
            <Columns>
                <asp:TemplateField HeaderText="#">
                    <ItemTemplate>
                        <span class="row-num"><%# Container.DataItemIndex + 1 %></span>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ID"         Visible="false" />
                <asp:BoundField DataField="studentID"  HeaderText="Student ID" />
                <asp:BoundField DataField="Firstname"  HeaderText="First Name" />
                <asp:BoundField DataField="Middlename" HeaderText="Middle" />
                <asp:BoundField DataField="Lastname"   HeaderText="Last Name" />
                <asp:BoundField DataField="Bday"       HeaderText="Birthday" />
                <asp:TemplateField HeaderText="Sex">
                    <ItemTemplate>
                        <span class='sex-badge <%# Eval("Sex").ToString().StartsWith("M") ? "sex-m" : "sex-f" %>'>
                            <%# Eval("Sex") %>
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ProgramCode" HeaderText="Program" />
                <asp:TemplateField HeaderText="Yr">
                    <ItemTemplate>
                        <span class="year-chip"><%# Eval("yearLevel") %></span>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnEdit" runat="server"
                            CommandName="Select" CssClass="grid-edit">
                            ✏️ Edit
                        </asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="lbtnDelete" runat="server"
                            CommandName="Delete" CssClass="grid-delete"
                            OnClientClick="return confirm('Delete this student record? This action cannot be undone.');">
                            🗑 Delete
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</div>

<!-- Data Sources (unchanged logic) -->
<asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>"
    ProviderName="System.Data.OleDb"
    SelectCommand="SELECT s.ID, s.studentID, s.Firstname, s.Middlename, s.Lastname,
                          s.Bday, s.Sex, p.code AS ProgramCode, s.yearLevel
                   FROM tbl_StudentInfo s
                   LEFT JOIN tbl_Program p ON s.programID = p.programID
                   WHERE s.deleted = 0"
    InsertCommand="INSERT INTO tbl_StudentInfo (studentID,Firstname,Middlename,Lastname,Bday,Sex,programID,yearLevel,deleted)
                   VALUES (?,?,?,?,?,?,?,?,0)"
    UpdateCommand="UPDATE tbl_StudentInfo SET studentID=?,Firstname=?,Middlename=?,Lastname=?,Bday=?,Sex=?,programID=?,yearLevel=? WHERE ID=?"
    DeleteCommand="UPDATE tbl_StudentInfo SET deleted=1 WHERE ID=?">

    <InsertParameters>
        <asp:ControlParameter ControlID="txtStudentID"  PropertyName="Text" />
        <asp:ControlParameter ControlID="txtFirstname"  PropertyName="Text" />
        <asp:ControlParameter ControlID="txtMiddlename" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtLastname"   PropertyName="Text" />
        <asp:ControlParameter ControlID="txtBday"       PropertyName="Text" />
        <asp:ControlParameter ControlID="ddlSex"        PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="ddlProgram"    PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="txtYearLevel"  PropertyName="Text" />
    </InsertParameters>

    <UpdateParameters>
        <asp:ControlParameter ControlID="txtStudentID"  PropertyName="Text" />
        <asp:ControlParameter ControlID="txtFirstname"  PropertyName="Text" />
        <asp:ControlParameter ControlID="txtMiddlename" PropertyName="Text" />
        <asp:ControlParameter ControlID="txtLastname"   PropertyName="Text" />
        <asp:ControlParameter ControlID="txtBday"       PropertyName="Text" />
        <asp:ControlParameter ControlID="ddlSex"        PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="ddlProgram"    PropertyName="SelectedValue" />
        <asp:ControlParameter ControlID="txtYearLevel"  PropertyName="Text" />
        <asp:ControlParameter ControlID="hfStudentID"   PropertyName="Value" />
    </UpdateParameters>

</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSourceProgram" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>"
    ProviderName="System.Data.OleDb"
    SelectCommand="SELECT programID, code FROM tbl_Program WHERE deleted = 0" />

</asp:Content>
