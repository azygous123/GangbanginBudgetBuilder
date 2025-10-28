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
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container m-4">
            <asp:Literal ID="OutputLiteral" runat="server"></asp:Literal> <%-- let server send html to client --%>

            <h1>PI Budget Builder</h1>

            <h2>Project Information</h2> <br />

            <asp:Label ID="PILabel" runat="server" Text="PI Name: " />
            <asp:TextBox ID="PIText" runat="server" /> <br /><br />

            <asp:Label ID="TitleLabel" runat="server" Text="Project Title: " /> 
            <asp:TextBox ID="ProjectTitle" runat="server" /> <br /><br />

            <asp:Label ID="FundingLabel" runat="server" Text="Funding Source: " /> 
            <asp:TextBox ID="FundingSource" runat="server" /> <br /><br />

            <asp:Label ID="InstitutionLabel" runat="server" Text="Institution: " />
            <asp:DropDownList ID="InstitutionDropdown" runat="server">
                <asp:ListItem Text="University of Idaho" />
            </asp:DropDownList> <br /><br />

            <asp:Label ID="StartLabel" runat="server" Text="Start Date: " /> 
            <asp:TextBox ID="StartDate" runat="server" /> <br /><br />

            <asp:Label ID="EndLabel" runat="server" Text="End Date: " /> 
            <asp:TextBox ID="EndDate" runat="server" /> <br /><br />
             
             <h2>Project Employees</h2>

            <table id="employeeTable" border="1">
                <tr>
                    <th>Name</th>
                    <th>Role</th>
                    <th>Hourly Rate</th>
                    <th>Hours Y1</th>
                    <th>Hours Y2</th>
                    <th>Hours Y3</th>
                    <th>Hours Y4</th>
                    <th>Hours Y5</th>
                    <th>Action</th>
                </tr>
            </table> <br />           
            <input type="button" value="Add Employee" onclick="addRow()" /> <br /><br />

            <h2>Travel Information</h2>

            <table id="travelTable" border="1">
                <tr>
                    <th>Destination</th>
                    <th>Duration (Days)</th>
                    <th>Domestic?</th>
                    <th>Year</th>
                    <th>Action</th>
                </tr>
            </table> <br />

            <input type="button" value="Add Trip" onclick="addTrip()" /> <br /><br />

            <h2>Other Direct Costs</h2>

            <table id="otherCostsTable" border="1">
                <tr>
                    <th>Category</th>
                    <th>Year 1</th>
                    <th>Year 2</th>
                    <th>Year 3</th>
                    <th>Year 4</th>
                    <th>Year 5</th>
                </tr>
                <tr>
                    <td>Materials and supplies</td>
                    <td><input type="number" name="materialY1" min="0" /></td>
                    <td><input type="number" name="materialY2" min="0" /></td>
                    <td><input type="number" name="materialY3" min="0" /></td>
                    <td><input type="number" name="materialY4" min="0" /></td>
                    <td><input type="number" name="materialY5" min="0" /></td>
                </tr>
                <tr>
                    <td><5k small equipment</td>
                    <td><input type="number" name="smallEquipY1" min="0" /></td>
                    <td><input type="number" name="smallEquipY2" min="0" /></td>
                    <td><input type="number" name="smallEquipY3" min="0" /></td>
                    <td><input type="number" name="smallEquipY4" min="0" /></td>
                    <td><input type="number" name="smallEquipY5" min="0" /></td>
                </tr>
                <tr>
                    <td>Publication costs</td>
                    <td><input type="number" name="publicationY1" min="0" /></td>
                    <td><input type="number" name="publicationY2" min="0" /></td>
                    <td><input type="number" name="publicationY3" min="0" /></td>
                    <td><input type="number" name="publicationY4" min="0" /></td>
                    <td><input type="number" name="publicationY5" min="0" /></td>
                </tr>
                <tr>
                    <td>Computer services</td>
                    <td><input type="number" name="compServiceY1" min="0" /></td>
                    <td><input type="number" name="compServiceY2" min="0" /></td>
                    <td><input type="number" name="compServiceY3" min="0" /></td>
                    <td><input type="number" name="compServiceY4" min="0" /></td>
                    <td><input type="number" name="compServiceY5" min="0" /></td>
                </tr>
                <tr>
                    <td>Software</td>
                    <td><input type="number" name="softwareY1" min="0" /></td>
                    <td><input type="number" name="softwareY2" min="0" /></td>
                    <td><input type="number" name="softwareY3" min="0" /></td>
                    <td><input type="number" name="softwareY4" min="0" /></td>
                    <td><input type="number" name="softwareY5" min="0" /></td>
                </tr>
                <tr>
                    <td>Facility usage fees</td>
                    <td><input type="number" name="facilityFeeY1" min="0" /></td>
                    <td><input type="number" name="facilityFeeY2" min="0" /></td>
                    <td><input type="number" name="facilityFeeY3" min="0" /></td>
                    <td><input type="number" name="facilityFeeY4" min="0" /></td>
                    <td><input type="number" name="facilityFeeY5" min="0" /></td>
                </tr>
                <tr>
                    <td>Conference registration</td>
                    <td><input type="number" name="conferenceY1" min="0" /></td>
                    <td><input type="number" name="conferenceY2" min="0" /></td>
                    <td><input type="number" name="conferenceY3" min="0" /></td>
                    <td><input type="number" name="conferenceY4" min="0" /></td>
                    <td><input type="number" name="conferenceY5" min="0" /></td>
                </tr>
                <tr>
                    <td>Grad student tuition & health insurance</td>
                    <td><input type="number" name="gradHelpY1" min="0" /></td>
                    <td><input type="number" name="gradHelpY2" min="0" /></td>
                    <td><input type="number" name="gradHelpY3" min="0" /></td>
                    <td><input type="number" name="gradHelpY4" min="0" /></td>
                    <td><input type="number" name="gradHelpY5" min="0" /></td>
                </tr>
            </table>
            <input type="button" value="Add Direct Cost" onclick="addDirectCost()" /> <br /><br />
            
            

            <asp:Button ID="SubmitButton" runat="server" Text="Submit Budget" OnClick="SubmitButton_Click" />

        </div>
</asp:Content>
