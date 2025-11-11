<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Builder.aspx.cs" Inherits="FrontendSQLDev.Builder" %>


<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">

        function addRow() {
            var table = document.getElementById("employeeTable");
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);

            // Columns: Name, Role, Rate, Hours Y1–Y5, Remove button
            var cell1 = row.insertCell(0);
            cell1.innerHTML = '<input type="text" name="name[]" />';

            var cell2 = row.insertCell(1);
            cell2.innerHTML = '<select name="role[]">' +
                '<option value="PI">PI</option>' +
                '<option value="Co-PI">Co-PI</option>' +
                '<option value="Postdoc">Postdoc</option>' +
                '<option value="Graduate">Grad Student</option>' +
                '<option value="Undergraduate">Undergrad student</option>' +
                '<option value="Temp">Temp</option>' +
                '</select>';

            var cell3 = row.insertCell(2)
            cell3.innerHTML = '<input type="number" name="hourlyRate[]" />';

            for (var i = 4; i <= 8; i++) {
                var cell = row.insertCell(i - 1);
                cell.innerHTML = '<input type="number" name="hoursY' + (i - 3) + '[]" min="0" />';
            }

            var cellLast = row.insertCell(8);
            cellLast.innerHTML = '<button type="button" onclick="removeRow(this)">Remove</button>';
        }

        function addTrip() {
            var table = document.getElementById("travelTable");
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);

            var cell1 = row.insertCell(0);
            cell1.innerHTML = '<input type="text" name="destination[]" />';

            var cell2 = row.insertCell(1);
            cell2.innerHTML = '<input type="number" name="duration[]" min="1" />';

            var cell3 = row.insertCell(2);
            cell3.innerHTML = '<input type="checkbox" name="domestic[]" />';

            var cell4 = row.insertCell(3);
            cell4.innerHTML = '<input type="number" name="year[]" min="1" max="5" />';

            var cell5 = row.insertCell(4);
            cell5.innerHTML = '<button type="button" onclick="removeRow(this)">Remove</button>';
        }

        function addDirectCost() {
            var table = document.getElementById("otherCostsTable");
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);

            var cell1 = row.insertCell(0);
            cell1.innerHTML = '<td>Other</td>';

            var cell2 = row.insertCell(1);
            cell2.innerHTML = '<input type="number" name="otherY1[]" min="0" />';

            var cell3 = row.insertCell(2);
            cell3.innerHTML = '<input type="number" name="otherY2[]" min="0" />';

            var cell4 = row.insertCell(3);
            cell4.innerHTML = '<input type="number" name="otherY3[]" min="0" />';

            var cell5 = row.insertCell(4);
            cell5.innerHTML = '<input type="number" name="otherY2[]" min="0" />';

            var cell6 = row.insertCell(5);
            cell6.innerHTML = '<input type="number" name="otherY2[]" min="0" />';

            var cell7 = row.insertCell(6);
            cell7.innerHTML = '<button type="button" onclick="removeRow(this)">Remove</button>';
        }


        function removeRow(btn) {
            var row = btn.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            height: 21px;
            width: 246px;
        }
        .auto-style2 {
            width: 246px;
        }
    </style>
    </asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container m-4">
            <asp:Panel ID="StartPanel" runat="server">
                <%-- let server send html to client --%>
                <h1>PI Budget Builder</h1>
                <h2>Project Information:</h2>
                
                    PI Name:<br />&nbsp;<asp:DropDownList ID="PiName" runat="server">
                </asp:DropDownList>
                <br />
                <br />
                Project Title:
                <br />
                <asp:TextBox ID="ProjectTitle0" runat="server" />
                <br />
                <br />
                Funding Source:<br />&nbsp;<asp:TextBox ID="FundingSource0" runat="server" />
                <br />
                <br />
                Institution:<br /> <asp:DropDownList ID="InstitutionDropdown" runat="server">
                    </asp:DropDownList>
                    <br />
                    <br />
                    Start Date:
                <br />
                <asp:TextBox ID="StartDate" runat="server" TextMode="Date" />
                <br />
                <br />
                End Date:<br />
                <asp:TextBox ID="EndDate" runat="server" TextMode="Date" />
                <br />
                <p>
                    &nbsp;</p>
            </asp:Panel>
            <asp:Panel ID="EmpoloyeePanel" runat="server">
                <br />
                <h2>Project Employees</h2>
                <br />
                <br />
                <br />
            </asp:Panel>
             <asp:Panel ID="TravelPanel" runat="server">
                 <h2>Travel Information</h2>
                 <br />
                 <br />
                 <br />
            </asp:Panel>
            <asp:Panel ID="OtherPanel" runat="server">
                <br />
                <h2>Other Direct Costs</h2>
                <p>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </p>
                <p>
                    &nbsp;</p>

                <p>
                    <table style="width:100%;">
                        <tr>
                            <td>
                                <asp:Panel ID="Year1" runat="server">
                                    <table style="width:100%;">
                                        <tr>
                                            <td class="auto-style1">Category</td>
                                            <td rowspan="10">
                                                <asp:Panel ID="Panel1" runat="server">
                                                    Year1<br />
                                                    <br />
                                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox26" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox31" runat="server"></asp:TextBox>
                                                </asp:Panel>
                                            </td>
                                            <td rowspan="10">
                                                <asp:Panel ID="Panel2" runat="server">
                                                    Year2<br />
                                                    <br />
                                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox27" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox32" runat="server"></asp:TextBox>
                                                </asp:Panel>
                                            </td>
                                            <td rowspan="10">
                                                <asp:Panel ID="Panel3" runat="server">
                                                    Year3<br />
                                                    <br />
                                                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox23" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox28" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox33" runat="server"></asp:TextBox>
                                                </asp:Panel>
                                            </td>
                                            <td rowspan="10">
                                                <asp:Panel ID="Panel4" runat="server">
                                                    Year4<br />
                                                    <br />
                                                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox24" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox29" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox34" runat="server"></asp:TextBox>
                                                </asp:Panel>
                                            </td>
                                            <td rowspan="10">
                                                <asp:Panel ID="Panel5" runat="server">
                                                    Year5<br />
                                                    <br />
                                                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox25" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox30" runat="server"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="TextBox35" runat="server"></asp:TextBox>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style2">Materials and supplies</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style2">&lt;5k small equipment</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style2">Publication costs</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style2">Computer services</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style2">Software</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style2">Facility usage fees</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style2">Conference registration</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style2">Grad student tuition &amp; health insurance</td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </p>
                <br />

            </asp:Panel>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;
            <asp:Button ID="Back1" runat="server" Text="Back" OnClick="Back1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Next1" runat="server" Text="Next" OnClick="Next1_Click" />
            <br />
            <br />

        </div>
</asp:Content>
