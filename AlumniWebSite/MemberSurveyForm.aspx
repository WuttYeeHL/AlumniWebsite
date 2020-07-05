<%@ Page Title="" Language="C#" MasterPageFile="~/MemberMasterPage.master" AutoEventWireup="true" CodeFile="MemberSurveyForm.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <%--<form id="form1" runat="server">--%>
       <%--<section id="mu-course-content" style="border:1px solid red;">--%>
           <%-- <link href="ApplicationForm/bootstrap/css/bootstrap.css" rel="stylesheet" />--%>

    <%--<script src="ApplicationForm/bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="ApplicationForm/bootstrap/js/bootstrap.min.js"></script>--%>
    

    <style>
        #backGround {
            background-image: url('http://localhost:65167/assets/images/img.jpg');
            background-size: 100% 100%;
            background-repeat: no-repeat;
            opacity: 1;
            width: 100%;
            height: 100%;
        }

        .auto-style2 {
            height: 20px;
        }

        @media screen and (max-width: 999px) {

            #divFieldset {
                float: left;
                width: 100%;
                height: 100%;
                overflow: initial;
                text-align: center;
                text-overflow: ellipsis;
                white-space: nowrap;
                margin-left: 10%;
                margin-right: 10%;
                border: dashed solid #4cff00;
            }

            .fieldset {
                margin-right: 3%;
            }
        }

        @media screen and (max-width:720px) {
            #divFieldset {
                float: left;
                width: 100%;
                height: 100%;
                overflow: initial;
                text-align: center;
                text-overflow: ellipsis;
                white-space: nowrap;
                margin-left: 10%;
                margin-right: 10%;
                border: dashed solid #4cff00;
            }

            .fieldset {
                margin-right: 3%;
            }
        }

        @media screen and (max-width:480px) {
            #divFieldset {
                float: left;
                width: 100%;
                height: 100%;
                overflow: initial;
                text-align: center;
                text-overflow: ellipsis;
                white-space: nowrap;
                margin-left: 10%;
                margin-right: 10%;
                border: dashed solid #4cff00;
            }

            .fieldset {
                margin-right: 3%;
            }
        }
        /*.required {
            color: red;
            font-size: larger;
        }*/

        fieldset {
            border: 1px solid #ddd !important;
            margin: 0;
            /*xmin-width: 0;*/
            padding: 10px;
            position: relative;
            border-radius: 4px;
            background-color: #f5f5f5;
            padding-left: 10px!important;
            font-weight:00;
        }

        legend {
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 0px;
            width: 35%;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 5px 5px 5px 10px;
            background-color: #ffffff;
        }
    </style>
            <div class="container" style="background-color:white; border-radius: 5px;">
                <div class="panel panel-default" style="height:100%;width:100%;">
                    <%--<div class="panel-heading" style="font-size:25px;text-align:center;background-color:#abd2dd;color:#086f5f;">Alumni Survey Form</div>--%>
                    <div class="panel-heading" style="font-size:25px;text-align:center;background-color:#008fa0;color:white;">Alumni Survey Form</div>
                     <%--<div class="panel-body" style="background-color:#bceded">--%>
                    <div class="panel-body">
                        <fieldset class="col-md-6" style="width:100%;">
                            <legend style="background-color:#17a2b2;color:white;">Information Details</legend>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <table style="width:100%;">
                                                <tr style="height:50px;width:100%;">
                                                    <td style="width:30%;"><asp:Label ID="Label1" runat="server">Roll No</asp:Label></td>
                                                    <td style="width:70%">
                                                        <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control" Style="width: 200px; float: left"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr style="height:50px;width:100%;">
                                                    <td style="width:30%;"><asp:Label ID="Label4" runat="server">NRC</asp:Label></td>
                                                     <td style="width:70%">
                                                         <asp:TextBox ID="txtNrc" runat="server" CssClass="form-control" Style="width: 200px; float: left" ></asp:TextBox>                                          
                                                    </td>
                                                </tr>
                                                 <tr style="height:50px;width:100%;">
                                                    <td style="width:30%;"><asp:Label ID="Label5" runat="server">Degree</asp:Label></td>
                                                    <td style="width:70%">
                                                        <asp:TextBox ID="txtDegree" runat="server" CssClass="form-control" Style="width: 200px; float: left" onkeypress="return isEnglishOnly(event)"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr style="height:50px;width:100%;">
                                                    <td style="width:30%;"><asp:Label ID="Label16" runat="server">Email</asp:Label></td>
                                                    <td style="width:70%">
                                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Style="width: 200px; float: left" onkeypress="return isEnglishOnlyforEmail(event)"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                        <div class="col-md-6">
                                            <table style="width:100%;">
                                                <tr style="height:50px;width:100%;">
                                                    <td style="width:30%;"><asp:Label ID="Label3" runat="server">Name</asp:Label></td>
                                                    <td style="width:70%">
                                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Style="width: 200px; float: left;" onkeypress="return isEnglishOnly(event)"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr style="height:50px;width:100%;">
                                                   <td style="width:30%;"><asp:Label ID="Label11" runat="server">Gender</asp:Label></td>
                                                    <td style="width:70%">
                                                        <asp:TextBox ID="txtGender" runat="server" CssClass="form-control" Style="width: 200px; float: left;" onkeypress="return isEnglishOnly(event)"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr style="height:50px;width:100%;">
                                                    <td style="width:30%;"><asp:Label ID="Label10" runat="server">Graduated University</asp:Label></td>
                                                    <td style="width:70%">
                                                         <asp:TextBox ID="txtGraduatedUniversity" runat="server" CssClass="form-control" Style="width: 200px; float: left" onkeypress="return isEnglishOnly(event)"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                 <tr style="height:50px;width:100%;">
                                                    <td style="width:30%;"><asp:Label ID="Label15" runat="server">Mobile Number</asp:Label></td>
                                                    <td style="width:70%">
                                                         <asp:TextBox ID="txtPhoneNo" runat="server" CssClass="form-control" Style="width: 200px; float: left" MaxLength="11" onkeypress="return isEnglishOnlyforNumber(event)" placeholder="09xxxxxxxxx"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <div class="clearfix"></div>
                    </div>

                    <asp:ScriptManager ID="ScriptManager1" runat="server" />
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                    <ContentTemplate>
                            <div class="panel-body">
                                <fieldset class="col-md-6" style="width: 100%;">
                                    <legend style="background-color:#17a2b2;color:white;">Batch Details</legend>
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label2" runat="server">Institute</asp:Label></td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlInstitutes" runat="server" CssClass="btn-block" style="height:30px" AutoPostBack="true" OnSelectedIndexChanged="instituteSelected_SelectedIndexChanged">
                                                                <asp:ListItem>---Select---</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </div>
                                                <div class="col-md-4">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label6" runat="server">Course</asp:Label></td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlCourses" runat="server" AutoPostBack="true" CssClass="btn-block" style="height:30px">
                                                                <asp:ListItem>---Select---</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </div>
                                                <div class="col-md-4">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label7" runat="server">Batch</asp:Label></td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlBatch" runat="server" AutoPostBack="true" CssClass="btn-block" style="height:30px">
                                                                <asp:ListItem>---Select---</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </fieldset>
                                <div class="clearfix"></div>
                            </div>
                     </ContentTemplate>
                     <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlCourses" EventName="SelectedIndexChanged" />
                     </Triggers>
                    </asp:UpdatePanel>
                    
                    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                    <ContentTemplate>
                    <div class="panel-body">
                        <fieldset class="col-md-6" style="width: 100%;">
                            <legend style="background-color:#17a2b2;color:white;">Current Employment Details</legend>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row">
                                       
                                        <div class="col-md-3">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label9" runat="server"> Position</asp:Label></td>
                                                <td>
                                                    <asp:DropDownList ID="ddlCurrentPosition" runat="server" AutoPostBack="true" CssClass="btn-block" style="height:30px">
                                                        <asp:ListItem>---Select---</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </div>
                                        <div class="col-md-3">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label13" runat="server"> Sector</asp:Label></td>
                                                <td>
                                                    <asp:DropDownList ID="ddlCurrentSector" runat="server" AutoPostBack="true" CssClass="btn-block" style="height:30px">
                                                        <asp:ListItem>---Select---</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </div>
                                        <div class="col-md-3">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblSalary" runat="server">Salary</asp:Label></td>
                                                <td>
                                                    <%--<asp:TextBox ID="txtSalary" runat="server" onkeypress="return isEnglishOnlyforNumber(event)" CssClass="form-control" Style="width: 200px; float: left" placeholder="Enter only myanmar kyats."></asp:TextBox>--%>
                                                    <asp:DropDownList ID="ddlSalary" runat="server"  AutoPostBack="true" CssClass="btn-block" Width="200px">
                                                        <asp:ListItem>---Select---</asp:ListItem>
                                                        <asp:ListItem>100,000-500,000</asp:ListItem>
                                                        <asp:ListItem>500,000-1,000,000</asp:ListItem>
                                                        <asp:ListItem>1,000,000-1,500,000</asp:ListItem>
                                                        <asp:ListItem>1,500,000-2,000,000</asp:ListItem>
                                                        <asp:ListItem>2,000,000-2,500,000</asp:ListItem>
                                                        <asp:ListItem>2,500,000-3,000,000</asp:ListItem>
                                                        <asp:ListItem>3,500,000-4,000,000</asp:ListItem>
                                                        <asp:ListItem>4,500,000-5,000,000</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                               
                                            </tr>
                                        </div>
                                         <div class="col-md-3">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label8" runat="server">Company Name</asp:Label></td>
                                                <td>
                                                    <asp:TextBox ID="txtCurrentCompanyName" runat="server" onkeypress="return isEnglishOnly(event)" CssClass="form-control" Style="width: 200px; float: left"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </div>
                                        
                                    </div>

                                </div>
                            </div>
                        </fieldset>
                        <div class="clearfix"></div>
                    </div>
                     </ContentTemplate>
                     <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlCurrentPosition"  />
                     </Triggers>
                    </asp:UpdatePanel>
                    <div class="panel-body" style="background-color:#008fa0;height:70px;">
                        <div class="row">
                            <div class="col-md-12" style="text-align: center">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn-default" Text="Submit" Style="width: 100px; height: 40px; border-radius: 3px 4px; border-color: #abd2dd; font-weight: bolder; background-color: #abd2dd; color: #086f5f" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnUpdate" runat="server" CssClass="btn-default" Text="Update" Style="width: 100px; height: 40px; border-radius: 3px 4px; border-color: #abd2dd; font-weight: bolder; background-color: #abd2dd; color: #086f5f" OnClick="btnUpdate_Click" />
                                <asp:Button ID="btnCancel" runat="server" CssClass="btn-default" Text="Cancel" Style="width: 100px; height: 40px; border-radius: 3px 4px; border-color: #abd2dd; font-weight: bolder; background-color: #abd2dd; color: #086f5f" OnClick="btnCancel_Click"/>
                            </div>
                        </div>

                        <div class="row" style="height: 30px"></div>
                    </div>
                </div>
           </div>
           <%-- </section>--%>
    <%--</form>--%>
</asp:Content>

