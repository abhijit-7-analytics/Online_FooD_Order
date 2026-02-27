using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_FooD_Order.User
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Request.Url.AbsoluteUri.ToString().Contains("Default.aspx"))
            {
                form1.Attributes.Add("class", "sub_page");

            }
            else
            {
                form1.Attributes.Remove("class");
                //Load control
                Control usercontrol = (Control)Page.LoadControl("UserControl.ascx");
                //Add control to pannel
                userpanel.Controls.Add(usercontrol);
            }
            if (Session["userid"] != null)
            {
                lbLoginOrLogout.Text = "Logout";
                Utils utils = new Utils();
                Session["cartCount"] = utils.cartCount(Convert.ToInt32(Session["userId"])).ToString();
            }
            else
            {
                lbLoginOrLogout.Text = "Login";
                Session["cartCount"] = "0";
            }
        }

        protected void lbLoginOrLogout_Click(object sender, EventArgs e)
        {
            if (Session["userid"]==null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Session.Abandon();
                Response.Redirect("Login.aspx");
            }
        }

        protected void lbRegisterOrProfile_Click(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                lbLoginOrLogout.ToolTip = "User Profile";
                Response.Redirect("Profile.aspx");
            }
            else
            {
                lbLoginOrLogout.ToolTip = "User Registration";
                Response.Redirect("Registration.aspx");
            }
        }
    }
}