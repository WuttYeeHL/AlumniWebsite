using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class StudentProfile : System.Web.UI.Page
{
    public static string connetionString = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
    SqlConnection cn = new SqlConnection(connetionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            bindInstitues();
            btnedit.Visible = false;
        }
    }
    public void bindInstitues()
    {
        cn.Open();
        SqlCommand cmdInstitutes = new SqlCommand("select * from Institutes", cn);
        ddlInstitutes.DataSource = cmdInstitutes.ExecuteReader();
        ddlInstitutes.DataTextField = "InstituteName";
        ddlInstitutes.DataValueField = "InstituteID";
        ddlInstitutes.DataBind();
        ddlInstitutes.Items.Insert(0, new ListItem("---select---", "0"));
        cn.Close();
    }

    public void Clear()
    {
        txtRollNo.Text = " ";
        txtName.Text = " ";
        txtNrcNo.Text = " ";
        txtEmail.Text = " ";
        txtDegree.Text = " ";
        txtGraduatedUniversity.Text = " ";
        txtPhoneNo.Text = " ";
        ddlGender.SelectedIndex = 0;
        ddlInstitutes.SelectedIndex = 0;
        ddlCourses.SelectedIndex = 0;
        ddlBatch.SelectedIndex = 0;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlCommand cmd;
        cn = new SqlConnection(connetionString);
        cn.Open();

        SqlCommand cmdRollNo = new SqlCommand("select RollNo from Students where RollNo=@rollno", cn);
        cmdRollNo.Parameters.AddWithValue("@rollno", txtRollNo.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmdRollNo);
        DataTable dt = new DataTable();
        da.Fill(dt);
        cn.Close();
        if (dt.Rows.Count > 0)
        {
            Response.Write("<script LANGUAGE='JavaScript' >alert('Your roll no is already exist.Please Update student Info!!')</script>");
            bindInfo();
            btnSubmit.Visible = false;
            btnedit.Visible = true;
        }
        else
        {
            cn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter();
            String sql = " ";


            sql = "insert into Students(RollNo,Name,NRC,Email,Degree,GraduatedUniversity,PhoneNo,Gender,Institutes,Course,Batch) values (@rollno,@name,@nrc,@email,@degree,@graduateduni,@phno,@gender,@institute,@course,@batch)";

            cmd = new SqlCommand(sql, cn);
            cmd.Parameters.AddWithValue("@rollno", txtRollNo.Text);
            cmd.Parameters.AddWithValue("@name", txtName.Text);
            cmd.Parameters.AddWithValue("@nrc", txtNrcNo.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@degree", txtDegree.Text);
            cmd.Parameters.AddWithValue("@graduateduni", txtGraduatedUniversity.Text);
            cmd.Parameters.AddWithValue("@phno", txtPhoneNo.Text);
            cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedValue);
            cmd.Parameters.AddWithValue("@institute", ddlInstitutes.SelectedValue);
            cmd.Parameters.AddWithValue("@course", ddlCourses.SelectedValue);
            cmd.Parameters.AddWithValue("@batch", ddlBatch.SelectedValue);
            int k = cmd.ExecuteNonQuery();
            if (k != 0)
            {
                
                Response.Write("<script LANGUAGE='JavaScript' >alert('Inserted Succesfully!!')</script>");
            }
            cn.Close();
            btnedit.Visible = false;
            Clear();
        }

        
       

    }

    protected void instituteSelected_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlInstitutes.SelectedIndex != -1)
        {
            if (ddlInstitutes.SelectedItem.Text == "ICTTI")
            {
                ddlCourses.Items.Clear();
                cn.Open();
                SqlCommand cmdCourse = new SqlCommand("select * from Course where Institutes_Name=1", cn);
                ddlCourses.DataSource = cmdCourse.ExecuteReader();
                ddlCourses.DataTextField = "Course_Name";
                ddlCourses.DataValueField = "CourseID";
                ddlCourses.DataBind();
                ddlCourses.Items.Insert(0, new ListItem("---select---", "0"));
                cn.Close();
            }
            if (ddlInstitutes.SelectedItem.Text == "IMCEITS")
            {
                ddlCourses.Items.Clear();
                cn.Open();
                SqlCommand cmdCourse = new SqlCommand("select * from Course where Institutes_Name=2", cn);
                ddlCourses.DataSource = cmdCourse.ExecuteReader();
                ddlCourses.DataTextField = "Course_Name";
                ddlCourses.DataValueField = "CourseID";
                ddlCourses.DataBind();
                ddlCourses.Items.Insert(0, new ListItem("---select---", "0"));
                cn.Close();
            }

            cn.Open();
            SqlCommand cmdBatch = new SqlCommand("select * from Batch", cn);
            ddlBatch.DataSource = cmdBatch.ExecuteReader();
            ddlBatch.DataTextField = "Batch_No";
            ddlBatch.DataValueField = "BatchID";
            ddlBatch.DataBind();
            ddlBatch.Items.Insert(0, new ListItem("---select---", "0"));
            cn.Close();
          
        }
    }


    public void updateStudentInfo()
    {
        cn.Open();

        string updateInfo = "update Students set Name=@name, NRC=@nrc, Gender=@gender, Institutes=@institutes, Batch=@batch, Course=@course ,Email=@email , PhoneNo=@phoneNo , Degree=@degree , GraduatedUniversity=@graduatedUniversity where RollNo='" + txtRollNo.Text + "'";
        SqlCommand cmdupdateInfo = new SqlCommand(updateInfo, cn);
        cmdupdateInfo.Parameters.AddWithValue("@name", txtName.Text);
        cmdupdateInfo.Parameters.AddWithValue("@nrc", txtNrcNo.Text);
        cmdupdateInfo.Parameters.AddWithValue("@gender", ddlGender.SelectedValue);
        cmdupdateInfo.Parameters.AddWithValue("@institutes", ddlInstitutes.SelectedValue);
        cmdupdateInfo.Parameters.AddWithValue("@batch", ddlBatch.SelectedValue);
        cmdupdateInfo.Parameters.AddWithValue("@course", ddlBatch.SelectedValue);
        cmdupdateInfo.Parameters.AddWithValue("@email", txtEmail.Text);
        cmdupdateInfo.Parameters.AddWithValue("@phoneNo", txtPhoneNo.Text);
        cmdupdateInfo.Parameters.AddWithValue("@degree", txtDegree.Text);
        cmdupdateInfo.Parameters.AddWithValue("@graduatedUniversity", txtGraduatedUniversity.Text);

       

        int i = cmdupdateInfo.ExecuteNonQuery();

        string message = "Your form is successfully updated!";
        //Show the message and then redirect
        ScriptManager.RegisterStartupScript(this, this.GetType(),
            "alert",
            "alert('" + message + "');window.location ='StudentProfile.aspx';",
            true);

        cn.Close();
    }

    public void bindInfo()
    {
        cn.Open();
        //rollno = txtRollNo.Text.ToString();

        //txtRollNo.Text = (string)Session["username"];
        DataTable dtInfo = new DataTable();
        SqlDataReader readerInfo = null;
        SqlCommand cmdInfo = new SqlCommand("select * from Students where RollNo='" + txtRollNo.Text + "'", cn);
        readerInfo = cmdInfo.ExecuteReader();
        while (readerInfo.Read())
        {
            //txtRollNo.Text = (readerInfo["RollNo"].ToString());

            txtName.Text = (readerInfo["Name"].ToString());
            txtNrcNo.Text = (readerInfo["NRC"].ToString());

            ddlGender.SelectedValue = readerInfo["Gender"].ToString();
            ddlInstitutes.SelectedValue = readerInfo["Institutes"].ToString();
            ddlBatch.SelectedValue = readerInfo["Batch"].ToString();
            ddlCourses.SelectedValue = readerInfo["Course"].ToString();

            txtEmail.Text = (readerInfo["Email"].ToString());
            txtPhoneNo.Text = (readerInfo["PhoneNo"].ToString());

            txtDegree.Text = (readerInfo["Degree"].ToString());
            txtGraduatedUniversity.Text = (readerInfo["GraduatedUniversity"].ToString());



        }
        cn.Close();
    }
   
    protected void btnedit_Click(object sender, EventArgs e)
    {
        updateStudentInfo();

    }
}
