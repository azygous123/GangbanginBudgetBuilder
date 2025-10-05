<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FrontendSQLDev._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
    <asp:Panel ID="studentPNL" DefaultButton="Button1" runat="server" >
    <p>
        Welcome to the Gangbanin Budget Builder</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Welcome..."></asp:Label>
    </p>
    <p>
        Add a Student to the Database:</p>
    <p>
        First name:</p>
    <p>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</p>
    <p>
        Last name:</p>
    <p>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
</p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
    <br />
</p>
<p>
    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    </asp:GridView>
</p>
<p>
</p>
<p>
</p>
    </asp:Panel>
</asp:Content>
