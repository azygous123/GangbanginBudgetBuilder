<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SetupInit.aspx.cs" Inherits="FrontendSQLDev.SetupInit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:DropDownList ID="DropDownListMain" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListMain_SelectedIndexChanged">
        <asp:ListItem Value="0">Student</asp:ListItem>
        <asp:ListItem Value="1">Faculty</asp:ListItem>
        <asp:ListItem Value="2">Tuition</asp:ListItem>
        <asp:ListItem Value="3">Travel Profile</asp:ListItem>
    </asp:DropDownList>
    <asp:Panel ID="PanelStudent" runat="server">
        Student First Name:<br />
        <asp:TextBox ID="TBStudentFirst" runat="server"></asp:TextBox>
        <br />
        Student Last Name:<br />
        <asp:TextBox ID="TBStudentLast" runat="server"></asp:TextBox>
        <br />
        Tuition Rate:<br />
        <asp:DropDownList ID="DDStudentTuition" runat="server">
        </asp:DropDownList>
        <br />
        Travel Profile:<br />
        <asp:DropDownList ID="DDStudentTravel" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="ButtonStudentSubmit" runat="server" Text="Submit" />
        <asp:Button ID="ButtonStudentCancel" runat="server" Text="Cancel" />
        <br />
        <br />
        <br />
        <br />
        <br />
    </asp:Panel>
    <asp:Panel ID="PanelFaculty" runat="server" Visible="False">
        Faculty First Name:<br />
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        Faculty Last Name:<br />
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <br />
        Travel Profile:<br />
        <asp:DropDownList ID="DropDownList3" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" Text="Submit" />
        <asp:Button ID="Button4" runat="server" Text="Cancel" />
        <br />
        <br />
        <br />
</asp:Panel>
    <asp:Panel ID="PanelTravel" runat="server">
</asp:Panel>
    <asp:Panel ID="PanelTuition" runat="server">
</asp:Panel>
    <asp:Panel ID="PanelInstitution" runat="server">
</asp:Panel>
</asp:Content>
