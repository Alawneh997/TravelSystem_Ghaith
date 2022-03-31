using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelSystem_Ghaith.Registration
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        private SqlCommand cmd = new SqlCommand();
        private SqlConnection conn = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.ConnectionString = "Data source=OSAMA-LAPTOP;initial catalog=TravelSystem_Ghaith;integrated Security=true";
            conn.Open();

        }

        protected void OK_Click(object sender, EventArgs e)
        {
           

            SqlCommand cmd = new SqlCommand("Register", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Civil", Civil.Text);
            cmd.Parameters.AddWithValue("@FullName", Full.Text);
            cmd.Parameters.AddWithValue("@Email", Email.Text);
            cmd.Parameters.AddWithValue("@Password", Pass.Text);
            cmd.Parameters.AddWithValue("@Address", Address.Text);
            cmd.Parameters.AddWithValue("@Age", Age.Text);
            cmd.Parameters.AddWithValue("@Phonenumber", Phonenumber.Text);
            cmd.Parameters.AddWithValue("@UserType", "NORMAL");
            //cmd.ExecuteNonQuery();
            var da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows[0].Field<int>("ERRORCode") == -1)
                Response.Write(ds.Tables[0].Rows[0].Field<string>("ERRORMessage"));
            else
            {
                DataRow UserData = ds.Tables[1].Rows[0];
                Session["ID"] = UserData["U_ID"].ToString();
                Session["UserData"] = UserData;
                Response.Redirect("~/defaultUser.aspx");
                    
                    
            }
        }
    }
}