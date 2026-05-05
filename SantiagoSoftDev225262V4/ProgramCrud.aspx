<%@ Page Title="Program Management | SoftDev MS" Language="C#" MasterPageFile="~/MySite.Master"
    AutoEventWireup="true" CodeBehind="ProgramCrud.aspx.cs" Inherits="SantiagoSoftDev225262V4.ProgramCrud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
/* ═══════════════════════════════════════
   PROGRAM CRUD PAGE
   ═══════════════════════════════════════ */
.crud-wrap { width: 100%; }

@keyframes fadeUp {
    from { opacity:0; transform:translateY(16px); }
    to   { opacity:1; transform:translateY(0); }
}

/* Page header row */
.page-hdr {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 24px;
    flex-wrap: wrap;
    gap: 12px;
    animation: fadeUp .38s cubic-bezier(.22,1,.36,1) both;
}

.page-hdr-left { display: flex; align-items: center; gap: 14px; }

.page-hdr-icon {
    width: 48px; height: 48px;
    background: var(--sky-100);
    border: 2px solid var(--border);
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    flex-shrink: 0;
}

.page-hdr h2 {
    font-family: 'Quicksand', sans-serif;
    font-size: 1.35rem;
    font-weight: 700;
    color: var(--text-dark);
    margin-bottom: 3px;
}

.page-hdr p {
    font-size: .795rem;
    color: var(--text-muted);
    font-weight: 500;
}

/* Quick summary */
.stat-mini {
    background: white;
    border: 1.5px solid var(--border-s);
    border-radius: 14px;
    padding: 14px 20px;
    min-width: 150px;
    box-shadow: var(--shadow);
}

.stat-mini-val {
    font-family: 'Quicksand', sans-serif;
    font-size: 1.5rem;
    font-weight: 800;
    color: var(--text-dark);
    line-height: 1;
    margin-bottom: 4px;
}

.stat-mini-lbl {
    font-size: .68rem;
    font-weight: 700;
    color: var(--text-muted);
    text-transform: uppercase;
    letter-spacing: .5px;
    font-family: 'Quicksand', sans-serif;
}

/* Message bar */
.msg-bar {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 13px 18px;
    border-radius: 12px;
    font-size: .875rem;
    font-weight: 600;
    margin-bottom: 20px;
    animation: fadeUp .3s cubic-bezier(.22,1,.36,1) both;
    font-family: 'Nunito', sans-serif;
}

.msg-success {
    background: var(--mint);
    border: 2px solid #a7f3d0;
    color: #065f46;
}

.msg-error {
    background: var(--blush);
    border: 2px solid var(--blush-d);
    color: #9f1239;
}

/* Main card */
.crud-card {
    background: white;
    border: 2px solid var(--border-s);
    border-radius: 22px;
    overflow: hidden;
    box-shadow: var(--shadow);
    animation: fadeUp .42s .04s cubic-bezier(.22,1,.36,1) both;
}

/* Form panel */
.form-panel {
    padding: 26px 28px;
    border-bottom: 2px solid var(--border-s);
    background: var(--sky-50);
    animation: fadeUp .35s cubic-bezier(.22,1,.36,1) both;
}

.form-panel-title {
    font-family: 'Quicksand', sans-serif;
    font-size: 1rem;
    font-weight: 700;
    color: var(--text-dark);
    margin-bottom: 20px;
    display: flex;
    align-items: center;
    gap: 8px;
    padding-bottom: 14px;
    border-bottom: 1.5px solid var(--border);
}

.form-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 14px;
    margin-bottom: 20px;
}

.fg { }

.fg label {
    display: block;
    font-size: .73rem;
    font-weight: 700;
    color: var(--text-dark);
    letter-spacing: .5px;
    text-transform: uppercase;
    margin-bottom: 7px;
    font-family: 'Quicksand', sans-serif;
}

