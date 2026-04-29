<%@ Page Title="" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="CollegeCrud.aspx.cs" Inherits="SantiagoSoftDev225262V4.CollegeCrud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div style="max-width: 1000px; margin: 40px auto; font-family: Arial;">

    <!-- TITLE -->
    <h2 style="text-align:center; margin-bottom:20px;">College Management</h2>

    <!-- GRIDVIEW WRAPPER -->
    <div style="overflow-x:auto;">

        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="collegeID"
            DataSourceID="SqlDataSource1"
            CssClass="table table-hover table-bordered"
            Width="100%"
            AllowCustomPaging="True"
            OnRowDeleted="GridView1_RowDeleted"
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
            style="background:white; border-radius:10px; overflow:hidden;">

            <Columns>

                <asp:TemplateField HeaderText="No.">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="collegeID" HeaderText="collegeID" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="description" HeaderText="Name" />
                <asp:BoundField DataField="code" HeaderText="Code" />
                <asp:BoundField DataField="deleted" HeaderText="deleted" Visible="False" />

                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>

                        <asp:LinkButton ID="lbtnEdit" runat="server"
                            CommandName="Select"
                            Text="Edit"
                            CssClass="btn btn-sm btn-primary"
                            OnClick="LinkButton2_Click">
                        </asp:LinkButton>

                        &nbsp;

                        <asp:LinkButton ID="lbtnDelete" runat="server"
                            CommandName="Delete"
                            Text="Delete"
                            CssClass="btn btn-sm btn-danger"
                            OnClientClick="return confirm('Are you sure you want to delete this record?');">
                        </asp:LinkButton>

                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>

    </div>

    <br />

    <!-- ADD NEW BUTTON -->
    <div style="text-align:right;">
        <asp:LinkButton ID="LbtnAddNewRecord" runat="server"
            OnClick="LbtnAddNewRecord_Click"
            CssClass="btn btn-success">
            + Add New Record
        </asp:LinkButton>
    </div>

    <br />

    <!-- FORM PANEL -->
    <asp:Panel ID="Panel1" runat="server" Visible="false">

        <div style="background:#f8f9fa; padding:20px; border-radius:10px; box-shadow:0px 2px 10px rgba(0,0,0,0.1);">

            <table style="width:100%; border-spacing:10px;">

                <tr>
                    <td style="width:150px;"><strong>Description</strong></td>
                    <td>
                        <asp:TextBox ID="TxtDescription" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td><strong>Code</strong></td>
                    <td>
                        <asp:TextBox ID="TxtCode" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td>

                        <asp:Button ID="BtnSave" runat="server"
                            Text="Save"
                            CssClass="btn btn-primary"
                            OnClick="BtnSave_Click" />

                        <asp:Button ID="BtnUpdate" runat="server"
                            Text="Update"
                            CssClass="btn btn-warning"
                            OnClick="BtnUpdate_Click" />

                        <asp:Button ID="BtnCancel" runat="server"
                            Text="Cancel"
                            CssClass="btn btn-secondary"
                            OnClick="BtnCancel_Click" />

                    </td>
                </tr>

            </table>

        </div>

    </asp:Panel>

    <br />

    <!-- MESSAGE -->
    <asp:Label ID="lblMessege" runat="server"
        Text=""
        CssClass="alert alert-success"
        style="display:block; text-align:center;">
    </asp:Label>

    <br />

    <!-- SQL (UNCHANGED EXACTLY AS YOU REQUESTED) -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT collegeID, description, code, deleted FROM tbl_College WHERE (deleted = 0)"
        InsertCommand="INSERT INTO tbl_College(description, code, deleted) VALUES (?, ?, ?)"
        OnSelecting="SqlDataSource1_Selecting"
        DeleteCommand="UPDATE tbl_College SET deleted = ? WHERE (collegeID = ?)"
        OnInserted="SqlDataSource1_Inserted"
        OnUpdated="SqlDataSource1_Updated"
        UpdateCommand="UPDATE tbl_College SET description = ?, code = ? WHERE (collegeID = ?)">

        <DeleteParameters>
            <asp:Parameter DefaultValue="1" Name="?" />
        </DeleteParameters>

        <InsertParameters>
            <asp:ControlParameter ControlID="TxtDescription" Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="TxtCode" Name="?" PropertyName="Text" />
            <asp:Parameter DefaultValue="0" Name="?" />
        </InsertParameters>

        <UpdateParameters>
            <asp:ControlParameter ControlID="TxtDescription" Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="TxtCode" Name="?" PropertyName="Text" />
            <asp:ControlParameter ControlID="GridView1" Name="?" PropertyName="SelectedValue" />
        </UpdateParameters>

    </asp:SqlDataSource>

</div>

</asp:Content>