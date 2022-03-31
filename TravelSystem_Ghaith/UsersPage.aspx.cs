using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelSystem_Ghaith
{
    public partial class UsersPage : System.Web.UI.Page
    {
        private SqlCommand cmd = new SqlCommand();
        SqlConnection conn = new SqlConnection();


        protected void Page_Load(object sender, EventArgs e)
        {
            
            conn.ConnectionString = "Data source=OSAMA-LAPTOP;initial catalog=TravelSystem_Ghaith;integrated Security=true";
            

            

        SqlCommand cmd = new SqlCommand("UserTable", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            conn.Open();
            
            var da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
    }
}