using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.IO;

namespace Online_FooD_Order.Admin
{
    public partial class Category : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter sda;
        SqlCommand cmd;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "Category";
                if (Session["admin"] == null)
                {
                    Response.Redirect("../User/Login.aspx");
                }
                else
                {

                getCategories();
                }
            }
            lblMsg.Visible = false;
        }

        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {
            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExecute = false;
            int categoryId = Convert.ToInt32(hdnId.Value);
            con = new SqlConnection(Conection.GetConnectionString());
            cmd = new SqlCommand("Category_Crud", con);
            cmd.Parameters.AddWithValue("@Action", categoryId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@CategoryId", categoryId);
            cmd.Parameters.AddWithValue("@Name", txtname.Text.Trim());
            cmd.Parameters.AddWithValue("@IsActive", cbIsActive.Checked);


            if (foodimage.HasFile)
            {
                if (Utils.IsValidExtension(foodimage.FileName))
                {
                    Guid obj = Guid.NewGuid();
                    fileExtension = Path.GetExtension(foodimage.FileName);
                    imagePath = "Images/Category/" + obj.ToString() + fileExtension;
                    foodimage.PostedFile.SaveAs(Server.MapPath("~/Images/Category/") + obj.ToString() + fileExtension);
                    cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
                    isValidToExecute = true;
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Please select .jpg, .jpeg or .png image";
                    lblMsg.CssClass = "alert alert-danger";
                    isValidToExecute = false;
                }
            }
            else
            {
                isValidToExecute = true;
            }

            if (isValidToExecute)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    actionName = categoryId == 0 ? "inserted" : "updated";
                    lblMsg.Visible = true;
                    lblMsg.Text = "Category " + actionName + " successfully!";
                    lblMsg.CssClass = "alert alert-success";
                    getCategories();
                    clear();
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

        private void getCategories()
        {
            con = new SqlConnection(Conection.GetConnectionString());
            cmd = new SqlCommand("Category_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rCategry.DataSource = dt;
            rCategry.DataBind();
        }


        private void clear()
        {
            txtname.Text = string.Empty;
            cbIsActive.Checked = false;
            hdnId.Value = "0";
            btnAddOrUpdate.Text = "Add";
            imageCatagory.ImageUrl = string.Empty;

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }

        protected void rCategry_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lblMsg.Visible = true;
             con = new SqlConnection(Conection.GetConnectionString());
            if(e.CommandName == "edit")
            {
                cmd = new SqlCommand("Category_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "GETBYID");
                cmd.Parameters.AddWithValue("@CategoryId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                txtname.Text = dt.Rows[0]["Name"].ToString();
                cbIsActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"]);
                imageCatagory.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["ImageUrl"].ToString()) ? "../Images/No_image.png" : "../" + dt.Rows[0]["ImageUrl"].ToString();
                imageCatagory.Height = 200;
                imageCatagory.Width = 200;
                hdnId.Value = dt.Rows[0]["CategoryId"].ToString();
                btnAddOrUpdate.Text = "Update";
                LinkButton btn = e.Item.FindControl("lnkEdit") as LinkButton;
                btn.CssClass = "badge badge-warning";

            }
            else if (e.CommandName == "delete")
            {
                
                cmd = new SqlCommand("Category_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@CategoryId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Category deleted successfully!";
                    lblMsg.CssClass = "alert alert-success";
                    getCategories();
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error-" + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }
            }

        }

        protected void rCategry_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbl = e.Item.FindControl("lblIsActive") as Label;
                if (lbl.Text == "True")
                {
                    lbl.Text = "Active";
                    lbl.CssClass = "badge badge-success";
                }
                else
                {
                    lbl.Text = "In-Active";
                    lbl.CssClass = "badge badge-danger";
                }
            }

        }
    }
}