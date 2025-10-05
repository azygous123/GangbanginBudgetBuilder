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

namespace FrontendSQLDev
{
    public partial class SetupInit : System.Web.UI.Page
    {
        string mainConnect = ConfigurationManager.ConnectionStrings["MySQLDB"].ConnectionString;
       


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TuitionPopulate();
            }
        }

        protected void DropDownListMain_SelectedIndexChanged(object sender, EventArgs e)
        {
            int CurrentSel = DropDownListMain.SelectedIndex;

            switch (CurrentSel)
            {
                case 0:
                    //Set Student Page Visibile all else invisible
                    PanelStudent.Visible = true;
                    PanelFaculty.Visible = false;
                    PanelTuition.Visible = false;
                    PanelTravel.Visible = false;
                    PanelInstitution.Visible = false;
                    break;
                case 1:
                    //Faculty
                    PanelStudent.Visible = false;
                    PanelFaculty.Visible = true;
                    PanelTuition.Visible = false;
                    PanelTravel.Visible = false;
                    PanelInstitution.Visible = false;

                    break;
                case 2:
                    //Tuition

                    break;
                case 3:
                    //Travel

                    break;
                case 4:
                    //Fringe

                    break;
                default:

                    break;
            }
        }

        private void TuitionPopulate()
        {
            //TBStudentFirst.Text = mainConnect;
            string sql = "SELECT TuitionID, Rate, ProgramName FROM tuition";
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
                    string desc = row["ProgramName"].ToString();
                    row["Display"] = "$"+ rate.ToString() + " " + desc.ToString();//$"{desc} - ${rate:N2}";
                }

                DDStudentTuition.DataSource = tuitionTable;
                DDStudentTuition.DataTextField = "Display";
                DDStudentTuition.DataValueField = "TuitionID";
                DDStudentTuition.DataBind();


            }



        }

















    }
}