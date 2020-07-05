using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public static string connString = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
    //public static string connString = @"Data Source=WUTTYEE-PC;Initial Catalog=AlumniDB;User ID=sa;Password=apple";
    SqlConnection cn = new SqlConnection(connString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindInstitues();
            bindPosition();
            bindSector();
            bindFormForUpdatingData();
            EnableDisable();
            checkAlumni();
        }
    }

    #region checking Alumni already existed
    public void checkAlumni()
    {
        cn.Open();
        SqlCommand cmdRollNo = new SqlCommand("select RollNo from Alumni where Rollno=@rollno", cn);
        cmdRollNo.Parameters.AddWithValue("@rollno", txtRollNo.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmdRollNo);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            btnSubmit.Visible = false;
            ddlInstitutes.Enabled = false;
            ddlCourses.Enabled = false;
            ddlBatch.Enabled = false;
        }
        else
        {
            btnSubmit.Visible = true;
            btnUpdate.Visible = false;
        }

    }
    #endregion

    #region  submit button
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        cn.Open();
        string insertInfo = "insert into Alumni(RollNo,Name,NRC,Email,Degree,GraduatedUniversity,PhoneNo,Gender,Institutes,Course,Batch,CompanyName,Position,Sector,Salary) values (@rollno,@name,@nrc,@email,@degree,@graduateduni,@phno,@gender,@institute,@course,@batch,@companyname,@position,@sector,@salary)";
        SqlCommand cmdInfo = new SqlCommand(insertInfo, cn);
        cmdInfo.Parameters.AddWithValue("@rollno", txtRollNo.Text);
        cmdInfo.Parameters.AddWithValue("@name", txtName.Text);
        cmdInfo.Parameters.AddWithValue("@nrc", txtNrc.Text);
        cmdInfo.Parameters.AddWithValue("@email", txtEmail.Text);
        cmdInfo.Parameters.AddWithValue("@degree", txtDegree.Text);
        cmdInfo.Parameters.AddWithValue("@graduateduni", txtGraduatedUniversity.Text);
        cmdInfo.Parameters.AddWithValue("@phno", txtPhoneNo.Text);
        cmdInfo.Parameters.AddWithValue("@gender", txtGender.Text);
        cmdInfo.Parameters.AddWithValue("@institute", ddlInstitutes.SelectedValue);
        cmdInfo.Parameters.AddWithValue("@course", ddlCourses.SelectedValue);
        cmdInfo.Parameters.AddWithValue("@batch", ddlBatch.SelectedValue);
        cmdInfo.Parameters.AddWithValue("@companyname", txtCurrentCompanyName.Text);
        cmdInfo.Parameters.AddWithValue("@position", ddlCurrentPosition.SelectedValue);
        cmdInfo.Parameters.AddWithValue("@sector", ddlCurrentSector.SelectedValue);
        cmdInfo.Parameters.AddWithValue("@salary", ddlSalary.SelectedValue);
        int i = cmdInfo.ExecuteNonQuery();
        string message = "Your form is successfully submitted!";
        //Show the message and then redirect
        ScriptManager.RegisterStartupScript(this, this.GetType(),
            "alert",
            "alert('" + message + "');window.location ='MemberSurveyForm.aspx';",
            true);
        cn.Close();
    }
    #endregion

    #region binFormForUpdatingData
    public void bindFormForUpdatingData()
    {
        bindInfo();
        bindCourse();
        bindBatch();
        cn.Open();
        txtRollNo.Text = (string)Session["username"];
        DataTable dtInfo = new DataTable();
        SqlDataReader reader = null;
        SqlCommand cmdInfo = new SqlCommand("select * from Alumni where RollNo='" + txtRollNo.Text + "'", cn);
        reader = cmdInfo.ExecuteReader();
        while (reader.Read())
        {
            ddlInstitutes.SelectedValue = reader["Institutes"].ToString();
            ddlCourses.SelectedValue = reader["Course"].ToString();
            ddlBatch.SelectedValue = reader["Batch"].ToString();
            txtCurrentCompanyName.Text = reader["CompanyName"].ToString();
            ddlCurrentPosition.SelectedValue = reader["Position"].ToString();
            ddlCurrentSector.SelectedValue = reader["Sector"].ToString();
            ddlSalary.SelectedValue = reader["Salary"].ToString();

        }
        cn.Close();
    }
    #endregion

    #region submit button
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        updateAlumniInfo();
        EnableDisable();

        btnUpdate.Visible = false;
        btnSubmit.Visible = true;
        cn.Close();
    }
    #endregion

    #region ControlFunction
    public void EnableDisable()
    {
        txtRollNo.Enabled = false;
        txtName.Enabled = false;
        txtNrc.Enabled = false;
        txtGender.Enabled = false;
        txtDegree.Enabled = false;
        txtGraduatedUniversity.Enabled = false;
        txtGender.Enabled = false;
        txtEmail.Enabled = false;
        txtPhoneNo.Enabled = false;
    }
    #endregion

    #region Clear
    private void Clear()
    {
        //cboPTypeID.SelectedValue = "0";
        //txtDescription.Text = "";
        //exhid = 0;
    }
    #endregion

    #region binding Student Info
    public void bindInfo()
    {
        cn.Open();
        txtRollNo.Text = (string)Session["username"];
        DataTable dtInfo = new DataTable();
        SqlDataReader readerInfo = null;
        SqlCommand cmdInfo = new SqlCommand("select * from Students where RollNo='" + txtRollNo.Text + "'", cn);
        readerInfo = cmdInfo.ExecuteReader();
        while (readerInfo.Read())
        {
            txtName.Text = (readerInfo["Name"].ToString());
            txtNrc.Text = (readerInfo["NRC"].ToString());
            txtDegree.Text = (readerInfo["Degree"].ToString());
            txtGraduatedUniversity.Text = (readerInfo["GraduatedUniversity"].ToString());
            txtGender.Text = (readerInfo["gender"].ToString());
            txtPhoneNo.Text = (readerInfo["PhoneNo"].ToString());
            txtEmail.Text = (readerInfo["Email"].ToString());
        }
        cn.Close();
    }
    #endregion

    #region binding Institutes
    public void bindInstitues()
    {
        cn.Open();
        string institute = "select * from Institutes";
        SqlDataAdapter adpInstitute = new SqlDataAdapter(institute, cn);
        DataTable dtInstitute = new DataTable();
        adpInstitute.Fill(dtInstitute);
        ddlInstitutes.DataSource = dtInstitute;
        ddlInstitutes.DataBind();
        ddlInstitutes.DataValueField = "InstituteID";
        ddlInstitutes.DataTextField = "InstituteName";
        ddlInstitutes.DataBind();
        ddlInstitutes.Items.Insert(0, new ListItem("---select---", "0"));
        cn.Close();
    }
    #endregion

    #region selected index changed to courses and batches according to institute
    protected void instituteSelected_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (ddlInstitutes.SelectedIndex != -1)
        {
            ddlCourses.Items.Clear();
            if (ddlInstitutes.SelectedValue.ToString() == "1")
            {
                cn.Open();
                string course = "select * from Course where Institutes_Name=1";
                SqlDataAdapter adpCourse = new SqlDataAdapter(course, cn);
                DataTable dtCourse = new DataTable();
                adpCourse.Fill(dtCourse);
                ddlCourses.DataSource = dtCourse;
                ddlCourses.DataBind();
                ddlCourses.DataValueField = "CourseID";
                ddlCourses.DataTextField = "Course_Name";
                ddlCourses.DataBind();
                ddlCourses.Items.Insert(0, new ListItem("---select---", "0"));
                cn.Close();
            }
            if (ddlInstitutes.SelectedValue.ToString() == "2")
            {
                cn.Open();
                string course = "select * from Course where Institutes_Name=2";
                SqlDataAdapter adpCourse = new SqlDataAdapter(course, cn);
                DataTable dtCourse = new DataTable();
                adpCourse.Fill(dtCourse);
                ddlCourses.DataSource = dtCourse;
                ddlCourses.DataBind();
                ddlCourses.DataValueField = "CourseID";
                ddlCourses.DataTextField = "Course_Name";
                ddlCourses.DataBind();
                ddlCourses.Items.Insert(0, new ListItem("---select---", "0"));
                cn.Close();
            }
        }

    }
    #endregion

    #region binding Course and Batch of ICTTI
    //public void bindICTTI()
    //{
    //    cn.Open();
    //    string cICTTI = "select * from CourseICTTIs";
    //    SqlDataAdapter adpcICTTI = new SqlDataAdapter(cICTTI, cn);
    //    DataTable dtcICTTI = new DataTable();
    //    adpcICTTI.Fill(dtcICTTI);
    //    ddlCourses.DataSource = dtcICTTI;
    //    ddlCourses.DataBind();
    //    ddlCourses.DataValueField = "CourseID";
    //    ddlCourses.DataTextField = "Course_Name";
    //    ddlCourses.DataBind();
    //    ddlCourses.Items.Insert(0, new ListItem("---select---", "0"));
    //    cn.Close();

    //    cn.Open();
    //    string bICTTI = "select * from BatchICTTIs";
    //    SqlDataAdapter adpbICTTI = new SqlDataAdapter(bICTTI, cn);
    //    DataTable dtbICTTI = new DataTable();
    //    adpbICTTI.Fill(dtbICTTI);
    //    ddlBatch.DataSource = dtbICTTI;
    //    ddlBatch.DataBind();
    //    ddlBatch.DataValueField = "BatchID";
    //    ddlBatch.DataTextField = "Batch_No";
    //    ddlBatch.DataBind();
    //    ddlBatch.Items.Insert(0, new ListItem("---select---", "0"));
    //    cn.Close();
    //}
    #endregion

    #region binding Course and Batch of IMCEITS
    //public void bindIMCEITS()
    //{
    //    cn.Open();
    //    string cIMCEITS = "select * from CourseIMCEITS";
    //    SqlDataAdapter adpcIMCEITS = new SqlDataAdapter(cIMCEITS, cn);
    //    DataTable dtcIMCEITS = new DataTable();
    //    adpcIMCEITS.Fill(dtcIMCEITS);
    //    ddlCourses.DataSource = dtcIMCEITS;
    //    ddlCourses.DataBind();
    //    ddlCourses.DataValueField = "CourseID";
    //    ddlCourses.DataTextField = "Course_Name";
    //    ddlCourses.DataBind();
    //    ddlCourses.Items.Insert(0, new ListItem("---select---", "0"));
    //    cn.Close();

    //    cn.Open();
    //    string bIMCEITS = "select * from BatchIMCEITS";
    //    SqlDataAdapter adpbIMCEITS = new SqlDataAdapter(bIMCEITS, cn);
    //    DataTable dtbIMCEITS = new DataTable();
    //    adpbIMCEITS.Fill(dtbIMCEITS);
    //    ddlBatch.DataSource = dtbIMCEITS;
    //    ddlBatch.DataBind();
    //    ddlBatch.DataValueField = "BatchID";
    //    ddlBatch.DataTextField = "Batch_No";
    //    ddlBatch.DataBind();
    //    ddlBatch.Items.Insert(0, new ListItem("---select---", "0"));
    //    cn.Close();
    //}
    #endregion

    #region binding Course
    public void bindCourse()
    {
        cn.Open();
        string course = "select * from Course ";
        SqlDataAdapter adpCourse = new SqlDataAdapter(course, cn);
        DataTable dtCourse = new DataTable();
        adpCourse.Fill(dtCourse);
        ddlCourses.DataSource = dtCourse;
        ddlCourses.DataBind();
        ddlCourses.DataValueField = "CourseID";
        ddlCourses.DataTextField = "Course_Name";
        ddlCourses.DataBind();
        ddlCourses.Items.Insert(0, new ListItem("---select---", "0"));
        cn.Close();
    }
    #endregion

    #region binding Batch
    public void bindBatch()
    {
        cn.Open();
        string batch = "select * from Batch";
        SqlDataAdapter adpBatch = new SqlDataAdapter(batch, cn);
        DataTable dtBatch = new DataTable();
        adpBatch.Fill(dtBatch);
        ddlBatch.DataSource = dtBatch;
        ddlBatch.DataBind();
        ddlBatch.DataValueField = "BatchID";
        ddlBatch.DataTextField = "Batch_No";
        ddlBatch.DataBind();
        ddlBatch.Items.Insert(0, new ListItem("---select---", "0"));
        cn.Close();
    }
    #endregion
    
    #region binding Position
    public void bindPosition()
    {
        cn.Open();
        string position = "select * from Position";
        SqlDataAdapter adpPosition = new SqlDataAdapter(position, cn);
        DataTable dtPosition = new DataTable();
        adpPosition.Fill(dtPosition);
        ddlCurrentPosition.DataSource = dtPosition;
        ddlCurrentPosition.DataBind();
        ddlCurrentPosition.DataValueField = "PositionID";
        ddlCurrentPosition.DataTextField = "PositionType";
        ddlCurrentPosition.DataBind();
        ddlCurrentPosition.Items.Insert(0, new ListItem("---select---", "0"));
        cn.Close();
    }
    #endregion

    #region binding Sector
    public void bindSector()
    {
        cn.Open();
        string sector = "select * from Sector";
        SqlDataAdapter adpSector = new SqlDataAdapter(sector, cn);
        DataTable dtSector = new DataTable();
        adpSector.Fill(dtSector);
        ddlCurrentSector.DataSource = dtSector;
        ddlCurrentSector.DataBind();
        ddlCurrentSector.DataValueField = "SectorID";
        ddlCurrentSector.DataTextField = "SectorType";
        ddlCurrentSector.DataBind();
        ddlCurrentSector.Items.Insert(0, new ListItem("---select---", "0"));
        cn.Close();
    }
    #endregion

    #region updating Alumni Info
    public void updateAlumniInfo()
    {
        cn.Open();
        string updateInfo = "update Alumni set CompanyName=@companyname, Position=@position, Sector=@sector, Salary=@salary where RollNo='" + txtRollNo.Text + "'";
        SqlCommand cmdupdateInfo = new SqlCommand(updateInfo, cn);
        cmdupdateInfo.Parameters.AddWithValue("@companyname", txtCurrentCompanyName.Text);
        cmdupdateInfo.Parameters.AddWithValue("@position", ddlCurrentPosition.SelectedValue);
        cmdupdateInfo.Parameters.AddWithValue("@sector", ddlCurrentSector.SelectedValue);
        cmdupdateInfo.Parameters.AddWithValue("@salary", ddlSalary.SelectedValue);
        int i = cmdupdateInfo.ExecuteNonQuery();

        string message = "Your form is successfully updated!";
        //Show the message and then redirect
        ScriptManager.RegisterStartupScript(this, this.GetType(),
            "alert",
            "alert('" + message + "');window.location ='MemberHomePage.aspx';",
            true);

        cn.Close();
    }
    #endregion

    #region Calcelling Alumni Info
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        string message = "Do you want to exit?";
        //Show the message and then redirect
        ScriptManager.RegisterStartupScript(this, this.GetType(),
            "alert",
            "alert('" + message + "');window.location ='MemberHomePage.aspx';",
            true);
    }
    #endregion
}