<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Online_FooD_Order.User.Login" %>

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

    <section class="booK_section layout_padding">
        <div class=" container">
            <div class=" heading_container ">
                <div class="align-self-end">
                    <asp:Label runat="server" ID="lblMsg"></asp:Label>
                </div>

                <h2 class=" pl-3">Login</h2>


            </div>
            <div class=" row">
                <div class="col-md-4">
                    <div class=" form_container">
                        <img id="UserLogin" alt="Login image" src="../Images/Login.png" width="370" class="img-thumbnail" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class=" form_container">
                        <div class="pt-5">
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="revUsername" runat="server" ErrorMessage="User name required" CssClass="text-danger" Display="Dynamic" Font-Size="Small" ControlToValidate="txtUsername" SetFocusOnError="true"></asp:RequiredFieldValidator>

                        </div>
                        <div class="pt-3">
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="revUserpass" runat="server" ErrorMessage="Password required" CssClass="text-danger " Font-Size="Small" Display="Dynamic" ControlToValidate="txtPassword" SetFocusOnError="true"></asp:RequiredFieldValidator>

                        </div>
                        <div class="btn_box pt-4">
                            <asp:Button ID="btnLogin" runat="server"
                                Text="Login"
                                CssClass="btn btn-success w-100 text-white" OnClick="btnLogin_Click" />
                        </div>

                        <div class="pt-3 text-info">
                            New User?<a href="Registration.aspx" class="badge badge-info">Register Here..</a>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </section>
</asp:Content>
