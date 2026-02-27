<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OrderStatus.aspx.cs" Inherits="Online_FooD_Order.Admin.OrderStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.addEventListener("load", function () {
            var seconds = 5;

            setTimeout(function () {
                var msg = document.getElementById("ContentPlaceHolder1_lblMsg");
                if (msg) {
                    msg.style.display = "none";
                }
            }, seconds * 1000);
        });
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pcodede-inner-content pt-0">
        <div class=" align-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>
        <div class=" main-body ">
            <div class=" page-wrapper">
                <div class=" page-body">
                    <div class="row">
                        <div class="col-sm-12 ">
                            <div class="card">
                                <div class="card-header">
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-8 col-lg-8">
                                            <h4 class="sub-title">Order List</h4>


                                            <div class="card-block table-border-style">
                                                <div class=" table-responsive">
                                                    <asp:Repeater ID="rOrderStatus" runat="server" OnItemCommand="rOrderStatus_ItemCommand">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>

                                                                    <tr>
                                                                        <th class="table-plus">Order No.</th>
                                                                        <th>Order Date</th>
                                                                        <th>Status</th>
                                                                        <th>Product Name</th>
                                                                        <th>Total Price</th>
                                                                        <th>Payment Mode</th>
                                                                        <th>Edit</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="table-plus">
                                                                    <%# Eval("OrderNo") %> 

                                                                </td>
                                                                <td>
                                                                    <%# Eval("OrderDate") %>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblStatus" runat="server"
                                                                        Text='<%# Eval("Status") %>' CssClass='<%# Eval("Status").ToString() =="Delivered"?"badge badge-success":"badge badge-danger" %>'>
                                                                    </asp:Label>

                                                                </td>

                                                                <td>
                                                                    <%# Eval("Name") %> </td>

                                                                <td>
                                                                    <%# Eval("TotalPrice") %> </td>

                                                                <td>
                                                                    <%# Eval("PaymentMode") %> 

                                                                </td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CssClass="badge badge-primary" CommandArgument='<%# Eval("OrderDetailsId") %>' CommandName="edit"><i class="ti-pencil"></i></asp:LinkButton>

                                                                </td>

                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="col-sm-6 col-md-4 col-lg-4 mobile-inputs">
                                            <asp:Panel ID="pUpdateOrderStatus" runat="server">
                                                <h4 class="sub-title">Update Status</h4>
                                                <div>
                                                    <div class="form-group">
                                                        <label>Order Status</label>
                                                        <div>

                                                            <asp:DropDownList ID="ddlOrderStatus" runat="server" CssClass="form-control">
                                                                <asp:ListItem Value="0">
                                                                --Select Status--
                                                                </asp:ListItem>
                                                                <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                                                <asp:ListItem Value="Dispatched">Dispatched</asp:ListItem>
                                                                <asp:ListItem Value="Delivered">Delivered</asp:ListItem>

                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="please select delivery status" ControlToValidate="ddlOrderStatus" CssClass="text-danger" Display="Dynamic" SetFocusOnError="true" InitialValue="0">

                                                            </asp:RequiredFieldValidator>
                                                            <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                        </div>

                                                    </div>



                                                    <div class="pb-5">
                                                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary rounded-3" OnClick="btnUpdate_Click" />
                                                        &nbsp;
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger  rounded-3" CausesValidation="false" OnClick="btnCancel_Click" />

                                                    </div>

                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
