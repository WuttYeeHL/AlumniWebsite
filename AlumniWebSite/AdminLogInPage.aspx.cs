using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminLogInPage : System.Web.UI.Page
{
    public static string con = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
    SqlConnection conn = new SqlConnection(con);
    string message;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void btnSingIn_Click1(object sender, EventArgs e)
    {
        try
        {
            string uname = txtName.Text;
            string pass = txtPassword.Text;
            conn.Open();
            string qur = "select * from Admins where UserName=@uname and Password=@pass";
            SqlCommand cmd = new SqlCommand(qur, conn);
            cmd.Parameters.AddWithValue("@uname", uname);
            cmd.Parameters.AddWithValue("@pass", pass);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Session["username"] = uname;
                Response.Redirect("~/Admin.aspx");
            }
            else
            {
                //Label1.Text = "UserName and Password is not correct. Try again..!!";
                message = "UserName and Password is not correct. Try again..!!";
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert",
                "alert('" + message + "');window.location ='AdminLogInPage.aspx';",
                true);
                
            }
            conn.Close();
            reader.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("GuestHomePage.aspx");
    }
}