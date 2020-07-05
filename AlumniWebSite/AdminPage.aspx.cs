using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;
using System.Web.Services;

public partial class AdminPage : System.Web.UI.Page
{
    //public static string con = "Data Source=DESKTOP-BLBG9PK;Initial Catalog=AlumniDB;User ID=sa;Password=1234";
    public static string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

    string institute = "";
    string batch = "";
    string course = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            ddlInstitudeBind();
            //btnShowDetail.Visible = false;
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "hideAllButton();", true);


        }
        // ClientScript.RegisterStartupScript(this.GetType(), "alert", "hideButtonDetail();", true);
    }
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

    protected void RankDataGridviewBind()
    {

        institute = ddlInstitutes.SelectedItem.Text;
        batch = ddlBatch.SelectedItem.Text;
        course = ddlCourse.SelectedItem.Text;

        if (institute == "--Select--")
        {
            Response.Write("<script>alert('Please choose an institute....')</script>");
        }

        else
        {
            //string query = "select Position,Count(Position) as Total from Alumni where Institutes = '" + institute + "' and Batch='" + batch + "' and Course='" + course + "' group by Position";
            //string query = SearchData("select PositionType,Count(Position) as Total from V_Alumni", "group by PositionType");
            //string query = "select RollNo,Name,CompanyName,PositionType,SectorType from V_Alumni ";
            string query = SearchGridViewData("select RollNo,Name,Course_Name,Batch_No,CompanyName,PositionType,SectorType from V_Alumni");
            SqlDataAdapter sDa = new SqlDataAdapter(query, constr);
            // DataSet ds = new DataSet();

            DataTable dt = new DataTable();
            sDa.Fill(dt);

            dt.Columns.Add("No", typeof(String)).SetOrdinal(0);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dt.Rows[i][0] = (i + 1).ToString();

            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }


    }

    private static DataTable GetData(string query)
    {

        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                DataTable dt = new DataTable();
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    sda.Fill(dt);
                }

                return dt;
            }
        }
    }

    protected void SectorDataGridviewBind()
    {


        institute = ddlInstitutes.SelectedItem.Text;
        batch = ddlBatch.SelectedItem.Text;
        course = ddlCourse.SelectedItem.Text;
        if (institute == "--Select--")
        {
            Response.Write("<script>alert('Please choose an institute....')</script>");
        }
        else
        {
            //string query = "select Sector,Count(Sector) as Total from Alumni where Institutes = '" + institute + "' and Batch='" + batch + "' and Course='" + course + "' group by Sector";
            //string query = SearchData("select SectorType,Count(Sector) as Total from V_Alumni", "group by SectorType");
            string query = SearchGridViewData("select RollNo,Name,Course_Name,Batch_No,CompanyName,PositionType,SectorType from V_Alumni");
            //string query = "select * from CourseICTTIs";
            SqlDataAdapter sDa = new SqlDataAdapter(query, constr);
            //DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            sDa.Fill(dt);

            dt.Columns.Add("No", typeof(String)).SetOrdinal(0);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dt.Rows[i][0] = (i + 1).ToString();

            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

    }


    protected void btnSearchPosition_Click(object sender, EventArgs e)
    {
        //btnShowDetail.Visible = true;
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "showButtonChart2Modal();", true);

        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "hideBtn1ShowBtn2();", true);

        //Chart1.Visible = false;
        //Chart2.Visible = true;
        //SqlConnection connection = new SqlConnection(constr);

        //institute = ddlInstitutes.SelectedItem.Text;
        //batch = ddlBatch.SelectedItem.Text;
        //course = ddlCourse.SelectedItem.Text;

        //connection.Open();
        ////string query = "select Position,Count(Position) as Total from Alumni where Institutes = @institute and Batch=@batch and Course=@course group by Position";
        //string query = SearchData("select PositionType,Count(PositionType) as Total from V_Alumni", "group by PositionType");
        //SqlCommand cmdq = new SqlCommand(query, connection);
        //cmdq.Parameters.AddWithValue("@institute", institute);
        //cmdq.Parameters.AddWithValue("@batch", batch);
        //cmdq.Parameters.AddWithValue("@course", course);

        //SqlDataAdapter sDa = new SqlDataAdapter();
        //sDa.SelectCommand = cmdq;
        //DataSet ds = new DataSet();
        //sDa.Fill(ds, "DsPosition");
        //connection.Close();

        //Series series = Chart2.Series["Series2"];
        //foreach (DataTable table in ds.Tables)
        //{
        //    foreach (DataRow dr in table.Rows)
        //    {
        //        series.Points.AddXY(dr["PositionType"].ToString(), dr["Total"].ToString());
        //    }
        //}


        RankDataGridviewBind();
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "LoadPositionChart('" + ddlInstitutes.SelectedItem.Text + "','" + ddlBatch.SelectedItem.Text + "','" + ddlCourse.SelectedItem.Text + "');", true);
        HiddenField1.Value = "1";
        //GridView1.Visible = false;
        //lbtnHideGridView.Visible = false;
        //lbtnShowGridView.Visible = true;


    }
    protected void btnSearchSector_Click1(object sender, EventArgs e)
    {

        //btnShowDetail.Visible = true;
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "showButtonDetail();", true);

        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "hideBtn2ShowBtn1();", true);

        //Chart2.Visible = false;
        //Chart1.Visible = true;
        //SqlConnection connection = new SqlConnection(constr);

        //institute = ddlInstitutes.SelectedItem.Text;
        //batch = ddlBatch.SelectedItem.Text;
        //course = ddlCourse.SelectedItem.Text;

        //connection.Open();
        ////string query = "select Sector,Count(Sector) as Total from Alumni where Institutes = @institute and Batch=@batch and Course=@course group by Sector";
        //string query = SearchData("select SectorType,Count(SectorType) as Total from V_Alumni", "group by SectorType");

        //SqlCommand cmdq = new SqlCommand(query, connection);
        //cmdq.Parameters.AddWithValue("@institute", institute);
        //cmdq.Parameters.AddWithValue("@batch", batch);
        //cmdq.Parameters.AddWithValue("@course", course);

        //SqlDataAdapter sDa = new SqlDataAdapter();
        //sDa.SelectCommand = cmdq;
        //DataSet ds = new DataSet();
        //sDa.Fill(ds, "DsSector");
        //connection.Close();

        //Series series = Chart1.Series["Series1"];
        //foreach (DataTable table in ds.Tables)
        //{
        //    foreach (DataRow dr in table.Rows)
        //    {
        //        series.Points.AddXY(dr["SectorType"].ToString(), dr["Total"].ToString());
        //    }
        //}

        SectorDataGridviewBind();
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "LoadSectorChart('" + ddlInstitutes.SelectedItem.Text + "','" + ddlBatch.SelectedItem.Text + "','" + ddlCourse.SelectedItem.Text + "');", true);
        HiddenField1.Value = "2";
      

    }


    protected void ddlInstitutes_SelectedIndexChanged(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "hideAllButton();", true);

        institute = ddlInstitutes.SelectedItem.Text;

        //SqlConnection connection = new SqlConnection("constr");
        SqlConnection connection = new SqlConnection(constr);
        if (ddlInstitutes.SelectedItem.Text == "IMCEITS")
        {
            string qur = "select * from Batch";
            SqlDataAdapter adpt = new SqlDataAdapter(qur, connection);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlBatch.DataSource = dt;
            ddlBatch.DataValueField = "BatchID";
            ddlBatch.DataTextField = "Batch_No";
            ddlBatch.DataBind();
            ddlBatch.Items.Insert(0, new ListItem("--Select--", "0"));

            string qur2 = "select * from Course where Institutes_Name=2";
            SqlDataAdapter adpt2 = new SqlDataAdapter(qur2, connection);
            DataTable dt2 = new DataTable();
            adpt2.Fill(dt2);
            ddlCourse.DataSource = dt2;
            ddlCourse.DataValueField = "CourseID";
            ddlCourse.DataTextField = "Course_Name";
            ddlCourse.DataBind();
            ddlCourse.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        if (ddlInstitutes.SelectedItem.Text == "ICTTI")
        {
            string qur = "select * from Batch";
            SqlDataAdapter adpt = new SqlDataAdapter(qur, connection);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlBatch.DataSource = dt;
            ddlBatch.DataValueField = "BatchID";
            ddlBatch.DataTextField = "Batch_No";
            ddlBatch.DataBind();
            ddlBatch.Items.Insert(0, new ListItem("--Select--", "0"));

            string qur2 = "select * from Course where Institutes_Name=1";
            SqlDataAdapter adpt2 = new SqlDataAdapter(qur2, connection);
            DataTable dt2 = new DataTable();
            adpt2.Fill(dt2);
            ddlCourse.DataSource = dt2;
            ddlCourse.DataValueField = "CourseID";
            ddlCourse.DataTextField = "Course_Name";
            ddlCourse.DataBind();
            ddlCourse.Items.Insert(0, new ListItem("--Select--", "0"));
        }


    }
    protected void ddlBatch_SelectedIndexChanged(object sender, EventArgs e)
    {
        //batch = ddlBatch.SelectedItem.Text;
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "hideAllButton();", true);
    }
    protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        //course = ddlCourse.SelectedItem.Text;
        ClientScript.RegisterStartupScript(this.GetType(), "alert", "hideAllButton();", true);
    }

    //public DataTable SearchDT(string query)
    //{
    //    DataTable dt = new DataTable();
    //    DataSet ds = new DataSet() ;

    //    SqlConnection con = new SqlConnection(constr);

    //    SqlCommand cmd = new SqlCommand(query, con);
    //    SqlDataAdapter sDa = new SqlDataAdapter(cmd);
    //    sDa.Fill(ds, "tbl");
    //    dt = ds.Tables[0].Copy();
    //    return dt;
    //}

    public string SearchData(string select, string group)
    {
        string str = "";
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

        if (int.Parse(ddlCourse.SelectedValue.ToString()) != 0)
        {
            if (str != "")
            {
                str += " and Course = '" + ddlCourse.SelectedValue.ToString() + "'";
            }
            else
            {
                str = " where Course = '" + ddlCourse.SelectedValue.ToString() + "'";
            }
        }

        string query = select + str;
        return query + group;

        //SearchDT(query);

    }

    public string SearchGridViewData(string select)
    {
        string str = "";
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

        if (int.Parse(ddlCourse.SelectedValue.ToString()) != 0)
        {
            if (str != "")
            {
                str += " and Course = '" + ddlCourse.SelectedValue.ToString() + "'";
            }
            else
            {
                str = " where Course = '" + ddlCourse.SelectedValue.ToString() + "'";
            }
        }

        string query = select + str;
        return query;
    }

    //protected void lbtnShowGridView_Click(object sender, EventArgs e)
    //{
    //    GridView1.Visible = true;
    //    lbtnHideGridView.Visible = true;
    //    lbtnShowGridView.Visible = false;
    //}
    //protected void lbtnHideGridView_Click(object sender, EventArgs e)
    //{
    //    GridView1.Visible = false;
    //    lbtnHideGridView.Visible = false;
    //    lbtnShowGridView.Visible = true;
    //}


    //protected void Chart1_PreRender(object sender, EventArgs e)
    //{
    //    Random r = new Random();

    //    foreach (DataPoint dp in Chart1.Series[0].Points)
    //        dp.Color = Color.FromArgb(r.Next(0, 255), r.Next(0, 255), r.Next(0, 255));
    //}

    //protected void Chart2_PreRender(object sender, EventArgs e)
    //{
    //    Random r = new Random();

    //    foreach (DataPoint dp in Chart2.Series[0].Points)
    //        dp.Color = Color.FromArgb(r.Next(0, 256), r.Next(0, 255), r.Next(0, 257));
    //}

    //protected void btnShowDetail_Click(object sender, EventArgs e)
    //{

    //    ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowDetailModal();", true);
    //    // btnShowDetail.Visible = false;
    //    Chart1.Visible = true;
    //    Chart2.Visible = false;
    //}

    protected void btnCloseModal_Click(object sender, EventArgs e)
    {

        ClientScript.RegisterStartupScript(this.GetType(), "alert", "CloseModal();", true);

    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        SectorDataGridviewBind();
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowChart1Modal();", true);
        if (HiddenField1.Value == "1")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "LoadPositionChartShowModal('" + ddlInstitutes.SelectedItem.Text + "','" + ddlBatch.SelectedItem.Text + "','" + ddlCourse.SelectedItem.Text + "');", true);
        }
        if (HiddenField1.Value == "2")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "LoadSectorChartModalShow('" + ddlInstitutes.SelectedItem.Text + "','" + ddlBatch.SelectedItem.Text + "','" + ddlCourse.SelectedItem.Text + "');", true);
        }

    }

    //protected void btnCloseChart2Modal_Click(object sender, EventArgs e)
    //{
    //    ClientScript.RegisterStartupScript(this.GetType(), "alert", "CloseChart2Modal();", true);
    //}


    [WebMethod]
    public static List<object> getLineChartData(string Institute, string Batch, string Course)
    {
        List<object> iData = new List<object>();
        List<string> labels = new List<string>();
        string str = "";
        if (Institute != "")
        {
            str = " where InstituteName = '" + Institute + "'";
        }

        if (Batch != "--Select--")
        {
            if (str != "")
            {
                str += " and Batch_No = '" + Batch + "'";
            }
            else
            {
                str = " where Batch_No = '" + Batch + "'";
            }

        }

        if (Course != "--Select--")
        {
            if (str != "")
            {
                str += " and Course_Name = '" + Course + "'";
            }
            else
            {
                str = " where Course_Name = '" + Course + "'";
            }
        }
        string query = "select PositionType,Count(PositionType) as Total from V_Alumni " + str + " group by PositionType";
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sDa = new SqlDataAdapter(cmd);
        sDa.Fill(ds, "tbl");
        dt = ds.Tables[0].Copy();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            labels.Add(dt.Rows[i]["PositionType"].ToString());
        }
        iData.Add(labels);

        List<int> lst_dataItem_1 = new List<int>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            lst_dataItem_1.Add(int.Parse(dt.Rows[i]["Total"].ToString()));
        }
        iData.Add(lst_dataItem_1);
        List<string> colors = new List<string>();
        Random rnd = new Random();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Color randomColor = Color.FromArgb(rnd.Next(256), rnd.Next(256), rnd.Next(256));
            colors.Add(HexConverter(randomColor));
        }
        iData.Add(colors);
        return iData;
    }
    [WebMethod]
    public static List<object> getSectorLineChartData(string Institute, string Batch, string Course)
    {
        List<object> iData = new List<object>();
        List<string> labels = new List<string>();
        string str = "";
        if (Institute != "")
        {
            str = " where InstituteName = '" + Institute + "'";
        }

        if (Batch != "--Select--")
        {
            if (str != "")
            {
                str += " and Batch_No = '" + Batch + "'";
            }
            else
            {
                str = " where Batch_No = '" + Batch + "'";
            }

        }

        if (Course != "--Select--")
        {
            if (str != "")
            {
                str += " and Course_Name = '" + Course + "'";
            }
            else
            {
                str = " where Course_Name = '" + Course + "'";
            }
        }
        string query = "select SectorType,Count(SectorType) as Total from V_Alumni " + str + "group by SectorType";
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlConnection con = new SqlConnection(constr);
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter sDa = new SqlDataAdapter(cmd);
        sDa.Fill(ds, "tbl");
        dt = ds.Tables[0].Copy();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            labels.Add(dt.Rows[i]["SectorType"].ToString());
        }
        iData.Add(labels);

        List<int> lst_dataItem_1 = new List<int>();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            lst_dataItem_1.Add(int.Parse(dt.Rows[i]["Total"].ToString()));
        }
        iData.Add(lst_dataItem_1);
        List<string> colors = new List<string>();
        Random rnd = new Random();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            Color randomColor = Color.FromArgb(rnd.Next(256), rnd.Next(256), rnd.Next(256));
            colors.Add(HexConverter(randomColor));
        }
        iData.Add(colors);
        return iData;
    }
    private static String HexConverter(System.Drawing.Color c)
    {
        return "#" + c.R.ToString("X2") + c.G.ToString("X2") + c.B.ToString("X2");
    }
}
