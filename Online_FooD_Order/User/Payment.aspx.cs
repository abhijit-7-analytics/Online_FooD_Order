using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_FooD_Order.User
{
    public partial class Payment : System.Web.UI.Page
    {
        SqlConnection con;

        SqlCommand cmd;
        DataTable dt;
        SqlDataReader dr, dr1;
        SqlTransaction transaction = null;
        string _name = string.Empty; string _cardNo = string.Empty; string _expiryDate = string.Empty;
        string _cvv = string.Empty; string _address = string.Empty; string _paymentMode = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userId"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void lbCardSubmit_Click(object sender, EventArgs e)
        {
            _name = txtName.Text.Trim();
            _cardNo = txtCardNo.Text.Trim();
            _cardNo = string.Format("************{0}", txtCardNo.Text.Trim().Substring(12, 4));
            _expiryDate = txtExpMonth.Text.Trim() + "/" + txtExpYear.Text.Trim();
            _cvv = txtCvv.Text.Trim();
            _address = txtAddress.Text.Trim();
            _paymentMode = "card";
            if (Session["userId"] != null)
            {
                OrderPayment(_name, _cardNo, _expiryDate, _cvv, _address, _paymentMode);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }



        protected void lbCodSubmit_Click(object sender, EventArgs e)
        {
            _address = txtCODAddress.Text.Trim();
            _paymentMode = "cod";
            if (Session["userId"] != null)
            {
                OrderPayment(_name, _cardNo, _expiryDate, _cvv="", _address, _paymentMode);


            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        void OrderPayment(string name, string cardNo, string expiry,
                  string cvv, string address, string mode)
        {
            int paymentId;
            DataTable orderTable = CreateOrderTable();

            using (SqlConnection con = new SqlConnection(Conection.GetConnectionString()))
            {
                con.Open();

                // 1️⃣ SAVE PAYMENT
                using (SqlCommand cmd = new SqlCommand("Save_Payment", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Name", (object)name ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@CardNo", (object)cardNo ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@ExpiryDate", (object)expiry ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Cvv", (object)cvv ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@PaymentMode", mode);

                    SqlParameter outId = new SqlParameter("@InsertedId", SqlDbType.Int);
                    outId.Direction = ParameterDirection.Output;
                    cmd.Parameters.Add(outId);

                    cmd.ExecuteNonQuery();
                    paymentId = Convert.ToInt32(outId.Value);
                }

                // 2️⃣ BUILD ORDER TABLE FROM CART
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT ProductId, Quantity FROM Carts WHERE UserId = @UserId", con))
                {
                    cmd.Parameters.AddWithValue("@UserId", Session["userId"]);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            orderTable.Rows.Add(
                                Utils.GetUniqueId(),
                                dr["ProductId"],
                                dr["Quantity"],
                                Session["userId"],
                                "Pending",
                                paymentId,
                                DateTime.Now
                            );
                        }
                    }
                }

                // 3️⃣ SAVE ORDERS
                if (orderTable.Rows.Count > 0)
                {
                    using (SqlCommand cmd = new SqlCommand("Save_Orders", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@tblOrders", orderTable);
                        cmd.ExecuteNonQuery();
                    }
                }

                // 4️⃣ CLEAR CART
                ClearCart(con);
            }

            Response.Redirect("Invoice.aspx?id=" + paymentId);
        }

        DataTable CreateOrderTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("OrderNo", typeof(string));
            dt.Columns.Add("ProductId", typeof(int));
            dt.Columns.Add("Quantity", typeof(int));
            dt.Columns.Add("UserId", typeof(int));
            dt.Columns.Add("Status", typeof(string));
            dt.Columns.Add("PaymentId", typeof(int));
            dt.Columns.Add("OrderDate", typeof(DateTime));
            return dt;
        }

       


        //void OrderPayment(string name, string cardNo, string expiry,string cvv, string address, string mode)
        //{
        //    int paymentId;

        //    using (SqlConnection con = new SqlConnection(Conection.GetConnectionString()))
        //    {
        //        con.Open();

        //        //  SAVE PAYMENT
        //        using (SqlCommand cmd = new SqlCommand("Save_Payment", con))
        //        {
        //            cmd.CommandType = CommandType.StoredProcedure;

        //            cmd.Parameters.AddWithValue("@Name", (object)name ?? DBNull.Value);
        //            cmd.Parameters.AddWithValue("@CardNo", (object)cardNo ?? DBNull.Value);
        //            cmd.Parameters.AddWithValue("@ExpiryDate", (object)expiry ?? DBNull.Value);
        //            cmd.Parameters.AddWithValue("@Cvv", (object)cvv ?? DBNull.Value);
        //            cmd.Parameters.AddWithValue("@Address", address);
        //            cmd.Parameters.AddWithValue("@PaymentMode", mode);

        //            SqlParameter outId = new SqlParameter("@InsertedId", SqlDbType.Int);
        //            outId.Direction = ParameterDirection.Output;
        //            cmd.Parameters.Add(outId);

        //            cmd.ExecuteNonQuery();
        //            paymentId = Convert.ToInt32(outId.Value);
        //        }

        //        //  CLEAR CART
        //        ClearCart(con);
        //    }

        //    lblMsg.Text = "Order placed successfully. Cart cleared.";
        //    lblMsg.CssClass = "alert alert-success";
        //    lblMsg.Visible = true;

        //    Response.Redirect("Invoice.aspx?id=" + paymentId);
        //}



        void ClearCart(SqlConnection con)
        {
            using (SqlCommand cmd = new SqlCommand("Cart_Crud", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "CLEAR");
                cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
                cmd.ExecuteNonQuery();
            }
        }


    }
}