using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SearchStudent : System.Web.UI.Page
{
    public static string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
    SqlConnection connection = new SqlConnection(constr);

    public string institute = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlInstitudeBind();
        }
    }
    //public void binddata()
    //{
    //    cnn = new SqlConnection(connetionString);
    //    cnn.Open();
    //    SqlDataAdapter sqlda = new SqlDataAdapter("select * from Batch  Order by BatchID desc;", cnn);
    //    DataSet ds = new DataSet();
    //    sqlda.Fill(ds);
    //    ds.Tables[0].Columns.Add("No", typeof(string));
    //    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
    //    {
    //        ds.Tables[0].Rows[i]["No"] = i + 1;
    //    }
    //    GridView1.DataSource = ds;
    //    GridView1.DataBind();
    //}
    protected void ddlInstitudeBind()
    {
        string qur = "select * from Institutes";
        SqlDataAdapter adpt = new SqlDataAdapter(qur, constr);
        DataTable dt = new DataTable();
        adpt.Fill(dt);

        ddlInstitutes.DataSource = dt;
        ddlInstitutes.DataValueField = "InstituteID";
        ddlInstitutes.DataTextField = "InstituteName";
        ddlInstitutes.DataBind();
        ddlInstitutes.Items.Insert(0, new ListItem("--Select--", "0"));
    }

    public string SearchData(string select)
    {
        
      
        string str = "";
        string query = "";
        
            if (ddlInstitutes.SelectedValue.ToString() != "")
            {
                str = " where Institutes = '" + ddlInstitutes.SelectedValue.ToString() + "'";
            }

            if (int.Parse(ddlBatch.SelectedValue.ToString()) != 0)
            {
                if (str != "")
                {
                    str += " and Batch = '" + ddlBatch.SelectedValue.ToString() + "'";
                }
                else
                {
                    str = " where Batch = '" + ddlBatch.SelectedValue.ToString() + "'";
                }

            }

            query = select + str;
           
        

        return query;

        //SearchDT(query);

    }
    protected void btnSearchStudent_Click(object sender, EventArgs e)
    {
        SearchStudentBind();
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowGridStudent();", true);
        
    }

    public void SearchStudentBind() {

        institute = ddlInstitutes.SelectedItem.Text;
        if (institute == "--Select--")
        {
            Response.Write("<script>alert('Please choose an institute....')</script>");
        }
        else
        {
            connection.Open();
            string sql = SearchData("select * from V_AlumniStatus");
            SqlDataAdapter da = new SqlDataAdapter(sql, connection);
            //DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(dt);

            dt.Columns.Add("No", typeof(String)).SetOrdinal(0);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dt.Rows[i][0] = (i + 1).ToString();

            }
            gvData.DataSource = dt;
            gvData.DataBind();
            connection.Close();
        }
       
    }
    //protected void ddlInstitutes_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (ddlInstitutes.SelectedIndex != -1)
    //    {
    //        connection.Open();
    //        SqlCommand cmdBatch = new SqlCommand("select * from Batch", connection);
    //        ddlBatch.DataSource = cmdBatch.ExecuteReader();
    //        ddlBatch.DataTextField = "Batch_No";
    //        ddlBatch.DataValueField = "BatchID";
    //        ddlBatch.DataBind();
    //        ddlBatch.Items.Insert(0, new ListItem("---select---", "0"));
    //        connection.Close();
         
    //    }
    //}
    protected void btnSearchAlumni_Click(object sender, EventArgs e)
    {
        SearchAlumniBind();
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowGridAlumni();", true);        
    }
    public void SearchAlumniBind() {
        institute = ddlInstitutes.SelectedItem.Text;
        if (institute == "--Select--")
        {
            Response.Write("<script>alert('Please choose an institute....')</script>");
        }
        else
        {
            connection.Open();
            string sql = SearchData("select * from V_Alumni");
            SqlDataAdapter da = new SqlDataAdapter(sql, connection);
            //DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(dt);

            dt.Columns.Add("No", typeof(String)).SetOrdinal(0);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dt.Rows[i][0] = (i + 1).ToString();

            }
            GVAlumini.DataSource = dt;
            GVAlumini.DataBind();
            connection.Close();
        }
        
    }
    protected void gvData_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (ddlInstitutes.SelectedIndex != -1)
        //{
        //    connection.Open();
        //    SqlCommand cmdBatch = new SqlCommand("select * from Batch", connection);
        //    ddlBatch.DataSource = cmdBatch.ExecuteReader();
        //    ddlBatch.DataTextField = "Batch_No";
        //    ddlBatch.DataValueField = "BatchID";
        //    ddlBatch.DataBind();
        //    ddlBatch.Items.Insert(0, new ListItem("---select---", "0"));
        //    connection.Close();

        //}
    }
    protected void ddlInstitutes_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlInstitutes.SelectedIndex != -1)
        {
            connection.Open();
            SqlCommand cmdBatch = new SqlCommand("select * from Batch", connection);
            ddlBatch.DataSource = cmdBatch.ExecuteReader();
            ddlBatch.DataTextField = "Batch_No";
            ddlBatch.DataValueField = "BatchID";
            ddlBatch.DataBind();
            ddlBatch.Items.Insert(0, new ListItem("---select---", "0"));
            connection.Close();

        }
    }
    protected void gvData_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvData.PageIndex = e.NewPageIndex;
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowGridStudent();", true);   
        //ddlInstitudeBind();
        SearchStudentBind();
    }

  
   
    protected void GVAlumini_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVAlumini.PageIndex = e.NewPageIndex;
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowGridAlumni();", true);        
        SearchAlumniBind();
    }
}