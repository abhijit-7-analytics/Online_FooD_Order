<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Online_FooD_Order.User.Registration" %>

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
                $("#<%=imgUser.ClientID%>").prop('src', e.target.result)
                    .width(200)
                    .height(200);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>User Registration</h2>"></asp:Label>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">

                        <div>

                            <asp:RequiredFieldValidator ID="rfvName" runat="server"
                                ErrorMessage="Name is required" ControlToValidate="txtName"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator ID="revName" runat="server"
                                ErrorMessage="Name must be in characters only" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$">
                            </asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Full Name"
                                ToolTip="Full Name">
                            </asp:TextBox>
                        </div>

                        <div>

                            <asp:RequiredFieldValidator ID="rfvUName" runat="server"
                                ErrorMessage="Userame is required" ControlToValidate="txtUsername"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>

                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"
                                ToolTip="User Name">
                            </asp:TextBox>

                        </div>

                        <div>

                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                ErrorMessage="Email is required" ControlToValidate="txtEmail"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                ErrorMessage="Enter valid email address"
                                ControlToValidate="txtEmail"
                                ForeColor="Red"
                                Display="Dynamic"
                                SetFocusOnError="true"
                                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$">
                            </asp:RegularExpressionValidator>

                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email"
                                ToolTip="Email">
                            </asp:TextBox>

                        </div>
                        <div>

                            <asp:RequiredFieldValidator ID="rvmobile" runat="server"
                                ErrorMessage="Mobile Number is required" ControlToValidate="txtMobile"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator ID="revMobile" runat="server"
                                ErrorMessage="Enter valid mobile number"
                                ControlToValidate="txtMobile"
                                ForeColor="Red"
                                Display="Dynamic"
                                SetFocusOnError="true"
                                ValidationExpression="^[0-9]{10}$">
                            </asp:RegularExpressionValidator>

                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Mobile Number"
                                ToolTip="Mobile Number">
                            </asp:TextBox>

                        </div>




                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form_container">
                        <div>

                            <asp:RequiredFieldValidator ID="rvAddress" runat="server"
                                ErrorMessage="Address is required" ControlToValidate="txtAddress"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>

                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address"
                                ToolTip="Address" TextMode="MultiLine">
                            </asp:TextBox>

                        </div>
                        <div>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ErrorMessage="Postcode is required" ControlToValidate="txtPostCode"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>


                            <asp:RegularExpressionValidator ID="revpost" runat="server"
                                ErrorMessage="Enter valid Postcode"
                                ControlToValidate="txtPostCode"
                                ForeColor="Red"
                                Display="Dynamic"
                                SetFocusOnError="true"
                                ValidationExpression="^[0-9]{6}$">
                            </asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtPostCode" runat="server" CssClass="form-control" placeholder="Enter Postcode"
                                ToolTip="Address">
                            </asp:TextBox>
                        </div>

                        <div>
                            <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" ToolTip="User Image"
                                onchange="ImagePreview(this);" />
                        </div>

                        <div>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required"
                                ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password"
                                ToolTip="Password" TextMode="Password"></asp:TextBox>

                        </div>



                    </div>
                </div>
                <div class="row pl-4">
                    <div class="btn_box">
                        <asp:Button ID="btnRegister" runat="server" Text="Register"
                            CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnRegister_Click" />

                        <asp:Label ID="lblAlreadyUser" runat="server" CssClass="pl-3 text-black-100"
                            Text="Already registered? <a href='Login.aspx' class='badge badge-info'>Login here..</a>">
                        </asp:Label>
                    </div>
                </div>
                <div  class="row p-5">
                    <div style="align-items:center">
                        <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" width="100"/>
                    </div>
                </div>
            </div>

        </div>




    </section>

</asp:Content>
