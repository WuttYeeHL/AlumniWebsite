<%@ Page Title="" Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="MemberLogInPage.aspx.cs" Inherits="NewLogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
     <link href="https://fonts.googleapis.com/css?family=Ultra" rel="stylesheet"/>
     <link href="https://fonts.googleapis.com/css?family=Black+Ops+One" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Volkhov" rel="stylesheet"/>
    <style>
        body, html {
            height: 500px;
            font-family: Arial, Helvetica, sans-serif;
            /*background-image:url(Images/our4.jpeg)*/
        }

        * {
            box-sizing: border-box;
        }

        .bg-img {
            /*background-image: url(Images/mloginimg.jpg);*/
            min-height: 380px;
            background-color: white;
            opacity: 0.9;
            /*Center and scale the image nicely*/
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
        }

/* Full-width input fields */
        input[type=text], input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            border: none;
            background: #f1f1f1;
        }
            /*.container{ 
                 background-color: white;
    
     }*/

            input[type=text]:focus, input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }

        /* Set a style for the submit button */
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            width: 100%;
            opacity: 0.9;
        }

            .btn:hover {
                opacity: 1;
                background-color: #485652;
                color: white;
            }
           
    </style>
     <script>
         function myFunction()
         {
             var x = document.getElementById("logindiv");
             var y = document.getElementById("signupdiv");
             if (x.style.display == "none") {
                 x.style.display = "block";
                 y.style.display = "none";
                 return;
             }
             else {
                 x.style.display = "none";
                 y.style.display = "block";
             }
         }

         //$(document).ready(function () {
         //    $("#btnsignup").click(function () {
         //        $("#signupdiv").show();
         //        $("#logindiv").hide();
         //    });
         //});
         //$(document).ready(function () {
         //    $("#btnsignin").click(function () {
         //        $("#signupdiv").hide();
         //        $("#logindiv").show();
         //    });
         //});
    </script>
        <div class="row">
            <div class="col-lg-12" style="background-image: url(Images/mloginimg.jpg); background-size: inherit;">
                <div class="col-lg-8" style="height: 589px;">
                </div>
                <div class="col-lg-3" style="height: 600px;">
                    <%--for login--%>
                    <div id="logindiv" class="bg-img" style="width: 100%; display: block">
                        <h1 style="font-family: 'Volkhov', serif; margin-left: 8px">Login</h1>

                        <label for="rollno" style="color: #8c999a; margin-left: 8px"><b>Roll No.</b></label>
                        <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control" placeholder="Enter Your Roll No." Style="height: 45px;">                     
                        </asp:TextBox>

                        <label for="psw" style="color: #8c999a; margin-left: 8px"><b>Password</b></label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password" Style="height: 45px">                        
                        </asp:TextBox>

                        <asp:Button ID="btnLogin" runat="server" CssClass="btn" Text="Login" Style="margin-top: 15px; margin-left: 8px; width: 90%;" OnClick="btnLogin_Click1" />
                        <%--<button id="btnsignup" class="btn" style="margin-top: 15px; margin-left: 8px; width: 90%;" onclick="myFunction()">Sign Up</button>--%>
                        <div class="text-center p-t-46 p-b-20">
                            <br />
                            <span class="txt2">
                                <a href="#" style="color: #1311ba" onclick="myFunction()">Sign Up</a>
                            </span>
                        </div>
                    </div>
                    <%--for sign up--%>
                    <div id="signupdiv" class="bg-img" style="width: 100%; display: none">
                        <h1 style="font-family: 'Volkhov', serif; margin-left: 8px">Sign Up</h1>

                        <label for="rollno" style="color: #8c999a; margin-left: 8px"><b>Roll No.</b></label>
                        <asp:TextBox ID="txtSignupRollNo" runat="server" CssClass="form-control" placeholder="Enter Your Roll No." Style="height: 45px;">                     
                        </asp:TextBox>

                        <label for="psw" style="color: #8c999a; margin-left: 8px"><b>Password</b></label>
                        <asp:TextBox ID="txtSignUpPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password" Style="height: 45px;">                       
                        </asp:TextBox>

                        <label for="psw" style="color: #8c999a; margin-left: 8px"><b>Comfirm Password</b></label>
                        <asp:TextBox ID="txtSignUpConfirm" runat="server" CssClass="form-control" placeholder="Comfirm Password" TextMode="Password" Style="height: 45px">                       
                        </asp:TextBox>

                        <asp:Button ID="btnSignUp" runat="server" CssClass="btn" Text="Sign Up" Style="margin-top: 15px; margin-left: 8px; width: 90%;" OnClick="btnSignUp_Click" />
                        <%--<button id="btnsignin" class="btn" style="margin-top: 15px; margin-left: 8px; width: 90%;" onclick="myFunction()">Sign In</button>--%>
                        <div class="text-center p-t-46 p-b-20">
                            <br />
                            <span class="txt2">
                                <a href="#" style="color: #1311ba" onclick="myFunction()">Login</a>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-1" style="height: 500px">
                </div>
            </div>
        </div>    
</asp:Content>

