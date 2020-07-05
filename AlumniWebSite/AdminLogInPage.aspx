<%@ Page Title="" Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="AdminLogInPage.aspx.cs" Inherits="AdminLogInPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       
    <link href="Login/logincss/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="Login/logincss/font-awesome.css" rel="stylesheet" />
    <div>
        <div class="main agileits-w3layouts">
            <%--<h1>Smooth Sliding Forms</h1>--%>
            <div class="main-agileinfo">
                <div class="agileui-forms">
                    <div class="container-form">
                        <div class="form-item log-in">
                            <!-- login form-->
                            <div class="w3table agileinfo">
                                <div class="w3table-cell register">
                                    <div class="w3table-tophead">
                                        <h2>Sign in</h2>
                                        <br />
                                    </div>

                                    <form action="#" method="post">
                                        <div class="fields-grid">
                                            <div class="styled-input agile-styled-input-top">
                                                <asp:TextBox ID="txtName" runat="server" Height="35px"></asp:TextBox>
                                                <label>Username</label>
                                                <span></span>
                                            </div>
                                            <div class="styled-input">
                                                <asp:TextBox ID="txtPassword" runat="server" Height="35px" TextMode="Password"></asp:TextBox>
                                                <label>Password</label>
                                                <span></span>
                                            </div>
                                            <%--<a href="#">forgot password?</a>--%>
                                                    <%--<input type="submit" value="Sign in">--%>
                                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                            <asp:Button ID="btnSingIn" runat="server" Text="Sign in" OnClick="btnSingIn_Click1" />
                                            <br />
                                            <br />
                                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container-info">
                        <div class="info-w3lsitem">
                        </div>
                        <div class="info-w3lsitem">
                        </div>
                        <div class="clear"></div>
                    </div>

                    
                </div>
            </div>
        </div>
        <!-- //main -->
        <!-- copyright -->
        <%--<div class="copyw3-agile">
                    <p>© 2017 Smooth Sliding Forms . All rights reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts.</a></p>
                </div>--%>
        <!-- //copyright -->
        <!-- js -->
        <%--<script  src=" js/jquery-1.12.3.min.js"></script>--%>
        <script src="Login/loginjs/jquery-1.12.3.min.js"></script>
        <script>
            $(".info-w3lsitem .btn").click(function () {
                $(".main-agileinfo").toggleClass("log-in");
            });
            $(".container-form .btn").click(function () {
                $(".main-agileinfo").addClass("active");
            });
        </script>
        <!-- //js -->

    </div>

</asp:Content>

