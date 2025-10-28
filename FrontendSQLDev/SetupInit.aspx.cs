using MySql.Data.MySqlClient;
using Org.BouncyCastle.Pqc.Crypto.Utilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace FrontendSQLDev
{
    public partial class SetupInit : System.Web.UI.Page
    {
        string mainConnect = ConfigurationManager.ConnectionStrings["MySQLDB"].ConnectionString;
        private DataTable Temp
        {
            get { return (DataTable)ViewState["TempTuition"]; }
            set { ViewState["TempTuition"] = value; }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //first time the page has loaded
            {
                LoadCountries();
                LoadStates();
                LoadTravel();
                LoadInstitutions();

                string setup = Request.QueryString["val"];
                if (!string.IsNullOrEmpty(setup))
                {
                    switch (int.Parse(setup))
                    {
                        case 0:
                            //Set Student Panel Visibile all else invisible
                            TuitionPopulate();
                            DropDownListMain.SelectedIndex = 0;
                            PanelStudent.Visible = true;
                            PanelFaculty.Visible = false;
                            PanelTuition.Visible = false;
                            PanelTravel.Visible = false;
                            PanelInstitution.Visible = false;
                            PanelFringe.Visible = false;
                            break;
                        case 1:
                            //Faculty
                            DropDownListMain.SelectedIndex = 1;
                            PanelStudent.Visible = false;
                            PanelFaculty.Visible = true;
                            PanelTuition.Visible = false;
                            PanelTravel.Visible = false;
                            PanelInstitution.Visible = false;
                            PanelFringe.Visible = false;
                            break;
                        case 2:
                            //Tuition
                            DropDownListMain.SelectedIndex = 2;
                            PanelStudent.Visible = false;
                            PanelFaculty.Visible = false;
                            PanelTuition.Visible = true;
                            PanelTravel.Visible = false;
                            PanelInstitution.Visible = false;
                            PanelFringe.Visible = false;
                            break;
                        case 3:
                            //Travel
                            DropDownListMain.SelectedIndex = 3;
                            PanelStudent.Visible = false;
                            PanelFaculty.Visible = false;
                            PanelTuition.Visible = false;
                            PanelTravel.Visible = true;
                            PanelInstitution.Visible = false;
                            PanelFringe.Visible = false;
                            break;
                        case 4:
                            //Institution
                            DropDownListMain.SelectedIndex = 4;
                            PanelStudent.Visible = false;
                            PanelFaculty.Visible = false;
                            PanelTuition.Visible = false;
                            PanelTravel.Visible = false;
                            PanelInstitution.Visible = true;
                            PanelFringe.Visible = false;
                            break;
                        case 5:
                            //Fringe
                            DropDownListMain.SelectedIndex = 5;
                            PanelStudent.Visible = false;
                            PanelFaculty.Visible = false;
                            PanelTuition.Visible = false;
                            PanelTravel.Visible = false;
                            PanelInstitution.Visible = false;
                            PanelFringe.Visible = true;
                            break;
                        default:

                            break;
                    }

                }
            }
        }

        protected void DropDownListMain_SelectedIndexChanged(object sender, EventArgs e)
        {
            int CurrentSel = DropDownListMain.SelectedIndex;

            switch (CurrentSel)
            {
                case 0:
                    //Set Student Panel Visibile all else invisible
                    TuitionPopulate();

                    PanelStudent.Visible = true;
                    PanelFaculty.Visible = false;
                    PanelTuition.Visible = false;
                    PanelTravel.Visible = false;
                    PanelInstitution.Visible = false;
                    PanelFringe.Visible = false;
                    break;
                case 1:
                    //Faculty
                    PanelStudent.Visible = false;
                    PanelFaculty.Visible = true;
                    PanelTuition.Visible = false;
                    PanelTravel.Visible = false;
                    PanelInstitution.Visible = false;
                    PanelFringe.Visible = false;
                    break;
                case 2:
                    //Tuition
                    PanelStudent.Visible = false;
                    PanelFaculty.Visible = false;
                    PanelTuition.Visible = true;
                    PanelTravel.Visible = false;
                    PanelInstitution.Visible = false;
                    PanelFringe.Visible = false;
                    break;
                case 3:
                    //Travel
                    PanelStudent.Visible = false;
                    PanelFaculty.Visible = false;
                    PanelTuition.Visible = false;
                    PanelTravel.Visible = true;
                    PanelInstitution.Visible = false;
                    PanelFringe.Visible = false;
                    break;
                case 4:
                    //Institution
                    PanelStudent.Visible = false;
                    PanelFaculty.Visible = false;
                    PanelTuition.Visible = false;
                    PanelTravel.Visible = false;
                    PanelInstitution.Visible = true;
                    PanelFringe.Visible = false;
                    break;
                case 5:
                    //Fringe
                    PanelStudent.Visible = false;
                    PanelFaculty.Visible = false;
                    PanelTuition.Visible = false;
                    PanelTravel.Visible = false;
                    PanelInstitution.Visible = false;
                    PanelFringe.Visible = true;
                    break;
                default:

                    break;
            }
        }

        private void TuitionPopulate()
        {
            //TBStudentFirst.Text = mainConnect;
            string sql = "SELECT Amount, Type, Year, InState, Graduate FROM Tuition";
            //Read command
            using (MySqlConnection connectionMain = new MySqlConnection(mainConnect)) 
            using (MySqlCommand commandMain = new MySqlCommand(sql, connectionMain))
            using (MySqlDataAdapter adapter = new MySqlDataAdapter(commandMain))
            {
                DataTable tuitionTable = new DataTable();
                adapter.Fill(tuitionTable);
                int TuitionID = 0;
                tuitionTable.Columns.Add("Display", typeof(string));
                tuitionTable.Columns.Add("TuitionID", typeof(int));
                foreach (DataRow row in tuitionTable.Rows)
                {
                    string year = row["Year"].ToString();
                    tuitionTable.Rows[TuitionID]["TuitionID"] = TuitionID;
                    string InState;
                    if (Convert.ToBoolean(row["InState"]) == true)
                    {
                        InState = "In-State";
                    }
                    else
                    {
                        InState = "Out-of-State";
                    }
                    string Graduate;
                    if (Convert.ToBoolean(row["Graduate"]) == true)
                    {
                        Graduate = "Graduate";
                    }
                    else
                    {
                        Graduate = "Undergraduate";
                    }
                    decimal rate = Convert.ToDecimal(row["Amount"]);
                    string desc = row["Type"].ToString(); 
                    row["Display"] = "$"+ rate.ToString() + " " + desc.ToString() + " " + InState + " " + Graduate + " " + year;//$"{desc} - ${rate:N2}";
                }

                Temp = tuitionTable;
                StuProgram.DataSource = tuitionTable;
                StuProgram.DataTextField = "Display"; //augmented Display showing all info as one line
                StuProgram.DataValueField = "TuitionID"; //augmented a TuitionID so we can pass back the values based on that
                StuProgram.DataBind();
                


            }



        }

        /*private void TravelPopulate()
        {
            //TBStudentFirst.Text = mainConnect;
            string sql = "SELECT TravelID, Rate, Description FROM travelprofile";
            //Read command
            using (MySqlConnection connectionMain = new MySqlConnection(mainConnect)) //It Crashed Here
            using (MySqlCommand commandMain = new MySqlCommand(sql, connectionMain))
            using (MySqlDataAdapter adapter = new MySqlDataAdapter(commandMain))
            {
                DataTable tuitionTable = new DataTable();
                adapter.Fill(tuitionTable);
                tuitionTable.Columns.Add("Display", typeof(string));
                foreach (DataRow row in tuitionTable.Rows)
                {
                    
                    decimal rate = Convert.ToDecimal(row["Rate"]);
                    string desc = row["Description"].ToString();
                    row["Display"] = "$" + rate.ToString() + " " + desc.ToString();//$"{desc} - ${rate:N2}";
                }
               // DDStudentTravel.DataSource = tuitionTable;
              //  DDStudentTravel.DataTextField = "Display";
              //  DDStudentTravel.DataValueField = "TravelID";
               // DDStudentTravel.DataBind();
            }
        }*/

        protected void TuiSubmit_Click(object sender, EventArgs e)
        {
            //Insert Validation Here

            //If Valid Insert into Database
            using (MySqlConnection conn = new MySqlConnection(mainConnect))
            {
                string sql = "INSERT INTO Tuition (Amount, Type, Year, InState, Graduate) VALUES (@amount, @type, @year, @instate, @graduate)";

                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@amount", decimal.Parse(TuiAmount.Text));
                cmd.Parameters.AddWithValue("@type", TuiType.Text);
                cmd.Parameters.AddWithValue("@year", int.Parse(TuiYear.Text));
                cmd.Parameters.AddWithValue("@instate", (TuiInState.Checked));
                cmd.Parameters.AddWithValue("@graduate", (TuiGraduate.Checked));

                conn.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("SetupInit.aspx?val=2");
            }
        }

        protected void InstSubmit_Click(object sender, EventArgs e)
        {
            //Insert Validation Here

            //If Valid Insert into Database
            using (MySqlConnection conn = new MySqlConnection(mainConnect))
            {
                string sql = "INSERT INTO Institution (Name, Campus, City, State, Country, FARate) VALUES (@name, @campus, @city, @state, @country, @farate)";                 

                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@name", InstName.Text);
                cmd.Parameters.AddWithValue("@campus", InstCampus.Text);
                cmd.Parameters.AddWithValue("@city", InstCity.Text);
                cmd.Parameters.AddWithValue("@state", InstState.Text);
                cmd.Parameters.AddWithValue("@country", InstCountry.Text);
                cmd.Parameters.AddWithValue("@farate", decimal.Parse(InstFARate.Text));

                conn.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("SetupInit.aspx?val=4");
            }
        }

        protected void TrvSubmit_Click(object sender, EventArgs e)
        {
            //Insert Validation Here

            //If Valid Insert into Database
            using (MySqlConnection conn = new MySqlConnection(mainConnect))
            {
                string sql = "INSERT INTO Travel (Mode, Year, City, State, Country, IsForeign, Amount) VALUES (@mode, @year, @city, @state, @country, @isforeign, @amount)";           

                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@mode", TrvMode.Text);
                cmd.Parameters.AddWithValue("@year", int.Parse(TrvYear.Text));
                cmd.Parameters.AddWithValue("@city", TrvCity.Text);
                cmd.Parameters.AddWithValue("@country", TrvCountry.Text);

                //If foreign use country else use state
                string state = TrvState.Text;
                if (TrvForeign.Checked)
                {
                    state = TrvCountry.Text;
                }

                cmd.Parameters.AddWithValue("@state",state);
                
                cmd.Parameters.AddWithValue("@isforeign", (TrvForeign.Checked));
                cmd.Parameters.AddWithValue("@amount", decimal.Parse(TrvAmount.Text));

                conn.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("SetupInit.aspx?val=3");
            }
        }

        protected void FringeSubmit_Click(object sender, EventArgs e)
        {
            //Insert Validation Here

            //If Valid Insert into Database
            using (MySqlConnection conn = new MySqlConnection(mainConnect))
            {
                string sql = "INSERT INTO Fringe (InstitutionID, Type, Year, Val) VALUES (@institutionid, @type, @year, @val)";

                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@institutionid", int.Parse(FringeInst.SelectedValue));
                cmd.Parameters.AddWithValue("@type", FringeType.Text);
                cmd.Parameters.AddWithValue("@year", int.Parse(FringeYear.Text));
                cmd.Parameters.AddWithValue("@val", decimal.Parse(FringeVal.Text));


                conn.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("SetupInit.aspx?val=5");
            }
        }

        protected void FacSub_Click(object sender, EventArgs e)
        {
            //Insert Validation Here

            //If Valid Insert into Database
            using (MySqlConnection conn = new MySqlConnection(mainConnect))
            {
                string sql = "INSERT INTO Faculty (Name_First, Name_Last, Salary, Hourly, StaffType) VALUES (@namefirst, @namelast, @salary, @hourly, @stafftype)";

                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@namefirst", FacFirstName.Text);
                cmd.Parameters.AddWithValue("@namelast", FacLastName.Text); 
                cmd.Parameters.AddWithValue("@salary", decimal.Parse(FacSalary.Text));
                cmd.Parameters.AddWithValue("@hourly", FacHourly.Checked);
                cmd.Parameters.AddWithValue("@stafftype", FacType.Text);

                conn.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("SetupInit.aspx?val=1");
            }
        }

        protected void StuSubmit_Click(object sender, EventArgs e)
        {
            int selectedIndex = StuProgram.SelectedIndex;
            DataRow selectedRow = Temp.Rows[selectedIndex];

            decimal amount = Convert.ToDecimal(selectedRow["Amount"]);
            string type = selectedRow["Type"].ToString();
            string year = selectedRow["Year"].ToString();
            bool inState = Convert.ToBoolean(selectedRow["InState"]);
            bool graduate = Convert.ToBoolean(selectedRow["Graduate"]);

            //Insert Validation Here

            //If Valid Insert into Database
            using (MySqlConnection conn = new MySqlConnection(mainConnect))
            {
                string sql = "INSERT INTO Student (Name_First, Name_Last, Type, Year, InState, Graduate, Stipend, Salary, Hourly) VALUES (@namefirst, @namelast, @type, @year, @instate, @graduate, @stipend, @salary, @hourly)";

                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@namefirst", StuFirst.Text);
                cmd.Parameters.AddWithValue("@namelast", StuLast.Text);
                cmd.Parameters.AddWithValue("@type", type);
                cmd.Parameters.AddWithValue("@year", int.Parse(year));
                cmd.Parameters.AddWithValue("@instate", inState);
                cmd.Parameters.AddWithValue("@graduate", graduate);





                //cmd.Parameters.AddWithValue("@type", StuProgram.Text);
                //cmd.Parameters.AddWithValue("@year", int.Parse(StuYear.Text));
                //cmd.Parameters.AddWithValue("@instate", (StuInState.Checked));
                //We need to pull the data in from the database

                cmd.Parameters.AddWithValue("@stipend", -1);
                cmd.Parameters.AddWithValue("@salary", -1);
                cmd.Parameters.AddWithValue("@hourly", -1);



                conn.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("SetupInit.aspx?val=0");
            }
        }

        private void LoadCountries()
        {
            string filePath = Server.MapPath("~/App_Data/countries.xml");
            XDocument doc = XDocument.Load(filePath);

            TrvCountry.Items.Clear();
            InstCountry.Items.Clear();
            TrvCountry.Items.Add("Select a country"); // index 0
            InstCountry.Items.Add("Select a country"); // index 0

            // Loop through each <country> element
            foreach (XElement country in doc.Descendants("country"))
            {
                string name = country.Value; 
                TrvCountry.Items.Add(new ListItem(name));
                InstCountry.Items.Add(new ListItem(name));
            }
        }

        private void LoadStates()
        {
            string filePath = Server.MapPath("~/App_Data/states.xml");
            XDocument doc = XDocument.Load(filePath);
            TrvState.Items.Clear();
            InstState.Items.Clear();
            TrvState.Items.Add("Select a state"); // index 0
            InstState.Items.Add("Select a state"); // index 0
            // Loop through each <state> element
            foreach (XElement state in doc.Descendants("state"))
            {
                string name = state.Value;
                TrvState.Items.Add(new ListItem(name));
                InstState.Items.Add(new ListItem(name));
            }
        }

        private void LoadTravel()
        {
            string filePath = Server.MapPath("~/App_Data/travelmodes.xml");
            XDocument doc = XDocument.Load(filePath);
            TrvMode.Items.Clear();
            TrvMode.Items.Add("Select a travel mode"); // index 0
            // Loop through each <mode> element
            foreach (XElement mode in doc.Descendants("mode"))
            {
                string name = mode.Value;
                TrvMode.Items.Add(new ListItem(name));
            }
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
                FringeInst.DataSource = institutionTable;
                FringeInst.DataTextField = "Name";
                FringeInst.DataValueField = "InstitutionID";
                FringeInst.DataBind();
            }

        }


        protected void TrvForeign_CheckedChanged(object sender, EventArgs e)
        {
            if (TrvForeign.Checked)
            {
                TrvState.Visible = false;
                TrvStateLbl.Visible = false;
            }
            else
            {
                TrvState.Visible = true;
                TrvStateLbl.Visible = true;
            }
        }
    }
}