<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SetupInit.aspx.cs" Inherits="FrontendSQLDev.SetupInit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:DropDownList ID="DropDownListMain" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListMain_SelectedIndexChanged">
        <asp:ListItem Value="0">Student</asp:ListItem>
        <asp:ListItem Value="1">Faculty</asp:ListItem>
        <asp:ListItem Value="2" Selected="True">Tuition</asp:ListItem>
        <asp:ListItem Value="3">Travel Profile</asp:ListItem>
        <asp:ListItem Value="4">Institution</asp:ListItem>
        <asp:ListItem Value="5">Fringe</asp:ListItem>
    </asp:DropDownList>
    <asp:Panel ID="PanelStudent" runat="server" Visible="False">
        Student First Name:&nbsp; //Dependent on Tuition
        <br />
        <asp:TextBox ID="StuFirst" runat="server"></asp:TextBox>
        <br />
        Student Last Name:<br />
        <asp:TextBox ID="StuLast" runat="server"></asp:TextBox>
        <br />
        Program:<br />
        <asp:DropDownList ID="StuProgram" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="StuSubmit" runat="server" Text="Submit" OnClick="StuSubmit_Click" />
        <asp:Button ID="StuCncl" runat="server" Text="Cancel" />
        <br />
        <br />
    </asp:Panel>
    <asp:Panel ID="PanelFaculty" runat="server" Visible="False">
        Faculty First Name:<br />
        <asp:TextBox ID="FacFirstName" runat="server"></asp:TextBox>
        <br />
        Faculty Last Name:<br />
        <asp:TextBox ID="FacLastName" runat="server"></asp:TextBox>
        <br />
        Salary:<br />
        <asp:TextBox ID="FacSalary" runat="server" TextMode="Number" step="0.01"></asp:TextBox>
        <br />
        <asp:CheckBox ID="FacHourly" runat="server" Text="Hourly" />
        &nbsp;// Add Yearly toggle trigger later<br /> Staff Type:<br />
        <asp:DropDownList ID="FacType" runat="server">
            <asp:ListItem Value="0">Faculty</asp:ListItem>
            <asp:ListItem Value="1">Staff</asp:ListItem>
            <asp:ListItem Value="2">Post Doc</asp:ListItem>
            <asp:ListItem Value="3">Unaffiliated</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="FacSub" runat="server" Text="Submit" OnClick="FacSub_Click" />
        <asp:Button ID="FacCncl" runat="server" Text="Cancel" />
        <br />
        <br />
</asp:Panel>
    <asp:Panel ID="PanelTuition" runat="server">
        Tuition Amount:<br />
        <asp:TextBox ID="TuiAmount" runat="server"></asp:TextBox>
        <br />
        Type:<br />
        <asp:TextBox ID="TuiType" runat="server"></asp:TextBox>
        <br />
        Year:<br />
        <asp:TextBox ID="TuiYear" runat="server"></asp:TextBox>
        <br />
        <asp:CheckBox ID="TuiInState" runat="server" Text="In State" />
        <br />
        <asp:CheckBox ID="TuiGraduate" runat="server" Text="Graduate" />
        <br />
        <br />
        <asp:Button ID="TuiSubmit" runat="server" Text="Submit" OnClick="TuiSubmit_Click" />
        <asp:Button ID="TuiCncl" runat="server" Text="Cancel" />
        <br />
</asp:Panel>
     <asp:Panel ID="PanelFringe" runat="server" Visible="False">
         Fringe Percentage:<br />
         <asp:TextBox ID="FringeVal" runat="server"></asp:TextBox>
         <br />
         Type:<br />
         <asp:TextBox ID="FringeType" runat="server"></asp:TextBox>
         <br />
         Year:<br />
         <asp:TextBox ID="FringeYear" runat="server" TextMode="Number"></asp:TextBox>
         <br />
         <br />
         <asp:Button ID="FringeSubmit" runat="server" Text="Submit" OnClick="FringeSubmit_Click" />
         <asp:Button ID="FringeCncl" runat="server" Text="Cancel" />
         <br />
</asp:Panel>
    <asp:Panel ID="PanelTravel" runat="server" Visible="False">
        Travel Mode:<br />
        <asp:DropDownList ID="TrvMode" runat="server">
        </asp:DropDownList>
        <br />
        Year: // Might revamp all the years to drop downs later manual checks for now<br />
        <asp:TextBox ID="TrvYear" runat="server"></asp:TextBox>
        <br />
        City:<br />
        <asp:TextBox ID="TrvCity" runat="server"></asp:TextBox>
        <br />
        State: // Defaults to country name if foreign<br />
        <asp:TextBox ID="TrvState" runat="server"></asp:TextBox>
        <br />
        Country:<br />
        <asp:DropDownList ID="TrvCountry" runat="server">
        </asp:DropDownList>
        <br />
        <asp:CheckBox ID="TrvForeign" runat="server" Text="Foreign" />
        <br />
        Amount:<br />
        <asp:TextBox ID="TrvAmount" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="TrvSubmit" runat="server" Text="Submit" OnClick="TrvSubmit_Click" />
        <asp:Button ID="TrvCncl" runat="server" Text="Cancel" />
        <br />
        <br />
</asp:Panel>
    <asp:Panel ID="PanelInstitution" runat="server" Visible="False">
        Institution Name:<br />
        <asp:TextBox ID="InstName" runat="server"></asp:TextBox>
        <br />
        Campus:<br />
        <asp:TextBox ID="InstCampus" runat="server"></asp:TextBox>
        <br />
        City:<br />
        <asp:TextBox ID="InstCity" runat="server"></asp:TextBox>
        <br />
        State:<br />
        <asp:TextBox ID="InstState" runat="server"></asp:TextBox>
        <br />
        Country:<br />
        <asp:TextBox ID="InstCountry" runat="server"></asp:TextBox>
        <br />
        FARate:<br />
        <asp:TextBox ID="InstFARate" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="InstSubmit" runat="server" OnClick="InstSubmit_Click" Text="Submit" />
        <asp:Button ID="InstCncl" runat="server" Text="Cancel" />
        <br />
</asp:Panel>
   
</asp:Content>
