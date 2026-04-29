<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="SantiagoSoftDev225262V4.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="collegeID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="collegeID" HeaderText="collegeID" InsertVisible="False" ReadOnly="True" SortExpression="collegeID" />
                    <asp:BoundField DataField="code" HeaderText="code" SortExpression="code" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    <asp:BoundField DataField="deleted" HeaderText="deleted" SortExpression="deleted" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [collegeID], [code], [description], [deleted] FROM [tbl_College]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
