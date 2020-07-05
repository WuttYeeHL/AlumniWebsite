using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPostPage : System.Web.UI.Page
{
    public static string connetionString = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
    //string connetionString = @"Data Source=DESKTOP-58O0Q2V\SQLEXPRESS;Initial Catalog=AlumniDB;User ID=sa;Password=12345";
    //string connetionString = @"Data Source=WINCTRL-E9A0VDG\MSSQLSERVER2012;Initial Catalog=AlumniDB;User ID=sa;Password=12345";
    SqlConnection cnn = new SqlConnection(connetionString);
    DataSet dsa = new DataSet();

    int OffestData = 4;
    public string EditId;

    Label lblEditID;
    Label lblEditTitle;
    Label lblEditDescription;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //to display current user
            //try
            //{
            //    lblUser.Text = Session["username"].ToString();
            //}
            //catch (NullReferenceException)
            //{

            //}
            FetchData();
        }
    }
    protected void FetchData()
    {
        cnn.Open();
        SqlDataAdapter sda = new SqlDataAdapter("select top 4 * from Blog order by ID DESC", cnn);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        sda.Fill(dsa);

        ListView1.DataSource = ds;
        ListView1.DataBind();
        cnn.Close();
    }
    protected void LoadMoreData()
    {

        if (ViewState["Increment"] != null)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "openloader();", true);
            cnn.Open();
            string query = String.Format("select * from Blog order by ID DESC OFFSET 0 ROWS FETCH NEXT " + (4 * int.Parse(ViewState["Increment"].ToString())).ToString() + " ROWS ONLY ");
            SqlDataAdapter sDa = new SqlDataAdapter(query, cnn);
            DataSet ds = new DataSet();
            sDa.Fill(ds);
            ListView1.DataSource = ds;
            ListView1.DataBind();
            cnn.Close();
            ViewState["Increment"] = (int.Parse(ViewState["Increment"].ToString()) + 1).ToString();

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "hideloader();", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "openloader();", true);
            cnn.Open();
            string query = String.Format("select * from Blog order by ID DESC OFFSET 0 ROWS FETCH NEXT 8 ROWS ONLY ");
            SqlDataAdapter sDa = new SqlDataAdapter(query, cnn);
            DataSet ds = new DataSet();
            sDa.Fill(ds);
            ListView1.DataSource = ds;
            ListView1.DataBind();
            cnn.Close();
            ViewState["Increment"] = "3";

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "hideloader();", true);
        }
    }

    protected void btnloadmore_Click(object sender, EventArgs e)
    {
        LoadMoreData();
    }

    protected void btnPost_Click(object sender, EventArgs e)
    {

        cnn.Open();
        string insertQuery = "insert into Blog (UserName,Title,Description,Date) values (@user,@title,@description,@date)";
        SqlCommand cmd = new SqlCommand(insertQuery, cnn);
        cmd.Parameters.AddWithValue("@user", Session["username"].ToString());
        cmd.Parameters.AddWithValue("@title", txtTitle.Text);
        cmd.Parameters.AddWithValue("@description", txtPost.Text);
        // cmd.Parameters.AddWithValue("@img", FileUpload1.);
        cmd.Parameters.AddWithValue("@date", System.DateTime.Now);
        cmd.ExecuteNonQuery();
        cnn.Close();
        FetchData();

        txtTitle.Text = "";
        txtPost.Text = "";


    }



    protected void ListView1_ItemEditing(object sender, ListViewEditEventArgs e)
    {
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "editmodal();", true);
        //ListView1.EditIndex = e.NewEditIndex;
        //FetchData();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "editmodal();", true);

    }

    protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        cnn.Open();
        Label id = (Label)ListView1.Items[e.ItemIndex].FindControl("lblEditID");
        TextBox EditTitle = (TextBox)ListView1.Items[e.ItemIndex].FindControl("txtEditTitle");
        TextBox EditDescription = (TextBox)ListView1.Items[e.ItemIndex].FindControl("txtEditDescription");
        string updateQuery = "update Blog set Title=@title,Description=@description where ID=@lblID";
        SqlCommand cmd = new SqlCommand(updateQuery, cnn);
        cmd.Parameters.AddWithValue("@title", EditTitle.Text);
        cmd.Parameters.AddWithValue("@description", EditDescription.Text);
        cmd.Parameters.AddWithValue("@lblID", id.Text);
        cmd.ExecuteNonQuery();
        ListView1.EditIndex = -1;
        cnn.Close();
        FetchData();
    }

    protected void ListView1_ItemCanceling(object sender, ListViewCancelEventArgs e)
    {
        ListView1.EditIndex = -1;
        FetchData();
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Label lblEditID = (Label)e.Item.FindControl("lblID");
        EditId = lblEditID.Text;

        if (e.CommandName == "Edit")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "editmodal();", true);

            Label lblEditTitle = (Label)e.Item.FindControl("lblTitle");
            Label lblEditDescription = (Label)e.Item.FindControl("pDescription");

            lblmodalEditID.Text = EditId;
            txtEditTitle.Text = lblEditTitle.Text;
            txtEditDescription.Text = lblEditDescription.Text;
        }

        else if (e.CommandName == "Remove")
        {
            Response.Write("Hello i am here");
            cnn.Open();
            string deleteQuery = "delete from Blog where ID = @id";
            SqlCommand cmd = new SqlCommand(deleteQuery, cnn);
            cmd.Parameters.AddWithValue("@id", EditId);
            cmd.ExecuteNonQuery();
            cnn.Close();


        }
        FetchData();
    }

    protected void btnEditSaveChange_Click(object sender, EventArgs e)
    {
        cnn.Open();
        string updateQuery = "update Blog set Title=@title,Description=@description where ID=@lblID";
        SqlCommand cmd = new SqlCommand(updateQuery, cnn);
        cmd.Parameters.AddWithValue("@title", txtEditTitle.Text);
        cmd.Parameters.AddWithValue("@description", txtEditDescription.Text);
        cmd.Parameters.AddWithValue("@lblID", lblmodalEditID.Text);
        cmd.ExecuteNonQuery();

        cnn.Close();
        FetchData();

        txtEditTitle.Text = "";
        txtEditDescription.Text = "";
    }

    protected void btnEditClose_Click(object sender, EventArgs e)
    {
        txtEditTitle.Text = "";
        txtEditDescription.Text = "";
    }

    protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {

    }
}