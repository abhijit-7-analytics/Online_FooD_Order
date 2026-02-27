using Online_FooD_Order.User;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_FooD_Order.Admin
{
    public partial class Report : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter sda;
        SqlCommand cmd;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "Selling Report";
                if (Session["admin"] == null)
                {
                    Response.Redirect("../User/Login.aspx");
                }
                
               
            }


        }
        private void getReports(DateTime fromdate,DateTime todate)
        {
            double grandTotal = 0;
            con = new SqlConnection(Conection.GetConnectionString());
            cmd = new SqlCommand("SellingReport", con);
            cmd.Parameters.AddWithValue("@FromDate", fromdate);
            cmd.Parameters.AddWithValue("@ToDate", todate);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count>0)
            {
                foreach(DataRow dr in dt.Rows)
                {
                    grandTotal += Convert.ToDouble(dr["TotalPrice"]);
                }
                lblTotal.Text = "Sold Cost: ₹" + grandTotal;
                lblTotal.CssClass = "badge badge-danger";
            }
            rReport.DataSource = dt;
            rReport.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DateTime fromdate = Convert.ToDateTime(txtFromdate.Text);
            DateTime todate = Convert.ToDateTime(txtTodate.Text);

            if(todate>DateTime.Now)
            {
                Response.Write("<script>alert('To date cannot be greater than current date');</script>");
            }
            else if(fromdate>todate)
            {
                Response.Write("<script>alert('From date cannot be greater than To date');</script>");
            }
            else
            {
                getReports(fromdate, todate);
            }

        }
    }
}