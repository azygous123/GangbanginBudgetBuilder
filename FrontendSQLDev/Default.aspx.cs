using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Web.UI.WebControls.WebParts;
using System.Data;
//using MongoDB.Driver.Core.Configuration;

namespace FrontendSQLDev
{
    

    public partial class _Default : Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MySQLDB"].ConnectionString;
       
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //populate the GridView
            Response.Write("<p>ConnectionString in use: " + connectionString + "</p>");
            string sql = "SELECT * FROM student";
            //Read command
            using (MySqlConnection connectionMain = new MySqlConnection(connectionString)) //It Crashed Here
            using (MySqlCommand commandMain = new MySqlCommand(sql, connectionMain))
            using (MySqlDataAdapter adapter = new MySqlDataAdapter(commandMain))
            {
                DataTable studentdt = new DataTable();
                adapter.Fill(studentdt);
                GridView1.DataSource = studentdt;
                GridView1.DataBind();


            }


           /* using (MySqlConnection connectionMain = new MySqlConnection(connectionString))
            { //do queries to MySql from inside here...
               



                // Main Focus is builind

               
                using (MySqlCommand commandMain = new MySqlCommand(sql, connectionMain))
                {//fill fields from c# data into SQL query
                   // commandMain.Parameters.AddWithValue("@FirstName", TextBox1.Text.ToString());
                   // commandMain.Parameters.AddWithValue("@LastName", TextBox2.Text.ToString());

                    commandMain.ExecuteNonQuery();
                    GridView1.

                }
            }*/



        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userName = "";
            userName += TextBox1.Text + " " + TextBox2.Text; // makes name

            Label1.Text = "Welcome... " + userName;

           

            

            using (MySqlConnection connectionMain = new MySqlConnection(connectionString))
            { //do queries to MySql from inside here...
                connectionMain.Open();

              
                
                // Main Focus is builind
                
                string sql = "INSERT INTO budget_system.Students (FirstName, LastName) VALUES (@FirstName, @LastName)";
                using (MySqlCommand commandMain = new MySqlCommand(sql, connectionMain))
                {//fill fields from c# data into SQL query
                    commandMain.Parameters.AddWithValue("@FirstName", TextBox1.Text.ToString());
                    commandMain.Parameters.AddWithValue("@LastName", TextBox2.Text.ToString());

                    commandMain.ExecuteNonQuery();

                }
            }
            TextBox1.Text = ""; TextBox2.Text = ""; //clears the textboxes
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}