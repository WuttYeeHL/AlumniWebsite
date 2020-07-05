using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Courses : System.Web.UI.Page
{
    public static string connetionString = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

    SqlConnection cnn;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            binddata();
            bindInstitues();
        }
    }
    public void bindInstitues()
    {
        cnn.Open();
        SqlCommand cmdInstitutes = new SqlCommand("select * from Institutes", cnn);
        ddlinsteitues.DataSource = cmdInstitutes.ExecuteReader();
        ddlinsteitues.DataTextField = "InstituteName";
        ddlinsteitues.DataValueField = "InstituteID";
        ddlinsteitues.DataBind();
        ddlinsteitues.Items.Insert(0, new ListItem("---select---", "0"));
        cnn.Close();
    }

    public void binddata()
    {
        cnn = new SqlConnection(connetionString);
        cnn.Open();
        SqlDataAdapter sqlda = new SqlDataAdapter("select * from Course Order by CourseID desc;", cnn);
        DataSet ds = new DataSet();
        sqlda.Fill(ds);
        ds.Tables[0].Columns.Add("No", typeof(string));
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["No"] = i + 1;
        }
        GridView1.DataSource = ds;
        GridView1.DataBind();
        cnn.Close();
    }

    protected void btnSave_Click1(object sender, EventArgs e)
    {
        cnn = new SqlConnection(connetionString);
        cnn.Open();
        SqlCommand cmd;
        string sql1 = "select count(*) from Course where Course_Name=@Course_Name and Institutes_Name=@Institutes_Name";
        cmd = new SqlCommand(sql1, cnn);

        cmd.Parameters.AddWithValue("@Course_Name", txtCourseName.Text);
        cmd.Parameters.AddWithValue("@Institutes_Name",ddlinsteitues.SelectedValue);
        int j = (int)cmd.ExecuteScalar();
        if (j > 0)
        {
            lblmsg.Text = "Exiting Course Name!";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            String sql = " ";

            sql = "insert into Course values(@Course_Name,@Institutes_Name)";

            cmd = new SqlCommand(sql, cnn);

            cmd.Parameters.AddWithValue("@Course_Name", txtCourseName.Text);
            cmd.Parameters.AddWithValue("@Institutes_Name", ddlinsteitues.SelectedValue);

            int k = cmd.ExecuteNonQuery();
            if (k != 0)
            {
                lblmsg.Text = "Insert Succesfully!";
                lblmsg.ForeColor = System.Drawing.Color.CornflowerBlue;
            }

            cnn.Close();
            binddata();
            txtCourseName.Text = " ";
        }
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtCourseName.Text.Trim() != "")
        {
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sql = "SELECT *  FROM Course  WHERE Course_Name LIKE '%" + txtCourseName.Text.Trim() + "%'";
                    cmd.CommandText = sql;
                    cmd.Connection = con;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        dt.Columns.Add("No", typeof(string));
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            dt.Rows[i]["No"] = i + 1;
                        }
                        GridView1.DataSourceID = null;
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                    con.Close();

                }
            }
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            string myindex;
            if (e.CommandArgument.ToString() == "") { myindex = "0"; } else { myindex = e.CommandArgument.ToString(); }
            int index = Convert.ToInt32(myindex);
            int i = index % 10;
            GridViewRow row = GridView1.Rows[i];
            Label ID = (Label)row.FindControl("lblCID");
            lblID.Text = ID.Text;
            Label Course_Name = (Label)row.FindControl("lblCourseName");
            txtCourse_Name.Text = Course_Name.Text;
            btnUpdateModal.Visible = true;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "OpenModal()", true);
        }
        if (e.CommandName == "Delete")
        {
            string myindex;
            if (e.CommandArgument.ToString() == "") { myindex = "0"; } else { myindex = e.CommandArgument.ToString(); }
            int index = Convert.ToInt32(myindex);
            int i = index % 10;
            GridViewRow row = GridView1.Rows[i];
            Label ID = (Label)row.FindControl("lblCID");
            string query = "delete from Course WHERE CourseID=@CourseID";
            string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@CourseID", ID.Text);
                    cmd.Connection = cnn;
                    cnn.Open();
                    int k = cmd.ExecuteNonQuery();
                    if (k != 0)
                    {
                        lblmsg.Text = "Delete Succesfully!";
                        lblmsg.ForeColor = System.Drawing.Color.CornflowerBlue;
                    }
                    cnn.Close();
                }
            }

            binddata();
            txtCourseName.Text = " ";
        }
        
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        binddata();
    }
    protected void btnUpdateModal_Click(object sender, EventArgs e)
    {
        string ID = lblID.Text;
        string Course_Name = txtCourse_Name.Text;
        string query = "update Course set Course_Name=@Course_Name WHERE CourseID=@CourseID";
        string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        using (SqlConnection cnn = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                cmd.Parameters.AddWithValue("@CourseID", ID);
                cmd.Parameters.AddWithValue("@Course_Name", Course_Name);
                cmd.Connection = cnn;
                cnn.Open();
                int k = cmd.ExecuteNonQuery();
                if (k != 0)
                {
                    lblmsg.Text = "Update Succesfully!";
                    lblmsg.ForeColor = System.Drawing.Color.CornflowerBlue;
                }
                cnn.Close();
            }
        }

        binddata();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        binddata();
    }
}