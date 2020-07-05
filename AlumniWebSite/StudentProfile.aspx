<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StudentProfile.aspx.cs" Inherits="StudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        h1 {
            /*width: 100px;
  height: 100px;*/
            position: relative;
            -webkit-animation: mymove 5s infinite; /* Safari 4.0 - 8.0 */
            -webkit-animation-delay: 5s; /* Safari 4.0 - 8.0 */
            animation: mymove 8s infinite;
            animation-delay: 1s;
        }
                  /* Safari 4.0 - 8.0 */
/*@-webkit-keyframes mymove {
  from {left: 0px;}
  to {left: 100%;}
}

@keyframes mymove {
  from {left: 0px;}
  to {left: 100%;}
}*/
h1 {
    /*font-family: 'Notable';*/font-size: 28px;
    color:#323240;
    /*font-family: 'Black Ops One', cursive;
font-family: 'Monoton', cursive;*/
    /*margin-top:80px;*/
    font-family: 'Bungee Inline', cursive;
}
    </style>

     <form id="Form1" runat="server">
         <div class="row">
           <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="slide1" style="height: 50px; width: 100%; background-color: white;">
                    <h1 style="padding-top: 2px;margin-left:190px;">Student Profile</h1>
                    <p style="font-family:Black Ops One,cursive; margin-left:190px;">This form refers to save the student information and allows only English language.</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2"></div>
           <%-- <asp:ScriptManager ID="ScriptManager1" runat="server" />
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                    <ContentTemplate>--%>
                        <div class="col-md-10" style="padding-top: 20px; font-family:Black Ops One,cursive;">
                 <table style="width: 100%;">
                                <tr style="height: 50px;">
                                    <td style="width: 30%; text-align: left">
                                        <label>Roll No</label></td>
                                    <td style="width: 70%">
                                        <asp:TextBox ID="txtRollNo" runat="server" CssClass="bg-danger form-control" Width="200px" ViewStateMode="Inherit" MaxLength="10" AutoPostBack="True" onkeypress="return isEnglishNumber(event)"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvRollNo" runat="server" ErrorMessage="Require Roll Number" ControlToValidate="txtRollNo" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <%--<asp:CompareValidator ID="CompareValidator1" runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtRollNo" ErrorMessage="Value must be number" ForeColor="Red" />--%>
                                        <%--<asp:RangeValidator ID="rvRollNo" runat="server" ErrorMessage="Only Number!" Type="Integer" MinimumValue="0" MaximumValue="9" ControlToValidate="txtRollNo"></asp:RangeValidator>--%></td>
                                </tr>
                                <tr style="height: 50px;">
                                    <td style="width: 30%; text-align: left">
                                        <label>Name</label></td>
                                    <td style="width: 70%">
                                        <asp:TextBox ID="txtName" runat="server" CssClass="bg-danger form-control" Width="200px" ViewStateMode="Inherit" onkeypress="return isEnglishOnly(event)"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Require the Name !" ControlToValidate="txtRollNo" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr style="height: 50px;">
                                    <td style="width: 30%; text-align: left">
                                        <label>NRC</label></td>
                                    <td style="width: 70%; display: inline;">
                                        <asp:TextBox ID="txtNrcNo" runat="server" CssClass="bg-danger form-control" Width="200px" Style="display: inline;" onkeypress="return isEnglishNumber(event)" PlaceHolder="xx/XXX(X)xxxxxx"></asp:TextBox> 
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNrcNo" ErrorMessage="Require NRC Number" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr style="height: 50px;">
                                    <td style="width: 30%; text-align: left">
                                        <label>Gender</label></td>
                                    <td style="width: 70%">
                                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="bg-danger form-control" Width="200px">
                                            <asp:ListItem>---Select---</asp:ListItem>
                                            <asp:ListItem>Male</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
                                        </asp:DropDownList>
                                     </td>
                                </tr>


                                <tr style="height: 50px;">
                                    <td style="width: 30%; text-align: left">
                                        <label>Institutes</label></td>
                                    <td style="width: 70%">
                                        <asp:DropDownList ID="ddlInstitutes" runat="server" CssClass="bg-danger form-control" Width="200px" AutoPostBack="true" OnSelectedIndexChanged="instituteSelected_SelectedIndexChanged">
                                            <asp:ListItem>---Select---</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>

                                <tr style="height: 50px;">
                                    <td style="width: 30%; text-align: left">
                                        <label>Batch</label></td>
                                    <td style="width: 70%">
                                        <asp:DropDownList ID="ddlBatch" runat="server" CssClass="bg-danger form-control" Width="200px" AutoPostBack="true">
                                            <asp:ListItem>---Select---</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>


                                <tr style="height: 50px;">
                                    <td style="width: 30%; text-align: left">
                                        <label>Courses</label></td>
                                    <td style="width: 70%">
                                        <asp:DropDownList ID="ddlCourses" runat="server" CssClass="bg-danger form-control" Width="200px" AutoPostBack="true">
                                            <asp:ListItem>---Select---</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="text-align: left" class="auto-style1">
                                        <label>Email</label></td>
                                    <td class="auto-style2">
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="bg-danger form-control" Width="200px" ViewStateMode="Inherit" onkeypress="return isEnglishOnlyforEmail(event)"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail" ErrorMessage="Require Email !!" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                            runat="server" ErrorMessage="Please Enter Valid Email ID"
                                            ValidationGroup="vgSubmit" ControlToValidate="txtEmail"
                                            CssClass="requiredFieldValidateStyle"
                                            ForeColor="Red"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                        </asp:RegularExpressionValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="text-align: left" class="auto-style3">
                                        <label>Phone No</label></td>
                                    <td class="auto-style4">
                                        <asp:TextBox ID="txtPhoneNo" runat="server" CssClass="bg-danger form-control" Width="200px" ViewStateMode="Inherit" MaxLength="11" Type="Integer" onkeypress="return isEnglishOnlyforNumber(event)" PlaceHolder="09xxxxxxxxx"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Require!!" ForeColor="Red" ControlToValidate="txtPhoneNo"></asp:RequiredFieldValidator>
                                        <%--<asp:RegularExpressionValidator ID="revPhoneNo" runat="server" ErrorMessage="Invalid Phone Number!" ControlToValidate="txtPhoneNo" ValidationExpression="^([0]{1}[9]{1})?([0-9]{9})$" ForeColor="Red"></asp:RegularExpressionValidator>--%>
                                        <%--<asp:CompareValidator ID="cvPhoneNo" runat="server" Style="float: left" ErrorMessage="Enter only numbers!" Type="Integer" ControlToValidate="txtPhoneNo" Operator="DataTypeCheck" ForeColor="Red"></asp:CompareValidator>--%>
                                    </td>
                                </tr>


                                <tr style="height: 50px;">
                                    <td style="width: 30%; text-align: left">
                                        <label>Degree</label></td>
                                    <td style="width: 70%">
                                        <asp:TextBox ID="txtDegree" runat="server" CssClass="bg-danger form-control" Width="200px" onkeypress="return isEnglishNumber(event)" ViewStateMode="Inherit" ></asp:TextBox> <%--onkeypress="return isEnglishNumber(event)"--%>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtDegree" ErrorMessage="Require Degree !!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr style="height: 50px;">
                                    <td style="width: 30%; text-align: left">
                                        <label>Graduated University</label></td>
                                    <td style="width: 70%">
                                        <asp:TextBox ID="txtGraduatedUniversity" runat="server" CssClass="bg-danger form-control" Width="200px" ViewStateMode="Inherit" onkeypress="return isEnglishOnly(event)"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtGraduatedUniversity" ErrorMessage="Require Graduated Univrsity!!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>


                                <tr>
                                    <td style="width: 30%; text-align: left"></td>
                                    <td style="width: 70%">
                                        <asp:Button ID="btnSubmit" runat="server" Style="background-color:#337ab7; border-color:#337ab7;" CssClass="btn-success form-control "  Text="Submit" Width="150px" OnClick="btnSubmit_Click" />&nbsp;

                                          <asp:Button ID="btnedit" runat="server" Style="background-color:#337ab7;border-color:#337ab7;" CssClass="btn-success form-control" Text="Update" Width="150px" OnClick="btnedit_Click" />

                                        <br />
                                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>

            </div>
                      <%--   </ContentTemplate>
                     <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlInstitutes" EventName="SelectedIndexChanged" />
                     </Triggers>
                    </asp:UpdatePanel>--%>
        </div>
    </form>
</asp:Content>

