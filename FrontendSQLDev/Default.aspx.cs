using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
//using MongoDB.Driver.Core.Configuration;

namespace FrontendSQLDev
{


    public partial class _Default : Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MySQLDB"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            int CurrentSel = DropDownListMain.SelectedIndex;
            string sql = "Select * From Tuition";
            using (MySqlConnection connectionMain = new MySqlConnection(connectionString))
            using (MySqlCommand commandMain = new MySqlCommand(sql, connectionMain))
            using (MySqlDataAdapter adapter = new MySqlDataAdapter(commandMain))
            {
                DataTable tuitionTable = new DataTable();
                adapter.Fill(tuitionTable);



                GridView1.DataSource = tuitionTable;
                GridView1.DataBind();

            }

        }


        protected void DropDownListMain_SelectedIndexChanged(object sender, EventArgs e)
        {
            int CurrentSel = DropDownListMain.SelectedIndex;
            string sql = "Select * From ";

            switch (CurrentSel)
            {
                case 0:
                    //Set Student Panel Visibile all else invisible
                    sql += "Student";
                    break;
                case 1:
                    //Faculty
                    sql += "Faculty";
                    break;
                case 2:
                    //Tuition
                    sql += "Tuition";
                    break;
                case 3:
                    //Travel
                    sql += "Travel";
                    break;
                case 4:
                    //Institution
                    sql += "Institution";

                    break;
                case 5:
                    //Fringe
                    sql += "Fringe";
                    break;
                default:
                    sql += "Budget";
                    break;
            }

            using (MySqlConnection connectionMain = new MySqlConnection(connectionString))
            using (MySqlCommand commandMain = new MySqlCommand(sql, connectionMain))
            using (MySqlDataAdapter adapter = new MySqlDataAdapter(commandMain))
            {
                DataTable tuitionTable = new DataTable();
                adapter.Fill(tuitionTable);



                GridView1.DataSource = tuitionTable;
                GridView1.DataBind();

            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }

    
}
