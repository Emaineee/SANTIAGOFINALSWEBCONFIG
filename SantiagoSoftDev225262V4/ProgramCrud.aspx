<%@ Page Title="Program Management | SoftDev MS" Language="C#" MasterPageFile="~/MySite.Master"
    AutoEventWireup="true" CodeBehind="ProgramCrud.aspx.cs" Inherits="SantiagoSoftDev225262V4.ProgramCrud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
    .page-hero {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 28px;
        flex-wrap: wrap;
        gap: 14px;
    }
    .page-hero-left h1 {
        font-family: 'Outfit', sans-serif;
        font-size: 26px;
        font-weight: 800;
        color: #1e293b;
        margin-bottom: 4px;
        display: flex;
        align-items: center;
        gap: 12px;
    }
    .page-icon-amber {
        width: 44px; height: 44px;
        background: linear-gradient(135deg, #d97706, #fbbf24);
        border-radius: 11px;
        display: flex; align-items: center; justify-content: center;
        font-size: 18px;
        color: white;
    }
    .page-hero-left p { color: #64748b; font-size: 14px; }

    .table-wrap {
        background: white;
        border-radius: 16px;
        box-shadow: 0 2px 20px rgba(0,0,0,0.07);
        border: 1px solid #e2e8f0;
        overflow: hidden;
    }

    .table-toolbar {
        padding: 18px 22px;
        border-bottom: 1px solid #f1f5f9;
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-wrap: wrap;
        gap: 12px;
        background: #fafbff;
    }

    .table-title {
        font-family: 'Outfit', sans-serif;
        font-weight: 700;
        font-size: 17px;
        color: #1e293b;
        display: flex;
        align-items: center;
        gap: 9px;
    }

    .gv-table { width: 100%; border-collapse: collapse; font-size: 14px; }
    .gv-table thead tr th {
        background: #f8fafc;
        color: #64748b;
        font-weight: 600;
        font-size: 12px;
        letter-spacing: 0.5px;
        text-transform: uppercase;
        padding: 13px 18px;
        border-bottom: 2px solid #e2e8f0;
        text-align: left;
    }
    .gv-table tbody tr { border-bottom: 1px solid #f1f5f9; transition: background 0.2s ease; }
    .gv-table tbody tr:hover { background: #f8fafc; }
    .gv-table tbody td { padding: 13px 18px; color: #1e293b; vertical-align: middle; }
    .gv-table tbody tr:last-child { border-bottom: none; }

    .row-num {
        display: inline-flex; align-items: center; justify-content: center;
        width: 26px; height: 26px;
        background: #f1f5f9;
        border-radius: 6px;
        font-size: 12px; font-weight: 600; color: #64748b;
    }

    .col-code {
        display: inline-block;
        padding: 4px 12px;
        background: #fef3c7;
        color: #d97706;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 0.5px;
    }

    .col-college {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 4px 12px;
        background: #f1f5f9;
        color: #475569;
        border-radius: 8px;
        font-size: 12px;
        font-weight: 600;
    }

    .form-card {
        background: white;
        border-radius: 16px;
        box-shadow: 0 2px 20px rgba(0,0,0,0.07);
        border: 1px solid #e2e8f0;
        overflow: hidden;
        margin-bottom: 24px;
    }

    .form-card-header {
        background: linear-gradient(90deg, #92400e, #d97706);
        padding: 18px 24px;
    }

    .form-card-header h3 {
        font-family: 'Outfit', sans-serif;
        font-size: 17px;
        font-weight: 700;
        color: white;
    }

    .form-card-header p { font-size: 13px; color: rgba(255,255,255,0.75); }

    .form-card-body { padding: 28px 28px 24px; }

    .form-row-3 {
        display: grid;
        grid-template-columns: 2fr 1fr 2fr;
        gap: 18px;
    }

    .fg { margin-bottom: 0; }
    .fg label {
        display: block;
        font-size: 13px;
        font-weight: 600;
        color: #374151;
        margin-bottom: 7px;
    }

    .fg input, .fg select {
        width: 100%;
        padding: 10px 14px;
        border: 1.5px solid #e2e8f0;
        border-radius: 9px;
        font-size: 14px;
        font-family: 'DM Sans', sans-serif;
        color: #1e293b;
        background: #f8fafc;
        outline: none;
        transition: border-color 0.2s ease, box-shadow 0.2s ease, background 0.2s ease;
    }

    .fg input:focus, .fg select:focus {
        border-color: #d97706;
        background: white;
        box-shadow: 0 0 0 3px rgba(217,119,6,0.12);
    }

    .form-actions {
        display: flex;
        gap: 10px;
        margin-top: 22px;
        padding-top: 18px;
        border-top: 1px solid #f1f5f9;
        flex-wrap: wrap;
    }

    .success-msg {
        display: flex;
        align-items: center;
        gap: 10px;
        background: #ecfdf5;
        border: 1px solid #a7f3d0;
        border-radius: 10px;
        padding: 13px 18px;
        color: #065f46;
        font-size: 14px;
        font-weight: 500;
        margin-bottom: 20px;
    }

    @media (max-width: 700px) {
        .form-row-3 { grid-template-columns: 1fr; }
    }
</style>

<!-- Page Header -->
<div class="page-hero">
    <div class="page-hero-left">
        <h1>
            <div class="page-icon-amber"><i class="fas fa-book-open"></i></div>
            Program Management
        </h1>
        <p>Manage academic programs linked to colleges in the institution.</p>
    </div>
    <asp:LinkButton ID="LbtnAddNewRecord" runat="server"
        OnClick="LbtnAddNewRecord_Click"
        CssClass="btn btn-warning">
        <i class="fas fa-plus"></i> Add New Program
    </asp:LinkButton>
</div>

<!-- Message -->
<asp:Panel ID="pnlMsg" runat="server" Visible="false">
    <div class="success-msg">
        <i class="fas fa-circle-check"></i>
        <asp:Label ID="lblMessege" runat="server"></asp:Label>
    </div>
</asp:Panel>

<!-- ===== FORM PANEL ===== -->
<asp:Panel ID="Panel1" runat="server" Visible="false">
    <div class="form-card">
        <div class="form-card-header">
            <h3>Program Details</h3>
            <p>Fill in the program information below</p>
        </div>
        <div class="form-card-body">
            <div class="form-row-3">
                <div class="fg">
                    <label>Program Name / Description <span style="color:#ef4444;">*</span></label>
                    <asp:TextBox ID="TxtDescription" runat="server" placeholder="e.g. Bachelor of Science in Computer Science" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TxtDescription"
                        ErrorMessage="Program name is required." Display="Dynamic"
                        ValidationGroup="ProgramGroup"
                        style="font-size:12px; color:#ef4444; margin-top:5px; display:block;" />
                </div>
                <div class="fg">
                    <label>Program Code <span style="color:#ef4444;">*</span></label>
                    <asp:TextBox ID="TxtCode" runat="server" placeholder="e.g. BSCS" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TxtCode"
                        ErrorMessage="Code is required." Display="Dynamic"
                        ValidationGroup="ProgramGroup"
                        style="font-size:12px; color:#ef4444; margin-top:5px; display:block;" />
                </div>
                <div class="fg">
                    <label>College <span style="color:#ef4444;">*</span></label>
                    <asp:DropDownList ID="DdlCollege" runat="server"
                        DataSourceID="CollegeDataSource"
                        DataTextField="description"
                        DataValueField="collegeID"
                        AppendDataBoundItems="true">
                        <asp:ListItem Text="-- Select College --" Value="0" />
                    </asp:DropDownList>
                </div>
            </div>

            <div class="form-actions">
                <asp:Button ID="BtnSave" runat="server"
                    Text="Save Program" CssClass="btn btn-warning"
                    OnClick="BtnSave_Click" ValidationGroup="ProgramGroup" />
                <asp:Button ID="BtnUpdate" runat="server"
                    Text="Update Program" CssClass="btn btn-primary"
                    OnClick="BtnUpdate_Click" CausesValidation="false" Visible="false" />
                <asp:Button ID="BtnCancel" runat="server"
                    Text="Cancel" CssClass="btn btn-secondary"
                    OnClick="BtnCancel_Click" CausesValidation="false" />
            </div>
        </div>
    </div>
</asp:Panel>

<!-- ===== GRID ===== -->
<div class="table-wrap">
    <div class="table-toolbar">
        <div class="table-title">
            <i class="fas fa-table" style="color:#d97706;"></i>
            Program Records
        </div>
    </div>
    <div style="overflow-x:auto;">
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="programID,collegeID"
            DataSourceID="SqlDataSource1"
            CssClass="gv-table"
            OnRowDeleted="GridView1_RowDeleted"
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
            EmptyDataText="No programs found. Click 'Add New Program' to get started.">
            <Columns>
                <asp:TemplateField HeaderText="#">
                    <ItemTemplate>
                        <span class="row-num"><%# Container.DataItemIndex + 1 %></span>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="description" HeaderText="Program Name" />

                <asp:TemplateField HeaderText="Code">
                    <ItemTemplate>
                        <span class="col-code"><%# Eval("code") %></span>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="College">
                    <ItemTemplate>
                        <span class="col-college">
                            <i class="fas fa-building-columns"></i>
                            <%# Eval("collegedescription") %>
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnEdit" runat="server"
                            CommandName="Select"
                            CssClass="btn btn-sm btn-primary">
                            <i class="fas fa-pen"></i> Edit
                        </asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="lbtnDelete" runat="server"
                            CommandName="Delete"
                            CssClass="btn btn-sm btn-danger"
                            OnClientClick="return confirm('⚠️ Are you sure you want to delete this program? This action cannot be undone.');">
                            <i class="fas fa-trash"></i> Delete
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
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

</asp:Content>
