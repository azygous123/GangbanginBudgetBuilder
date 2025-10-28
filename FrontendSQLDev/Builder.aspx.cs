using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontendSQLDev
{
    public partial class Builder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Read all not row inputs
            string projTitle = ProjectTitle.Text;
            string fundingSource = FundingSource.Text;
            string institution = InstitutionDropdown.Text;
            string startDate = StartDate.Text;
            string endDate = EndDate.Text;

            // Read all employee inputs
            string[] names = Request.Form.GetValues("name[]") ?? new string[0];
            string[] roles = Request.Form.GetValues("role[]") ?? new string[0];
            string[] hourlyRates = Request.Form.GetValues("hourlyRate[]") ?? new string[0];
            string[] hoursY1 = Request.Form.GetValues("hoursY1[]") ?? new string[0];
            string[] hoursY2 = Request.Form.GetValues("hoursY2[]") ?? new string[0];
            string[] hoursY3 = Request.Form.GetValues("hoursY3[]") ?? new string[0];
            string[] hoursY4 = Request.Form.GetValues("hoursY4[]") ?? new string[0];
            string[] hoursY5 = Request.Form.GetValues("hoursY5[]") ?? new string[0];

            // Read all travel inputs
            string[] destinations = Request.Form.GetValues("destination[]") ?? new string[0];
            string[] durations = Request.Form.GetValues("duration[]") ?? new string[0]; ;
            string[] domestic = Request.Form.GetValues("domestic[]") ?? new string[0]; 
            string[] year = Request.Form.GetValues("year[]") ?? new string[0];

            string output = "";
            // Example: just print to console (or handle Excel export)

            output += $"Title: {projTitle}<br/>";
            output += $"Funding source: {fundingSource}<br/>";
            output += $"Institution: {institution}<br/>";
            output += $"Project Start and End Dates: {startDate} - {endDate}";

            int piIndex = Array.IndexOf(roles, "PI");

            output += $"PI: {names[piIndex]} <br/>";

            var coPIsIndexes = roles
                .Select((role, index) => new { role, index })
                .Where(x => x.role == "Co-PI")
                .Select(x => x.index)
                .ToList();

            output += $"CoPIs: ";
            for (int i = 0; i < coPIsIndexes.Count; i++)
            {
                output += $"{names[coPIsIndexes[i]]}, ";
            }

            output += $"<br/>Employees:<br/>";
            for (int i = 0; i < names.Length; i++)
            {
                output += $"Name: {names[i]}, Role: {roles[i]}, Y1: {hoursY1[i]}, Y2: {hoursY2[i]}, Y3: {hoursY3[i]}, Y4: {hoursY4[i]}, Y5: {hoursY5[i]}<br/>";
            }

            output += $"Planned Trips:<br/>";
            for(int i = 0; i < destinations.Length; i++)
            {
                bool isDomestic = (i < domestic.Length && domestic[i] == "on");
                string type = isDomestic ? "Domestic" : "International";
                output += $"Destination: {destinations[i]}, Duration: {durations[i]} days, {type}, Year: {year[i]}<br/>";
            }

            OutputLiteral.Text = output;


        }

        protected void onSubmit(object sender, EventArgs e)
        {

        }
    }
}