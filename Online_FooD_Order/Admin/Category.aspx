<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Online_FooD_Order.Admin.Category" %>

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


    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $("#<%=imageCatagory.ClientID%>").prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
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
                                        <div class="col-sm-6 col-md-4 col-lg-4">
                                            <h4 class="sub-title">Category</h4>
                                            <div>
                                                <div class="form-group">
                                                    <label>Category Name</label>
                                                    <div>
                                                        <asp:TextBox ID="txtname" runat="server" CssClass="form-control" placeholder="Enter Category Name"  ></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtname"></asp:RequiredFieldValidator>
                                                        <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                    </div>

                                                </div>

                                                <div class="form-group">
                                                    <label>Category Image</label>
                                                    <div>
                                                        <asp:FileUpload ID="foodimage" runat="server" CssClass="form-control" onchange="ImagePreview(this);" />
                                                    </div>
                                                </div>
                                                <div class="form-check pl-4">
                                                    <asp:CheckBox ID="cbIsActive" runat="server" CssClass="form-check-input" Text="&nbsp; IsActive" />
                                                </div>
                                                <div class="pb-5">
                                                    <asp:Button ID="btnAddOrUpdate" runat="server" Text="Add" CssClass="btn btn-primary rounded-3" OnClick="btnAddOrUpdate_Click" />
                                                    &nbsp;
                                                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-danger  rounded-3" CausesValidation="false" OnClick="btnClear_Click" />

                                                </div>
                                                <div>
                                                    <asp:Image ID="imageCatagory" runat="server" CssClass="img-thumbnail" />
                                                </div>
                                            </div>
                                        </div>

   <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
        <h4 class="sub-title">Category List</h4>
         <div class="card-block table-border-style">
               <div class=" table-responsive">
                    <asp:Repeater ID="rCategry" runat="server" OnItemCommand="rCategry_ItemCommand" OnItemDataBound="rCategry_ItemDataBound">
                            <HeaderTemplate>
                              <table class="table data-table-export table-hover nowrap">
                                     <thead>

                                                                
                                     <tr>
                               <th class="table-plus">Name</th>
                                <th>Image</th>
                                  <th>IsActive</th>
                                <th>CreatedDate</th>
                                 <th class="datatable-nosort">Action</th>
                               </tr>
                               </thead>
                                  <tbody>
                                  </HeaderTemplate>
                                    <ItemTemplate>
                                     <tr>
                                      <td class="table-plus"> <%# Eval("Name") %> 

                                         </td>
                                         <td> 
                                                <img alt="Food Image" width="40" src="<%# Online_FooD_Order.Utils.GetImageUrl( Eval("ImageUrl")) %>"" />
                                         </td>
                                                 <td> 
                                                                    <asp:Label ID="lblIsActive" runat="server"
                                                                Text='<%# Eval("IsActive") %>'>
                                                                    </asp:Label>

                                                                </td>
                                                                <td> <%# Eval("CreatedDate") %> </td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkEdit" text="Edit" runat="server" CssClass="badge badge-primary" CommandArgument='<%# Eval("CategoryId") %>' CommandName="edit" CausesValidation="false"><i class="ti-pencil"></i></asp:LinkButton>

                                                                    <asp:LinkButton ID="lnkDelete" text="Delete" runat="server" CssClass="badge badge-danger" CommandArgument='<%# Eval("CategoryId") %>' CommandName="delete" OnClientClick="return confirm('Are you sure ?');">
                                                                        <i class="ti-trash"></i>
                                                                        </asp:LinkButton>
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