.inp {
    width: 100%;
    padding: 12px 15px;
    background: white;
    border: 2px solid var(--border);
    border-radius: 10px;
    color: var(--text-dark);
    font-family: 'Nunito', sans-serif;
    font-size: .915rem;
    font-weight: 500;
    outline: none;
    transition: border-color var(--transition), box-shadow var(--transition);
}

.inp::placeholder { color: var(--text-muted); }

.inp:focus {
    border-color: var(--sky-400);
    box-shadow: 0 0 0 3px rgba(56,189,248,0.16);
}

select.inp {
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' fill='none'%3E%3Cpath d='M1 1l5 5 5-5' stroke='%230ea5e9' stroke-width='1.8' stroke-linecap='round'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 14px center;
    padding-right: 36px;
    cursor: pointer;
}

.form-actions { display: flex; gap: 10px; flex-wrap: wrap; }

/* Action buttons */
.abtn {
    display: inline-flex;
    align-items: center;
    gap: 7px;
    padding: 11px 20px;
    border-radius: 10px;
    font-family: 'Nunito', sans-serif;
    font-size: .875rem;
    font-weight: 700;
    cursor: pointer;
    border: none;
    transition: transform var(--transition), box-shadow var(--transition), opacity var(--transition);
    letter-spacing: .1px;
}

.abtn:hover  { opacity: .9; transform: translateY(-2px); }
.abtn:active { transform: translateY(0); }

