<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Online_FooD_Order.User.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .offer_section .box .img-box {
            width: 140px;
            height: 140px;
            min-width: 140px;
            min-height: 140px;
            border-radius: 50%;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 4px solid #f4b41a;
        }

            /* Image */
            .offer_section .box .img-box img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- offer section -->
    <section class="offer_section layout_padding-bottom">
        <div class="offer_container">
            <div class="container ">
                <div class="row">

                    <asp:Repeater ID="rCategry" runat="server">
                        <ItemTemplate>

                            <div class="col-md-6  ">
                                <div class="box">
                                    <div class="img-box">
                                        <a href="Menu.aspx?id=<%# Eval("CategoryId") %>">

                                            <img src="<%# Online_FooD_Order.Utils.GetImageUrl(Eval("ImageUrl")) %>" alt="">
                                        </a>
                                    </div>
                                    <div class="detail-box">
                                        <h5>Tasty Thursdays
                                        </h5>
                                        <h6>
                                            <span>20%</span> Off
                                        </h6>
                                        <a href="Menu.aspx?id=<%# Eval("CategoryId") %>">Order Now
                                    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background: new 0 0 456.029 456.029;" xml:space="preserve">
                                        <g>
                                            <g>
                                                <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                     c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                            </g>
                                        </g>
                                        <g>
                                            <g>
                                                <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                     C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                     c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                     C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                            </g>
                                        </g>
                                        <g>
                                            <g>
                                                <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                     c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                            </g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                    </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>
        </div>
    </section>

    <!-- end offer section -->

    <!-- food section -->

<section class="food_section layout_padding-bottom">
        <div class="container">
            <div class="heading_container heading_center">

                <div class=" align-self-end">
                    <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                </div>
                <h2>Our Menu
                </h2>
            </div>

            <ul class="filters_menu">
                <li class="active" data-filter="*" data-id="0">All</li>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                <li data-filter=".<%# Regex.Replace(Eval("Name").ToString().ToLower(),@"\s+","") %>" data-id="<%# Eval("CategoryId") %>"" >
                    <%# Eval("Name") %></li>

                    </ItemTemplate>
                </asp:Repeater>

            </ul>

            <div class="filters-content">
                <div class="row grid">
                    <asp:Repeater ID="rProduct" runat="server" OnItemCommand="rProduct_ItemCommand" >
                           <ItemTemplate>

                            <div class="col-sm-6 col-lg-4 all <%# Regex.Replace(Eval("CategoryName").ToString().ToLower(),@"\s+","") %>">
                                <div class="box">
                                    <div>
                                        <div class="img-box">
                                            <img src="<%# Online_FooD_Order.Utils.GetImageUrl(Eval("ImageUrl")) %>" alt="">
                                        </div>
                                        <div class="detail-box">
                                            <h5>
                                                <%# Eval("Name") %></h5>
                                            <p>
                                               <%# Eval("Description") %>
                                            </p>
                                            <div class="options">
                                                <h6>₹<%# Eval("Price") %></h6>
                                                <asp:LinkButton ID="lbAddToCart" runat="server" CommandArgument='<%# Eval("ProductId") %>' CommandName="addToCart">

                                                    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background: new 0 0 456.029 456.029;" xml:space="preserve">
                                                        <g>
                                                            <g>
                                                                <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                        c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                                            </g>
                                                        </g>
                                                        <g>
                                                            <g>
                                                                <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                        C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                        c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                        C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                                            </g>
                                                        </g>
                                                        <g>
                                                            <g>
                                                                <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                        c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                                            </g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                        <g>
                                                        </g>
                                                    </svg>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>


                </div>
            </div>
            <div class="btn-box">
                <a href="Menu.aspx">View More
                </a>
            </div>
        </div>
    </section>

    <!-- end food section -->

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
                        <a href="#">Read More
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- end about section -->

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
                            <asp:TextBox ID="txtSubject" runat="server" CssClass=" form-control" placeholder="Subject"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Subject is Required" ControlToValidate="txtSubject" Display="Dynamic" SetFocusOnError="true" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:TextBox ID="txtMessage" runat="server" CssClass=" form-control" placeholder="Enter Your Query/Feedback" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Message is Required" ControlToValidate="txtMessage" Display="Dynamic" SetFocusOnError="true" CssClass="text-danger"></asp:RequiredFieldValidator>

                        </div>

                        <div class="btn_box">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-warning rounded-pill pl-4 pr-4 text-white" OnClick="btnSubmit_Click" />
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

    <!-- client section -->

    <section class="client_section layout_padding-bottom">
        <div class="container">
            <div class="heading_container heading_center psudo_white_primary mb_45">
                <h2>What Says Our Customers
                </h2>
            </div>
            <div class="carousel-wrap row ">
                <div class="owl-carousel client_owl-carousel">
                    <div class="item">
                        <div class="box">
                            <div class="detail-box">
                                <p>
                                    Foodie has completely changed how I order food. The app is easy to use, delivery is always on time, and the food arrives fresh and hot. I love the variety of restaurants available—it saves me time and effort every day.
                                </p>
                                <h6>Abhijit Sahoo
                                </h6>
                                <p>
                                   Dreamer
                                </p>
                            </div>
                            <div class="img-box">
                                <img src="../assets/images/Abhijit.jpeg" alt="" class="box-img">
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="box">
                            <div class="detail-box">
                                <p>
                                    I’ve tried many food delivery platforms, but Foodie stands out for its reliability and service quality. The ordering process is smooth, payments are secure, and customer support is quick to respond whenever needed.
                                </p>
                                <h6>Anuradha Jena
                                </h6>
                                <p>
                                    Content Creater
                                </p>
                            </div>
                            <div class="img-box">
                                <img src="../assets/Anuradha.jpg" alt="" class="box-img">
                                <%--<img src="../Template/images/Client1.jpg" alt="" class="box-img">--%>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- end client section -->


</asp:Content>
