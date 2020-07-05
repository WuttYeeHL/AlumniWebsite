<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CoursesPage.aspx.cs" Inherits="Courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .HiddenCol {
            display: none;
        }

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
            from {
                left: 0px;
            }

            to {
                left: 100%;
            }
        }

        @keyframes mymove {
            from {
                left: 0px;
            }

            to {
                left: 100%;
            }
        }*/

        h1 {
            /*font-family: 'Notable';*/ font-size: 28px;
            color: #323240;
            /*font-family: 'Black Ops One', cursive;
font-family: 'Monoton', cursive;*/
            /*margin-top:80px;*/
            font-family: 'Bungee Inline', cursive;
        }
    </style>
    <style type="text/css">
        .header-center {
            text-align: center;
        }
    </style>
    <form id="Form1" runat="server">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="slide1" style="height: 50px; width: 100%; background-color: white;">
                    <h1 style="padding-top: 2px; margin-left: 100px;">To manage Course type and  allows only English language</h1>
                    <%--<h1 style="padding-top: 2px; margin-left: 100px;">Information and Communication Technology Research Center</h1>
                    <p style="font-family: Black Ops One,cursive; margin-left: 100px;">This form refers to manage Course type and  allows only English language.</p>--%>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-1 col-md-1 col-sm-1"></div>
            <div class="col-lg-11 col-md-11 col-sm-11" style="padding-top: 20px; font-family: Black Ops One,cursive; font-size: 20px;">
                Course Name<asp:TextBox ID="txtCourseName" runat="server" CssClass="bg-danger form-control" Width="200px" Style="margin-left: 40px; display: inline;"></asp:TextBox>
                <br />
                <br />
                Institues Name
                <asp:DropDownList ID="ddlinsteitues" runat="server" CssClass="bg-danger form-control" Width="200px" Style="margin-left: 15px; display: inline;"></asp:DropDownList>
              
                <br />
                <br />

                <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" Width="72px" OnClick="btnSave_Click1" />
                <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" />
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CourseID" CssClass="table table-striped table-bordered table-condensed" Width="70%" CellPadding="4" AllowPaging="True" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <AlternatingRowStyle BackColor="White" />
                    <PagerSettings Mode="NextPrevious" NextPageText="Next" PreviousPageText="Prev" PageButtonCount="10" Position="Bottom" />
                    <Columns>
                        <%--<asp:BoundField DataField="CourseID" HeaderText="CourseID" InsertVisible="False" ReadOnly="True" SortExpression="CourseID" />--%>
                        <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="header-center">
                            <ItemTemplate>
                                <asp:Label ID="lblNo" runat="server" Text='<%# Bind("No") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Course_Name" SortExpression="Course_Name">
                            <ItemTemplate>
                                <asp:Label ID="lblCID" runat="server" Text='<%# Bind("CourseID") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="HiddenCol" />
                            <HeaderStyle CssClass="HiddenCol" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Course_Name" HeaderStyle-CssClass="header-center">
                            <ItemTemplate>
                                <asp:Label ID="lblCourseName" runat="server" Text='<%# Bind("Course_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                        </asp:TemplateField>

                       <%--   <asp:TemplateField HeaderText="Institutes Name" HeaderStyle-CssClass="header-center">
                            <ItemTemplate>
                                <asp:Label ID="lblInstituesName" runat="server" Text='<%# Bind("Institutes_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                        </asp:TemplateField>--%>

                        <asp:TemplateField HeaderText="" SortExpression="Course_Name">
                            <ItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" CssClass="btn btn-info btn-sm" Width="100px" CommandArgument='<%# Container.DataItemIndex%>' />
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="" SortExpression="Course_Name">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CssClass="btn btn-info btn-sm" Width="100px" CommandArgument='<%# Container.DataItemIndex%>' />
                            </ItemTemplate>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" />
                        </asp:TemplateField>

                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AlumniDBConnectionString7 %>" SelectCommand="SELECT * FROM [CourseICTTIs]" UpdateCommand="Update [CourseICTTIs] Set [Course_Name]=@Course_Name Where [CourseID]=@CourseID " DeleteCommand="Delete From [CourseICTTIs] Where [CourseID]=@CourseID"></asp:SqlDataSource>--%>
            </div>
        </div>
        <%-- For Modal--%>
        <div id="myDataModal" class="modal fade" role="dialog" tabindex="-1" aria-labelledby="myUModalLabel1" aria-hidden="true">
            <div class="modal-dialog" style="width: 40%; height: 200px;">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" style="color: forestgreen; font-weight: bold;" id="myUModalLabel1">Update Data</h4>

                    </div>
                    <asp:Label ID="lblID" runat="server" Text="Label" Style="display: none;"></asp:Label>
                    <span id="ContentPlaceHolder1_lblRParentID" style="display: none;">RParentID</span>
                    <span id="ContentPlaceHolder1_lblFolderIDForUpdate" style="display: none;"></span>
                    <span id="ContentPlaceHolder1_lblFolderNameForUpdate" style="display: none;"></span>
                    <div class="modal-body">
                        <asp:TextBox ID="txtCourse_Name" runat="server" class="form-control" Style="width: 100% !important"></asp:TextBox>
                    </div>
                    <div class="modal-footer">
                        <h3 id="Error1" style="color: red; display: none; float: left">အချက်အလက်များမှားယွင်းနေပါသည်။ပြင်ဆင်၍မရပါ။</h3>
                        <h3 id="Error2" style="color: red; display: none; float: left">အချက်အလက်များစုံလင်စွာဖြည့်သွင်းပါ။</h3>
                        <asp:Button ID="btnUpdateModal" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdateModal_Click" />

                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>
        <script>
            function OpenModal() {
                $('#myDataModal').modal('show');
            }
        </script>
    </form>
</asp:Content>

