using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontendSQLDev
{
    public partial class Builder : System.Web.UI.Page
    {
        string mainConnect = ConfigurationManager.ConnectionStrings["MySQLDB"].ConnectionString;
        int CurrPage = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // I need to sort out the logic here... 
                Session["curPage"] = 0;

                // Default state when page first loads
                Panel1.Visible = true;
                StartPanel.Visible = true;
                Panel2.Enabled = false;
                EmpoloyeePanel.Visible = false;
                Panel3.Enabled = false;
                TravelPanel.Visible = false;
                Panel4.Enabled = false;
                OtherPanel.Visible = false;
                Panel5.Enabled = false;
                Back1.Enabled = false;
                PopulateFaculty();
                LoadInstitutions();
            }
            else
            {
                // Reapply based on selected index on postback
                UpdateYearPanels(DropDownList1.SelectedIndex);
            }
        }
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
             
                            

        }

        private void UpdateYearPanels(int selectedIndex)
        {
            //Panel1.Visible = selectedIndex >= 0;
            Panel2.Enabled = selectedIndex >= 1;
            Panel3.Enabled = selectedIndex >= 2;
            Panel4.Enabled = selectedIndex >= 3;
            Panel5.Enabled = selectedIndex >= 4;
           
        }

        protected void onSubmit(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateYearPanels(DropDownList1.SelectedIndex);           

        }

        private void LoadInstitutions()
        {
            string sql = "SELECT InstitutionID, Name FROM Institution";

            using (MySqlConnection connectionMain = new MySqlConnection(mainConnect))
            using (MySqlCommand commandMain = new MySqlCommand(sql, connectionMain))
            using (MySqlDataAdapter adapter = new MySqlDataAdapter(commandMain))
            {
                DataTable institutionTable = new DataTable();
                adapter.Fill(institutionTable);
                InstitutionDropdown.DataSource = institutionTable;
                InstitutionDropdown.DataTextField = "Name";
                InstitutionDropdown.DataValueField = "InstitutionID";
                InstitutionDropdown.DataBind();
            }

        }

        private void PopulateFaculty()
        {
            string sql = "SELECT FacultyID, Name_First, Name_Last FROM Faculty WHERE StaffType='Faculty' OR StaffType='Post Doc'";
            using (MySqlConnection connectionMain = new MySqlConnection(mainConnect))
            using (MySqlCommand commandMain = new MySqlCommand(sql, connectionMain))
            using (MySqlDataAdapter adapter = new MySqlDataAdapter(commandMain))
            {
                DataTable Faculty = new DataTable();
                adapter.Fill(Faculty);
                Faculty.Columns.Add("Display", typeof(string));
         
                foreach (DataRow row in Faculty.Rows)
                {
                    string firstname = row["Name_First"].ToString();
                    string lastname = row["Name_Last"].ToString();
                    
                    row["Display"] = firstname.ToString() + " " + lastname.ToString();
                }

                PiName.DataTextField = "Display";   
                PiName.DataValueField = "FacultyID";
                PiName.DataSource = Faculty;
                PiName.DataBind();
                

            }

        }

        protected void Next1_Click(object sender, EventArgs e)
        {
            //consider the query string
            int pageIndex;
            pageIndex = (int)Session["curPage"];
            switch(pageIndex)
            {
                case 0:
                    StartPanel.Visible = false;
                    EmpoloyeePanel.Visible = true;
                    Back1.Enabled = true;
                    Session["curPage"] = 1;
                    break;
                case 1:
                    EmpoloyeePanel.Visible = false;
                    TravelPanel.Visible = true;
                    Session["curPage"] = 2;
                    break;
                case 2:
                    TravelPanel.Visible = false;
                    OtherPanel.Visible = true;
                    Session["curPage"] = 3;
                    Next1.Enabled = false;
                    break;
                default:
                    break;
            }

        }

        protected void Back1_Click(object sender, EventArgs e)
        {
            int pageIndex; 
            pageIndex = (int)Session["curPage"];
            switch(pageIndex) {
                case 1:
                    StartPanel.Visible = true;
                    EmpoloyeePanel.Visible = false;
                    Back1.Enabled = false;
                    Session["curPage"] = 0;
                    break;
                case 2:
                    EmpoloyeePanel.Visible = true;
                    TravelPanel.Visible = false;
                    Session["curPage"] = 1;
                    break;
                case 3:
                    TravelPanel.Visible = true;
                    OtherPanel.Visible = false;
                    Session["curPage"] = 2;
                    Next1.Enabled = true;
                    break;
                default:
                    break;
            }
        }
    }
}