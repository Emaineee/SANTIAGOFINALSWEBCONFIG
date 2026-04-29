<%@ Page Title="" Language="C#" MasterPageFile="~/MySite.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SantiagoSoftDev225262V4.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div>
            <hr />
            <h1>Prelim Activity for ASP.NET Web</h1>
            <hr />
        </div>
        <%-- Row with 3 Column --%>
        <div class="row">
            <%-- 1st Column Label/Textbox/Button --%>
            <div class="col-md-4">
                <h3 id="LabelTextboxButton">Label/Textbox/Button</h3>
                <hr />
                <table class="w-auto">
                    <tr>
                        <td class="w-25">
                            <asp:Label ID="Label2" runat="server" Text="Username"></asp:Label>
                        </td>
                        <td class="w-75">
                            <asp:TextBox ID="txtUsername" runat="server" ToolTip="Enter Username."></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="w-100">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                        </td>
                    </tr>
                    <tr>
                        <td class="w-100">
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <%-- 2nd Column Hyperlink --%>
            <div class="col-md-4">
                <h3 id="hyperlink">HyperLink</h3>
                <hr />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://github.com/">HyperLink</asp:HyperLink>
            </div>
            <%-- 3rd Column Radio Button--%>
            <div class="col-md-4">
                <h3 id="radioButton">Radio Button</h3>
                <hr />
                <asp:Panel ID="Panel1" runat="server">
                <asp:RadioButton ID="rdbtn1" runat="server" GroupName="YearLevel" Text="1st Year" />
                <br />
                <asp:RadioButton ID="rdbtn2" runat="server" GroupName="YearLevel" Text="2nd Year" />
                <br />
                <asp:RadioButton ID="rdbtn3" runat="server" GroupName="YearLevel" Text="3rd Year" />
                <br />
                <asp:RadioButton ID="rdbtn4" runat="server" GroupName="YearLevel" Text="4th Year" />
                <br />
                <asp:Button ID="btnRadioButton" runat="server" Text="Select" OnClick="btnRadioButton_Click" /> <br />
                <asp:Label ID="lblRadioButton" runat="server" Text=""></asp:Label>
                </asp:Panel> 
            </div>
        </div>
    </main>
</asp:Content>
