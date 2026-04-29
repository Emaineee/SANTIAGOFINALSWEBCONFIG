<%@ Page Title="" Language="C#" MasterPageFile="~/MySitePrelim.Master" AutoEventWireup="true" CodeBehind="PrelimSantiago.aspx.cs" Inherits="SantiagoSoftDev225262V4.PrelimSantiago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div>
            <hr />
            <h1>Prelim Exam for ASP.NET Web</h1>
            <hr />
        </div>

        <div class="row">

            <div class="col-md-6">
                <h3 id="College">College</h3>
                <hr />
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="collegeID" DataSourceID="SqlDataSource4">
                    <Columns>
                        <asp:BoundField DataField="collegeID" HeaderText="collegeID" InsertVisible="False" ReadOnly="True" SortExpression="collegeID" />
                        <asp:BoundField DataField="code" HeaderText="code" SortExpression="code" />
                        <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [collegeID], [code], [description] FROM [tbl_College]"></asp:SqlDataSource>
            </div>

            <div class="col-md-6">
                <h3 id="Program">Program</h3>
                <hr />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="programID" DataSourceID="SqlDataSource3">
                    <Columns>
                        <asp:BoundField DataField="programID" HeaderText="programID" InsertVisible="False" ReadOnly="True" SortExpression="programID" />
                        <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                        <asp:BoundField DataField="code" HeaderText="code" SortExpression="code" />
                        <asp:BoundField DataField="collegeID" HeaderText="collegeID" SortExpression="collegeID" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [programID], [description], [code], [collegeID] FROM [tbl_Program]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
            </div>
          </div>  
            <div>
                <div class="col-md-12">
                    <h3 id="School Info">School Info</h3>
                    <hr />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="studentID" HeaderText="studentID" SortExpression="studentID" />
                            <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
                            <asp:BoundField DataField="Middlename" HeaderText="Middlename" SortExpression="Middlename" />
                            <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
                            <asp:BoundField DataField="Bday" HeaderText="Bday" SortExpression="Bday" />
                            <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
                            <asp:BoundField DataField="progranID" HeaderText="progranID" SortExpression="progranID" />
                            <asp:BoundField DataField="yearLevel" HeaderText="yearLevel" SortExpression="yearLevel" />
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [studentID], [Firstname], [Middlename], [Lastname], [Bday], [Sex], [progranID], [yearLevel] FROM [tbl_StudentInfo]"></asp:SqlDataSource>
                     





                </div>
            </div>
    </main>
   
</asp:Content>
