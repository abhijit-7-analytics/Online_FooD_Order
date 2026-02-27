using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Online_FooD_Order.Admin
{
    public partial class OrderStatus : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter sda;
        SqlCommand cmd;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "Order Status";
                if (Session["admin"] == null)
                {
                    Response.Redirect("../User/Login.aspx");
                }
                else
                {

                    getOrderStatus();
                }
            }
            lblMsg.Visible = false;
            pUpdateOrderStatus.Visible = false;
        }

        private void getOrderStatus()
        {
            con = new SqlConnection(Conection.GetConnectionString());
            cmd = new SqlCommand("Invoice", con);
            cmd.Parameters.AddWithValue("@Action", "GETSTATUS");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rOrderStatus.DataSource = dt;
            rOrderStatus.DataBind();
        }

        protected void rOrderStatus_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lblMsg.Visible = true;
            if (e.CommandName == "edit")
            {
                con = new SqlConnection(Conection.GetConnectionString());
                cmd = new SqlCommand("Invoice", con);
                cmd.Parameters.AddWithValue("@Action", "STATUSBYID");
                cmd.Parameters.AddWithValue("@OrderDetailsId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                // 🔥 SAFE STATUS BINDING (NO CRASH)
                string status = dt.Rows[0]["Status"] == DBNull.Value
                    ? ""
                    : dt.Rows[0]["Status"].ToString().Trim();

                ddlOrderStatus.ClearSelection();
                ListItem li = ddlOrderStatus.Items.FindByValue(status);

                if (li != null)
                    li.Selected = true;
                else
                    ddlOrderStatus.SelectedIndex = 0;

                hdnId.Value = dt.Rows[0]["OrderDetailsId"].ToString();
                pUpdateOrderStatus.Visible = true;
                LinkButton btn = e.Item.FindControl("lnkEdit") as LinkButton;
                btn.CssClass = "badge badge-warning";

            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            pUpdateOrderStatus.Visible = false;

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int orderDetailsId = Convert.ToInt32(hdnId.Value);
            con = new SqlConnection(Conection.GetConnectionString());
            cmd = new SqlCommand("Invoice", con);
            cmd.Parameters.AddWithValue("@Action", "UPDTSTATUS");
            cmd.Parameters.AddWithValue("@OrderDetailsId", orderDetailsId);
            cmd.Parameters.AddWithValue("@Status", ddlOrderStatus.SelectedValue);

            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                lblMsg.Visible = true;
                lblMsg.Text = "Order status updated successfully!";
                lblMsg.CssClass = "alert alert-success";
                getOrderStatus();
            }
            catch (Exception ex)
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Error- " + ex.Message;
                lblMsg.CssClass = "alert alert-danger";
            }
            finally
            {
                con.Close();
            }

        }
    }
}