.abtn-primary { background: linear-gradient(135deg, var(--sky-400) 0%, var(--sky-600) 100%); color: white; box-shadow: 0 4px 14px rgba(56,189,248,0.35); }
.abtn-success { background: linear-gradient(135deg, #34d399 0%, #10b981 100%); color: white; box-shadow: 0 4px 12px rgba(16,185,129,0.28); }
.abtn-warning { background: linear-gradient(135deg, #fbbf24 0%, #f59e0b 100%); color: white; box-shadow: 0 4px 12px rgba(245,158,11,0.28); }
.abtn-ghost   { background: white; color: var(--text-mid); border: 2px solid var(--border); }
.abtn-ghost:hover { background: var(--sky-50); }

/* Toolbar inside card */
.grid-toolbar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 16px 22px;
    border-bottom: 2px solid var(--border-s);
    flex-wrap: wrap;
    gap: 10px;
}

.grid-toolbar-left {
    display: flex;
    align-items: center;
    gap: 12px;
}

.grid-toolbar-title {
    font-family: 'Quicksand', sans-serif;
    font-size: .935rem;
    font-weight: 700;
    color: var(--text-dark);
}

.count-badge {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 2px 10px;
    background: var(--sky-100);
    border: 1.5px solid var(--border);
    border-radius: 99px;
    font-size: .72rem;
    font-weight: 700;
    color: var(--sky-700);
    font-family: 'Quicksand', sans-serif;
}

/* Search bar */
.grid-search {
    display: flex;
    align-items: center;
    gap: 6px;
    flex: 1;
    max-width: 340px;
    min-width: 200px;
}

.search-inp {
    flex: 1;
    padding: 8px 14px 8px 34px;
    background: var(--sky-50);
    border: 2px solid var(--border-s);
    border-radius: 10px;
    font-family: 'Nunito', sans-serif;
    font-size: .82rem;
    font-weight: 500;
    color: var(--text-dark);
    outline: none;
    transition: border-color var(--transition), box-shadow var(--transition);
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%237fb7d4' viewBox='0 0 16 16'%3E%3Cpath d='M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85zm-5.242.656a5 5 0 1 1 0-10 5 5 0 0 1 0 10z'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: 10px center;
}

.search-inp:focus {
    border-color: var(--sky-400);
    box-shadow: 0 0 0 3px rgba(56,189,248,0.12);
}

.search-btn {
    padding: 8px 14px;
    background: var(--sky-400);
    border: 2px solid var(--sky-500);
    border-radius: 10px;
    color: white;
    font-family: 'Nunito', sans-serif;
    font-size: .82rem;
    font-weight: 700;
    cursor: pointer;
    transition: background var(--transition), transform var(--transition);
    white-space: nowrap;
}

.search-btn:hover {
    background: var(--sky-600);
    transform: translateY(-1px);
}

.clear-btn {
    padding: 8px 10px;
    background: white;
    border: 1.5px solid var(--border);
    border-radius: 10px;
    color: var(--text-muted);
    font-size: .8rem;
    cursor: pointer;
    font-weight: 700;
    font-family: 'Nunito', sans-serif;
    transition: background var(--transition), color var(--transition);
    white-space: nowrap;
}

.clear-btn:hover {
    background: var(--sky-50);
    color: var(--text-dark);
}

/* Grid table */
.grid-scroll {
    overflow-x: auto;
    -webkit-overflow-scrolling: touch;
    width: 100%;
}

.crud-grid {
    width: 100%;
    min-width: 600px;
    border-collapse: collapse;
    font-size: .875rem;
}

.crud-grid th {
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

.crud-grid td {
    padding: 13px 16px !important;
    border-bottom: 1px solid var(--border-s) !important;
    color: var(--text-body) !important;
    font-weight: 500;
    vertical-align: middle;
}

.crud-grid tr:last-child td { border-bottom: none !important; }
.crud-grid tr:hover td { background: var(--sky-50) !important; }

/* Row number chip */
.row-num {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 26px; height: 26px;
    background: var(--sky-100);
    color: var(--sky-700);
    border-radius: 7px;
    font-size: .76rem;
    font-weight: 700;
    font-family: 'Quicksand', sans-serif;
    border: 1.5px solid var(--border);
}

/* Code pill */
.code-pill {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 4px 12px;
    background: var(--sky-100);
    border: 1.5px solid var(--border);
    border-radius: 7px;
    font-size: .78rem;
    font-weight: 700;
    font-family: 'Quicksand', sans-serif;
    color: var(--sky-700);
    letter-spacing: .5px;
}

/* College badge */
.college-badge {
    display: inline-flex;
    align-items: center;
    gap: 5px;
    padding: 4px 10px;
    border-radius: 6px;
    font-size: .78rem;
    font-weight: 700;
    background: var(--sky-100);
    color: var(--sky-700);
    border: 1.5px solid var(--border);
}

/* In-grid action buttons */
.grid-edit {
    display: inline-flex;
    align-items: center;
    gap: 5px;
    padding: 6px 12px;
    border-radius: 8px;
    background: var(--sky-100);
    border: 1.5px solid var(--border);
    color: var(--sky-700);
    font-size: .8rem;
    font-weight: 700;
    cursor: pointer;
    font-family: 'Nunito', sans-serif;
    transition: background var(--transition), transform var(--transition);
    text-decoration: none;
}
.grid-edit:hover { background: var(--sky-200); transform: translateY(-1px); text-decoration: none; }

.grid-delete {
    display: inline-flex;
    align-items: center;
    gap: 5px;
    padding: 6px 12px;
    border-radius: 8px;
    background: var(--blush);
    border: 1.5px solid var(--blush-d);
    color: #be123c;
    font-size: .8rem;
    font-weight: 700;
    cursor: pointer;
    font-family: 'Nunito', sans-serif;
    transition: background var(--transition), transform var(--transition);
    text-decoration: none;
}
.grid-delete:hover { background: #fecdd3; transform: translateY(-1px); text-decoration: none; }

/* Empty state */
.empty-state {
    text-align: center;
    padding: 52px 20px;
    color: var(--text-muted);
}
.empty-state .ei { font-size: 38px; margin-bottom: 12px; }
.empty-state p { font-size: .9rem; font-weight: 500; }

/* ═══════════════════════════════════════
   MOBILE RESPONSIVE
   ═══════════════════════════════════════ */
@media (max-width: 768px) {
    .page-hdr {
        flex-direction: column;
        align-items: flex-start;
    }
    .page-hdr .abtn-primary { width: 100%; justify-content: center; }
    .form-panel { padding: 20px 16px; }
    .form-grid { grid-template-columns: 1fr; gap: 12px; }
    .form-actions { flex-direction: column; }
    .form-actions .abtn { width: 100%; justify-content: center; }
    .grid-toolbar { padding: 12px 14px; flex-direction: column; align-items: stretch; }
    .grid-toolbar-left { flex-wrap: wrap; }
    .grid-search { max-width: 100%; min-width: 0; }
    .search-btn { padding: 8px 10px; }
    .grid-scroll { margin: 0 -2px; }
    .crud-grid { min-width: 550px; font-size: .82rem; }
    .crud-grid th, .crud-grid td { padding: 10px 12px !important; }
}
</style>

<div class="crud-wrap">

    <!-- Message bar -->
    <asp:Panel ID="pnlMsg" runat="server" Visible="false">
        <asp:Label ID="lblMessege" runat="server" CssClass="msg-bar msg-success" />
    </asp:Panel>

    <!-- Page header -->
    <div class="page-hdr">
        <div class="page-hdr-left">
            <div class="page-hdr-icon"></div>
            <div>
                <h2>Program Management</h2>
                <p>Manage academic programs linked to colleges</p>
            </div>
        </div>
        <asp:LinkButton ID="LbtnAddNewRecord" runat="server"
            CssClass="abtn abtn-primary"
            OnClick="LbtnAddNewRecord_Click">
            ＋ Add New Program
        </asp:LinkButton>
    </div>

    <!-- Quick Summary -->
    <div style="display:flex; gap:14px; margin-bottom:20px; flex-wrap:wrap; animation:fadeUp .35s .05s cubic-bezier(.22,1,.36,1) both;">
        <div class="stat-mini">
            <div class="stat-mini-val" id="progTotalCount" runat="server">0</div>
            <div class="stat-mini-lbl">Total Programs</div>
        </div>
        <div class="stat-mini">
            <div class="stat-mini-val" id="progCollegeCount" runat="server">0</div>
            <div class="stat-mini-lbl">Colleges Linked</div>
        </div>
    </div>

    <!-- Main card -->
    <div class="crud-card">

        <!-- Form panel (toggled by code-behind) -->
        <asp:Panel ID="Panel1" runat="server" Visible="false">
            <div class="form-panel">
                <div class="form-panel-title"> Program Details</div>
                <div class="form-grid">
                    <div class="fg">
                        <label>Program Name / Description</label>
                        <asp:TextBox ID="TxtDescription" runat="server" CssClass="inp"
                            placeholder="e.g. Bachelor of Science in Computer Science" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="TxtDescription"
                            ErrorMessage="Program name is required." Display="Dynamic"
                            ValidationGroup="ProgramGroup"
                            style="font-size:.73rem; color:#ef4444; margin-top:4px; display:block;" />
                    </div>
                    <div class="fg">
                        <label>Program Code</label>
                        <asp:TextBox ID="TxtCode" runat="server" CssClass="inp"
                            placeholder="e.g. BSCS" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="TxtCode"
                            ErrorMessage="Code is required." Display="Dynamic"
                            ValidationGroup="ProgramGroup"
                            style="font-size:.73rem; color:#ef4444; margin-top:4px; display:block;" />
                    </div>
                    <div class="fg">
                        <label>College</label>
                        <asp:DropDownList ID="DdlCollege" runat="server" CssClass="inp"
                            DataSourceID="CollegeDataSource"
                            DataTextField="description"
                            DataValueField="collegeID"
                            AppendDataBoundItems="true">
                            <asp:ListItem Text="-- Select College --" Value="0" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-actions">
                    <asp:Button ID="BtnSave" runat="server" Text="Save Program"
                        CssClass="abtn abtn-success"
                        OnClick="BtnSave_Click" ValidationGroup="ProgramGroup" />
                    <asp:Button ID="BtnUpdate" runat="server" Text="Update Program"
                        CssClass="abtn abtn-warning"
                        OnClick="BtnUpdate_Click" CausesValidation="false" Visible="false" />
                    <asp:Button ID="BtnCancel" runat="server" Text="✕ Cancel"
                        CssClass="abtn abtn-ghost"
                        OnClick="BtnCancel_Click" CausesValidation="false" />
                </div>
            </div>
        </asp:Panel>

        <!-- Grid -->
        <asp:Panel ID="pnlGrid" runat="server">
            <div class="grid-toolbar">
                <div class="grid-toolbar-left">
                    <div class="grid-toolbar-title"> Program Records</div>
                    <span class="count-badge" id="programCountBadge" runat="server">0</span>
                </div>
            </div>
            <div class="grid-scroll">
                <asp:GridView ID="GridView1" runat="server"
                    AutoGenerateColumns="False"
                    DataKeyNames="programID,collegeID"
                    DataSourceID="SqlDataSource1"
                    CssClass="crud-grid"
                    OnRowDeleted="GridView1_RowDeleted"
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                    GridLines="None"
                    Width="100%">
                    <EmptyDataTemplate>
                        <div class="empty-state">
                            <div class="ei"></div>
                            <p>No programs found. Add your first one!</p>
                        </div>
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                <span class="row-num"><%# Container.DataItemIndex + 1 %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="description" HeaderText="Program Name" />
                        <asp:TemplateField HeaderText="Code">
                            <ItemTemplate>
                                <span class="code-pill"><%# Eval("code") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="College">
                            <ItemTemplate>
                                <span class="college-badge"><%# Eval("collegedescription") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEdit" runat="server"
                                    CommandName="Select" CssClass="grid-edit">
                                    Edit
                                </asp:LinkButton>
                                &nbsp;
                                <asp:LinkButton ID="lbtnDelete" runat="server"
                                    CommandName="Delete" CssClass="grid-delete"
                                    OnClientClick="return confirm('Delete this program? This cannot be undone.');">
                                    Delete
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </asp:Panel>

    </div>
</div>

<!-- Program DataSource -->
<asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
    SelectCommand="SELECT p.programID, p.description, p.code, p.collegeID, c.description AS collegedescription
                   FROM tbl_Program p
                   INNER JOIN tbl_College c ON p.collegeID = c.collegeID
                   WHERE p.deleted = 0"
    InsertCommand="INSERT INTO tbl_Program(description, code, collegeID, deleted) VALUES (?, ?, ?, 0)"
    UpdateCommand="UPDATE tbl_Program SET description = ?, code = ?, collegeID = ? WHERE programID = ?"
    DeleteCommand="UPDATE tbl_Program SET deleted = 1 WHERE programID = ?"
    OnDeleted="SqlDataSource1_Deleted">
    <InsertParameters>
        <asp:ControlParameter ControlID="TxtDescription" Name="?" PropertyName="Text" />
        <asp:ControlParameter ControlID="TxtCode" Name="?" PropertyName="Text" />
        <asp:ControlParameter ControlID="DdlCollege" Name="?" PropertyName="SelectedValue" />
    </InsertParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="TxtDescription" Name="?" PropertyName="Text" />
        <asp:ControlParameter ControlID="TxtCode" Name="?" PropertyName="Text" />
        <asp:ControlParameter ControlID="DdlCollege" Name="?" PropertyName="SelectedValue" />
        <asp:Parameter Name="programID" />
    </UpdateParameters>
    <DeleteParameters>
        <asp:Parameter Name="programID" />
    </DeleteParameters>
</asp:SqlDataSource>

<!-- College dropdown source -->
<asp:SqlDataSource ID="CollegeDataSource" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
    SelectCommand="SELECT collegeID, description FROM tbl_College WHERE deleted = 0 ORDER BY description">
</asp:SqlDataSource>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var rows = document.querySelectorAll('.crud-grid tbody tr');
    var badge = document.getElementById('programCountBadge');
    if (badge) badge.textContent = rows.length + ' record' + (rows.length !== 1 ? 's' : '');
});
</script>

</asp:Content>
