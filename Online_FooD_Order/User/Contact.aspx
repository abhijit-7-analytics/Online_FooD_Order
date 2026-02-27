<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Online_FooD_Order.User.Contact" %>

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

    <!-- book section -->
   <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label runat="server" ID="lblMsg"></asp:Label>
                </div>
                <h2>Send Your Query</h2>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">

                        <div>

                            <asp:TextBox ID="txtName" runat="server" CssClass=" form-control" placeholder="Your Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Name is Required" ControlToValidate="txtName" Display="Dynamic" SetFocusOnError="true" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass=" form-control" placeholder="Your Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Email is Required" ControlToValidate="txtEmail" Display="Dynamic" SetFocusOnError="true" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:TextBox ID="txtSubject" runat="server" CssClass=" form-control" placeholder="Subject" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Subject is Required" ControlToValidate="txtSubject" Display="Dynamic" SetFocusOnError="true" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:TextBox ID="txtMessage" runat="server" CssClass=" form-control" placeholder="Enter Your Query/Feedback" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Message is Required" ControlToValidate="txtMessage" Display="Dynamic" SetFocusOnError="true" CssClass="text-danger"></asp:RequiredFieldValidator>

                        </div>
                        
                        <div class="btn_box">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-warning rounded-pill pl-4 pr-4 text-white" OnClick="btnSubmit_Click"/>
                        </div>

                    </div>
                </div>
                <div class="col-md-6">
                    <div class="map_container ">
                        <div id="googleMap"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end book section -->

</asp:Content>
