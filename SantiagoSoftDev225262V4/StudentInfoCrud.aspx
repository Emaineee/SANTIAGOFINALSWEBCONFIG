<%@ Page Title="Student Management"
    Language="C#"
    MasterPageFile="~/MySite.Master"
    AutoEventWireup="true"
    CodeBehind="StudentInfoCrud.aspx.cs"
    Inherits="SantiagoSoftDev225262V4.StudentInfoCrud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div style="max-width:1200px; margin:40px auto; font-family:Arial;">

    <!-- TITLE -->
    <h2 style="text-align:center; margin-bottom:20px;">Student Management</h2>

    <!-- GRID -->
    <div style="overflow-x:auto;">

        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="ID"
            DataSourceID="SqlDataSource1"
            CssClass="table table-hover table-bordered"
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
            OnRowDeleted="GridView1_RowDeleted"
            GridLines="None"
            Width="100%"
            style="background:white; border-radius:10px; overflow:hidden;">

            <Columns>

                <asp:TemplateField HeaderText="No.">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="ID" Visible="false" />
                <asp:BoundField DataField="studentID" HeaderText="Student ID" />
                <asp:BoundField DataField="Firstname" HeaderText="Firstname" />
                <asp:BoundField DataField="Middlename" HeaderText="Middlename" />
                <asp:BoundField DataField="Lastname" HeaderText="Lastname" />
                <asp:BoundField DataField="Bday" HeaderText="Birthday" />
                <asp:BoundField DataField="Sex" HeaderText="Sex" />
                <asp:BoundField DataField="ProgramCode" HeaderText="Program" />
                <asp:BoundField DataField="yearLevel" HeaderText="Year Level" />

                <asp:TemplateField HeaderText="Action">
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
                            OnClientClick="return confirm('Delete this record?');">
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
        <asp:LinkButton ID="lbtnAddNewRecord" runat="server"
            OnClick="lbtnAddNewRecord_Click"
            CssClass="btn btn-success">
            + Add New Record
        </asp:LinkButton>
    </div>

    <br />

    <!-- FORM PANEL -->
    <asp:Panel ID="PanelStudent" runat="server" Visible="False">

        <div style="background:#f8f9fa; padding:25px; border-radius:12px; box-shadow:0 2px 10px rgba(0,0,0,0.1);">

            <asp:HiddenField ID="hfStudentID" runat="server" />

            <table style="width:100%; max-width:500px; margin:auto; border-spacing:10px;">

                <tr>
                    <td><strong>Student ID</strong></td>
                    <td><asp:TextBox ID="txtStudentID" runat="server" CssClass="form-control" /></td>
                </tr>

                <tr>
                    <td><strong>Firstname</strong></td>
                    <td><asp:TextBox ID="txtFirstname" runat="server" CssClass="form-control" /></td>
                </tr>

                <tr>
                    <td><strong>Middlename</strong></td>
                    <td><asp:TextBox ID="txtMiddlename" runat="server" CssClass="form-control" /></td>
                </tr>

                <tr>
                    <td><strong>Lastname</strong></td>
                    <td><asp:TextBox ID="txtLastname" runat="server" CssClass="form-control" /></td>
                </tr>

                <tr>
                    <td><strong>Birthday</strong></td>
                    <td><asp:TextBox ID="txtBday" runat="server" TextMode="Date" CssClass="form-control" /></td>
                </tr>

                <tr>
                    <td><strong>Sex</strong></td>
                    <td>
                        <asp:DropDownList ID="ddlSex" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Male" Value="M" />
                            <asp:ListItem Text="Female" Value="F" />
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td><strong>Program</strong></td>
                    <td>
                        <asp:DropDownList ID="ddlProgram" runat="server"
                            CssClass="form-control"
                            DataSourceID="SqlDataSourceProgram"
                            DataTextField="code"
                            DataValueField="programID">
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td><strong>Year Level</strong></td>
                    <td><asp:TextBox ID="txtYearLevel" runat="server" CssClass="form-control" /></td>
                </tr>

                <tr>
                    <td colspan="2" style="text-align:center; padding-top:20px;">

                        <asp:Button ID="btnSaveStudent" runat="server" Text="Save"
                            OnClick="btnSaveStudent_Click"
                            CssClass="btn btn-success" />

                        <asp:Button ID="btnUpdateStudent" runat="server" Text="Update"
                            OnClick="btnUpdateStudent_Click"
                            CssClass="btn btn-primary" />

                        <asp:Button ID="btnCancelStudent" runat="server" Text="Cancel"
                            OnClick="btnCancelStudent_Click"
                            CssClass="btn btn-secondary" />

                    </td>
                </tr>

            </table>

        </div>

    </asp:Panel>

    <br />

    <asp:Label ID="lblMessage" runat="server"
        CssClass="alert alert-success"
        style="display:block; text-align:center;">
    </asp:Label>

    <!-- SQL (UNCHANGED) -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString3%>"
        ProviderName="System.Data.OleDb"
        SelectCommand="
        SELECT s.ID, s.studentID, s.Firstname, s.Middlename, s.Lastname,
               s.Bday, s.Sex, p.code AS ProgramCode, s.yearLevel
        FROM tbl_StudentInfo s
        LEFT JOIN tbl_Program p ON s.programID = p.programID
        WHERE s.deleted = 0"
        InsertCommand="
        INSERT INTO tbl_StudentInfo
        (studentID, Firstname, Middlename, Lastname, Bday, Sex, programID, yearLevel, deleted)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
        UpdateCommand="
        UPDATE tbl_StudentInfo SET
            studentID=?,
            Firstname=?,
            Middlename=?,
            Lastname=?,
            Bday=?,
            Sex=?,
            programID=?,
            yearLevel=?
        WHERE ID=?"
        DeleteCommand="
        UPDATE tbl_StudentInfo SET deleted=1 WHERE ID=?">

        <InsertParameters>
            <asp:ControlParameter ControlID="txtStudentID" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtFirstname" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtMiddlename" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtLastname" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtBday" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlSex" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="txtYearLevel" PropertyName="Text" />
            <asp:Parameter DefaultValue="0" />
        </InsertParameters>

        <UpdateParameters>
            <asp:ControlParameter ControlID="txtStudentID" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtFirstname" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtMiddlename" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtLastname" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtBday" PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlSex" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="ddlProgram" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="txtYearLevel" PropertyName="Text" />
            <asp:ControlParameter ControlID="hfStudentID" PropertyName="Value" />
        </UpdateParameters>

    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceProgram" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString3%>"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT programID, code FROM tbl_Program WHERE deleted = 0" />

</div>

</asp:Content>