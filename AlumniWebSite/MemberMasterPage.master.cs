using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MemberMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //to display current user
        try
        {
            lblUser.Text = Session["username"].ToString();
        }
        catch (NullReferenceException)
        {

        }
    }
}
