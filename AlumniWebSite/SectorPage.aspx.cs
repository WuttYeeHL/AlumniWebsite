using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Sector : System.Web.UI.Page
{
    public static string connetionString = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
    SqlConnection cnn = new SqlConnection(connetionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            binddata();
        }
    }
    public void binddata()
    {
        cnn = new SqlConnection(connetionString);
        cnn.Open();
        SqlDataAdapter sqlda = new SqlDataAdapter("select * from Sector order by SectorID desc;", cnn);
        DataSet ds = new DataSet();
        sqlda.Fill(ds);
        ds.Tables[0].Columns.Add("No", typeof(string));
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["No"] = i + 1;
        }
        GridView1.DataSource = ds;
        GridView1.DataBind();

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        cnn = new SqlConnection(connetionString);
        cnn.Open();
        SqlCommand cmd;
        string sql1 = "select count(*) from Sector where SectorType=@SectorType ";
        cmd = new SqlCommand(sql1, cnn);

        cmd.Parameters.AddWithValue("@SectorType", txtSectorType.Text);
        int j = (int)cmd.ExecuteScalar();
        if (j > 0)
        {
            lblmsg.Text = "Exiting Sector Type!";
            lblmsg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            String sql = " ";

            sql = "insert into Sector values(@SectorType)";

            cmd = new SqlCommand(sql, cnn);

            cmd.Parameters.AddWithValue("@SectorType", txtSectorType.Text);

            int k = cmd.ExecuteNonQuery();
            if (k != 0)
            {
                lblmsg.Text = "Insert Succesfully !";
                lblmsg.ForeColor = System.Drawing.Color.CornflowerBlue;
            }

            cnn.Close();
            binddata();
            txtSectorType.Text = " ";
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtSectorType.Text.Trim() != "")
        {
            using (SqlConnection con = new SqlConnection(connetionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    string sql = "SELECT *  FROM Sector  WHERE SectorType LIKE '%" + txtSectorType.Text.Trim() + "%'";
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
        
            
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            binddata();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

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
                Label ID = (Label)row.FindControl("lblSID");
                lblID.Text = ID.Text;
                Label SectorType = (Label)row.FindControl("lblSectorType");
                txtSector_Type.Text = SectorType.Text;

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
                Label ID = (Label)row.FindControl("lblSID");

                string query = "delete from Sector WHERE SectorID=@SectorID";
                string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
                using (SqlConnection cnn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Parameters.AddWithValue("@SectorID", ID.Text);
                        cmd.Connection = cnn;
                        cnn.Open();
                        int k = cmd.ExecuteNonQuery();
                        if (k != 0)
                        {
                            lblmsg.Text = "Delete Succesfully !";
                            lblmsg.ForeColor = System.Drawing.Color.CornflowerBlue;
                        }
                        cnn.Close();
                    }
                }

                binddata();
                txtSectorType.Text = " ";
            }
        }
        protected void btnUpdateModal_Click(object sender, EventArgs e)
        {
            string ID = lblID.Text;
            string SectorType = txtSector_Type.Text;
            string query = "update Sector set SectorType=@SectorType WHERE SectorID=@SectorID";
            string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            using (SqlConnection cnn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@SectorID", ID);
                    cmd.Parameters.AddWithValue("@SectorType", SectorType);
                    cmd.Connection = cnn;
                    cnn.Open();
                    int k = cmd.ExecuteNonQuery();
                    if (k != 0)
                    {
                        lblmsg.Text = "Update Succesfully !";
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