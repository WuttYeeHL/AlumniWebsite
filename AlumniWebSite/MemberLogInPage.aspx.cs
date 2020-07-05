using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewLogIn : System.Web.UI.Page
{
    public static string con = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
    SqlConnection conn = new SqlConnection(con);
    string message;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }   

    protected void btnLogin_Click1(object sender, EventArgs e)
    {
        try
        {
            string uname = txtRollNo.Text;
            string pass = txtPassword.Text;

            conn.Open();
            string qur = "select count(*) from Registers where RollNo=@rollno and Password=@pass";
            SqlCommand cmd = new SqlCommand(qur, conn);
            cmd.Parameters.AddWithValue("@rollno", uname);
            cmd.Parameters.AddWithValue("@pass", pass);
            int i = (int)cmd.ExecuteScalar();
            conn.Close();
            //SqlDataReader reader = cmd.ExecuteReader();
            if (i > 0)
            {
                Session["username"] = uname;
                Response.Redirect("~/MemberHomePage.aspx");
            }
            else if (i == 0)
            {
                conn.Open();
                string qur2 = "select count(*) from Admins where UserName=@username and Password=@pass";
                SqlCommand cmd2 = new SqlCommand(qur2, conn);
                cmd2.Parameters.AddWithValue("@username", uname);
                cmd2.Parameters.AddWithValue("@pass", pass);
                int j = (int)cmd2.ExecuteScalar();
                conn.Close();
                //SqlDataReader reader = cmd.ExecuteReader();
                if (j > 0)
                {
                    Session["username"] = uname;
                    Response.Redirect("~/Default2.aspx");
                }
            }

            else
            {
                message = "UserName and Password is not correct. Try again..!!";
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert",
                "alert('" + message + "');window.location ='MemberLogInPage.aspx';",
                true);
                //lblSignIn.Text = "UserName and Password is not correct. Try again..!!";
                //txtName.Text = "";
                //txtPassword.Text = "";
                //txtName.Focus();
            }
            conn.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
         //try
        //{

        string rollno = txtSignupRollNo.Text;
            string pass = txtSignUpPassword.Text;
            string confirmpass = txtSignUpConfirm.Text;
            
            conn.Open();

            //student is exist?
                string qur = "select RollNo from Students where RollNo=@rollno";
                SqlCommand cmd = new SqlCommand(qur, conn);
                cmd.Parameters.AddWithValue("@rollno", rollno);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                conn.Close();
                if(dt.Rows.Count > 0 )
                {
                    conn.Open();
                    string qur1 = "select RollNo from Registers where RollNo=@rno";
                    SqlCommand cmd1 = new SqlCommand(qur1,conn);
                    cmd1.Parameters.AddWithValue("@rno", rollno);
                    SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    if (dt1.Rows.Count > 0)
                    {
                        message = "User is already register..!!";
                        //lblSignup.Text = "User is already register.";
                        txtRollNo.Text = "";
                        txtSignUpPassword.Text = "";
                        txtSignUpConfirm.Text = "";
                    }
                    /*if (k > 0)
                    //SqlDataAdapter da = new SqlDataAdapter(cmd1);
                    //DataTable dt = new DataTable();
                    //da.Fill(dt);
                    //if(dt.Rows.Count > 0 )
                    }
                /*string qur = "select count(*) from Students where RollNo=@rollno";
                SqlCommand cmd = new SqlCommand(qur, conn);
                cmd.Parameters.AddWithValue("@rollno", rollno);
                int j =(int) cmd.ExecuteScalar();
                conn.Close();
                if (j>0)
                {
                    //already exit?
                    conn.Open();
                    string qur1 = "select count(*) from Registers where RollNo=@rno";
                    SqlCommand cmd1 = new SqlCommand(qur1,conn);
                    cmd.Parameters.AddWithValue("@rno", rollno);
                    int k = (int)cmd1.ExecuteScalar();
                    SqlDataReader reader = cmd1.ExecuteReader();*/
                    /*if (k > 0)
                    //SqlDataAdapter da = new SqlDataAdapter(cmd1);
                    //DataTable dt = new DataTable();
                    //da.Fill(dt);
                    //if(dt.Rows.Count > 0 )
                    {
                        message = "User is already register..!!";
                        //lblSignup.Text = "User is already register.";
                        txtRollNo.Text = "";
                        txtSignUpPassword.Text = "";
                        txtSignUpConfirm.Text = "";
                    }*/
                    else
                    {
                        string qur2 = "insert into Registers values(@rollno,@pass)";
                        SqlCommand cmd2 = new SqlCommand(qur2, conn);
                        cmd2.Parameters.AddWithValue("@rollno", rollno);
                        cmd2.Parameters.AddWithValue("@pass", pass);
                        int i = cmd2.ExecuteNonQuery();
                        if (i > 0)
                        {
                            message = "Sign Up Success..!!";
                            //lblSignup.Text = "Sign Up Success..!!";
                        }
                        txtRollNo.Text = "";
                        txtSignUpPassword.Text = "";
                        txtSignUpConfirm.Text = "";
                        //txtRollNo.Focus();
                    }
                conn.Close();
                
            }
            else
            {
                message = "UserName doesn't correct. Try again..!!";
                //lblSignup.Text = "UserName doesn't correct. Try again..!!";
                txtRollNo.Text = "";
                txtSignUpPassword.Text = "";
                txtSignUpConfirm.Text = "";
                //txtRollNo.Focus();
            }
            conn.Close();
            //Show the message and then redirect
            ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert",
                "alert('" + message + "');window.location ='MemberLogInPage.aspx';",
                true);
            
        //}
        //catch (Exception ex)
        //{
        //    Response.Write(ex.Message);
        //}
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("MemberLogInPage.aspx");
    }
}