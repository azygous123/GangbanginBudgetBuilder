<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FrontendSQLDev._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
    <asp:Panel ID="studentPNL" runat="server" >
    <h1>
        Welcome to Budget Express</h1>
    <p>
        View Database Table:</p>
        <p>
            <asp:DropDownList ID="DropDownListMain" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListMain_SelectedIndexChanged">
                <asp:ListItem Value="0">Student</asp:ListItem>
                <asp:ListItem Value="1">Faculty</asp:ListItem>
                <asp:ListItem Selected="True" Value="2">Tuition</asp:ListItem>
                <asp:ListItem Value="3">Travel Profile</asp:ListItem>
                <asp:ListItem Value="4">Institution</asp:ListItem>
                <asp:ListItem Value="5">Fringe</asp:ListItem>
            </asp:DropDownList>
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
