<%@ Page Title="" Language="C#" MasterPageFile="~/MySite.Master"
AutoEventWireup="true" CodeBehind="ProgramCrud.aspx.cs"
Inherits="SantiagoSoftDev225262V4.ProgramCrud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div style="max-width: 1100px; margin: 40px auto; font-family: Arial;">

    <!-- TITLE -->
    <h2 style="text-align:center; margin-bottom:20px;">Program Management</h2>

    <!-- 🔥 FIXED: DATA SOURCE MUST BE HERE -->
    <asp:SqlDataSource ID="SqlDataSourceColleges" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
        SelectCommand="SELECT collegeID, code AS CollegeCode FROM tbl_College WHERE deleted = 0">
    </asp:SqlDataSource>

    <!-- GRID WRAPPER -->
    <div style="overflow-x:auto;">

        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="programID,collegeID"
            DataSourceID="SqlDataSource1"
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
            OnRowDeleted="GridView1_RowDeleted"
            CssClass="table table-hover table-bordered"
            GridLines="None"
            Width="100%"
            style="background:white; border-radius:10px; overflow:hidden;">

            <Columns>

                <asp:BoundField DataField="programID" HeaderText="ID" Visible="False" />
                <asp:BoundField DataField="description" HeaderText="Description" />
                <asp:BoundField DataField="code" HeaderText="Code" />
                <asp:BoundField DataField="CollegeCode" HeaderText="College" />

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>

                        <asp:LinkButton ID="lbtnEdit" runat="server"
                            CommandName="Select"
                            CssClass="btn btn-sm btn-primary"
                            Style="border-radius:10px; padding:2px 12px;">
                            Edit
                        </asp:LinkButton>

                        &nbsp;

                        <asp:LinkButton ID="lbtnDelete" runat="server"
                            CommandName="Delete"
                            CssClass="btn btn-sm btn-danger"
                            Style="border-radius:10px; padding:2px 12px;"
                            OnClientClick="return confirm('Are you sure you want to delete this record?');">
                            Delete
                        </asp:LinkButton>

                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>

    </div>

    <br />

    <!-- ADD BUTTON -->
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

        <div style="background:#f8f9fa; padding:25px; border-radius:12px; box-shadow:0px 2px 10px rgba(0,0,0,0.1);">

            <table style="width:100%; max-width:500px; margin:auto; border-spacing:10px;">

                <tr>
                    <td><strong>Description</strong></td>
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
                    <td><strong>College</strong></td>
                    <td>

                        <asp:DropDownList ID="DdlCollege" runat="server"
                            CssClass="form-control"
                            DataSourceID="SqlDataSourceColleges"
                            DataTextField="CollegeCode"
                            DataValueField="collegeID"
                            AppendDataBoundItems="True">

                            <asp:ListItem Text="-- Select College --" Value="0"></asp:ListItem>

                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="rfvCollege" runat="server"
                            ControlToValidate="DdlCollege"
                            InitialValue="0"
                            ErrorMessage="Please select a college!"
                            ForeColor="Red"
                            Display="Dynamic"
                            Font-Size="Small">
                        </asp:RequiredFieldValidator>

                    </td>
                </tr>

                <tr>
                    <td colspan="2" style="text-align:center; padding-top:20px;">

                        <asp:Button ID="BtnSave" runat="server"
                            Text="Save"
                            CssClass="btn btn-success"
                            OnClick="BtnSave_Click" />

                        <asp:Button ID="BtnUpdate" runat="server"
                            Text="Update"
                            CssClass="btn btn-primary"
                            OnClick="BtnUpdate_Click" />

                        <asp:Button ID="BtnCancel" runat="server"
                            Text="Cancel"
                            CssClass="btn btn-secondary"
                            OnClick="BtnCancel_Click"
                            CausesValidation="false" />

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
        ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>"

        SelectCommand="SELECT p.programID, p.description, p.code, p.collegeID, c.code AS CollegeCode 
                       FROM (tbl_Program p INNER JOIN tbl_College c ON p.collegeID = c.collegeID)"

        InsertCommand="INSERT INTO tbl_Program (description, code, collegeID, deleted)
                       VALUES (?, ?, ?, 0)"

        UpdateCommand="UPDATE tbl_Program 
                       SET description = ?, code = ?, collegeID = ?
                       WHERE programID = ?"

        DeleteCommand="DELETE FROM tbl_Program WHERE programID = ?">

        <InsertParameters>
            <asp:ControlParameter ControlID="TxtDescription" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TxtCode" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DdlCollege" PropertyName="SelectedValue" Type="Int32" />
        </InsertParameters>

        <UpdateParameters>
            <asp:ControlParameter ControlID="TxtDescription" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TxtCode" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DdlCollege" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="programID" Type="Int32" />
        </UpdateParameters>

        <DeleteParameters>
            <asp:Parameter Name="programID" Type="Int32" />
        </DeleteParameters>

    </asp:SqlDataSource>

</div>

</asp:Content>