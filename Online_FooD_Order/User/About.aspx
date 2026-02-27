<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Online_FooD_Order.User.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- about section -->

    <section class="about_section layout_padding">
        <div class="container  ">

            <div class="row">
                <div class="col-md-6 ">
                    <div class="img-box">
                        <img src="../Template/images/about-img.png" alt="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="detail-box">
                        <div class="heading_container">
                            <h2>We Are Foodie
                            </h2>
                        </div>
                        <p>
                            Foodie is a modern food ordering platform built to make discovering and enjoying great food simple and convenient. We partner with trusted restaurants to deliver fresh, high-quality meals straight to your doorstep.

Our focus is on speed, reliability, and a smooth user experience—so you can place your order with confidence and enjoy your food without hassle.
                        </p>
                        <a href="Default.aspx">Read More
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- end about section -->
</asp:Content>
