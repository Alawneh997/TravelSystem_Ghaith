using log4net.Config;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelSystem_Ghaith.Registration
{
    public partial class Login : System.Web.UI.Page
    {
        private static log4net.ILog log;

        protected void Page_Load(object sender, EventArgs e)
        {
            string path = AppDomain.CurrentDomain.BaseDirectory + "Logs\\";
            Directory.CreateDirectory(path);

            log4net.GlobalContext.Properties["LogFileName"] = path + "Fruit_Log";
            //XmlConfigurator.Configure();

            FileInfo _fileinfo = new System.IO.FileInfo(AppDomain.CurrentDomain.BaseDirectory + "log4net.config");
            XmlConfigurator.ConfigureAndWatch(_fileinfo);

            log = log4net.LogManager.GetLogger("LogFileDigitalPrint");
        }

       
        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {
                string co = ConfigurationManager.ConnectionStrings["GH"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(co))
                {
                    conn.Open();
                    SqlCommand sess = new SqlCommand("LoginPRO", conn);
                    //SqlCommand UserType = new SqlCommand("User_Type", conn);
                    sess.CommandType = System.Data.CommandType.StoredProcedure;
                    sess.Parameters.AddWithValue("@Email", Email.Text);
                    sess.Parameters.AddWithValue("@Password", Password.Text);

                    var da = new SqlDataAdapter(sess);
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows[0].Field<int>("ERRORCode") == -1 || ds.Tables[0].Rows[0].Field<int>("ERRORCode") == -2)
                        Response.Write(ds.Tables[0].Rows[0].Field<string>("ERRORMessage"));
                    else
                    {
                        DataRow UserData = ds.Tables[1].Rows[0];
                        Session["ID"] = UserData["U_ID"].ToString();
                        Session["UserData"] = UserData;

                        string usertype = UserData["User_Type"].ToString();

                        if (usertype.Equals("ADMIN"))
                        {
                            Response.Redirect("~/default.aspx");
                        }
                        else { Response.Redirect("~/defaultUser.aspx"); }
                    }



                }

            }
            catch (Exception exception)
            {
                Response.Write("Email or Password does not correct");

            }

        }
    }
}