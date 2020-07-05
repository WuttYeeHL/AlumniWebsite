<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchStudent.aspx.cs" Inherits="SearchStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
             .GridPager a /*.GridPager span*/ {display: block;height: 25px;width: 45px;font-weight: bold;text-align: center;} /*text-decoration: none;*/
             .GridPager a{font-size: 18px; font-family:Black Ops One,cursive;}  /* color: #969696;  border: 1px solid #969696;*/
             /*.GridPager span{ color: #000;} border: 1px solid #3AC0F2;*/
             .GridHeader{text-align:center !important;  }
             /*.modal {  text-align: center; padding: 0!important;  }*/
            /*.modal:before { content: ''; display: inline-block;height: 100%;vertical-align: middle;margin-right: -4px;}
            .modal-dialog {display: inline-block;text-align: left;vertical-align: middle;}*/
             body{font-size: 10pt;}
            /*table{border: 1px solid #ccc;}*/
            table th{background-color: #F7F7F7;color: #333;font-weight: bold;}
            table th, table td{padding: 5px; border-color: #ccc;}
            /*.Pager span { color: #333; background-color: #F7F7F7;font-weight: bold;text-align: center;display: inline-block;width: 20px;margin-right: 3px;line-height: 150%;border: 1px solid #ccc;}*/
            /*.Pager a{text-align: center;display: inline-block;width: 20px;border: 1px solid #ccc;color: #fff;color: #333;margin-right: 3px;line-height: 150%;text-decoration: none;}*/
            /*.highlight{background-color: #FFFFAF;}*/
             #tooltip {position: absolute;z-index: 3000;border: 1px solid #111;background-color: #FEFFFF;padding: 5px;opacity: 1.55;}
        #tooltip h3, #tooltip div { margin: 0; }
        .Hide{display: none;}
        .HeaderStyle {
            border: solid 1px White;
            background-color: #81BEF7;
            font-weight: bold;
            text-align: center;
        }
        #myborder {
           
        }
    </style>
    <script>
        function ShowGridStudent() {
            $("#Student").show();
            $("#Alumni").hide();
        }
        function ShowGridAlumni() {
            $("#Alumni").show();
            $("#Student").hide();
        }
    </script>
    <form id="Form1" runat="server">
        <div class="row">
            
            <%--<div class="col-md-1"></div>
            <div class="col-md-11">
                <h1>Student Alunmi Information</h1>
            </div>--%>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <%--<asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
            <ContentTemplate>--%>
                <div class="row" style="margin-top:10px; padding-left:50px;" >

                    <div class="col-md-3" style="font-size: 18px; font-family:Black Ops One,cursive;"> <%--style="padding-top: 30px; text-align: right; font-size: 20px; font-family:Black Ops One,cursive;"--%>
                        Institutes<br />
                       <asp:DropDownList ID="ddlInstitutes" runat="server" Style=" display: inline;" CssClass="bg-danger form-control" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="ddlInstitutes_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
            
                    <div class="col-md-3" style="font-size: 18px; font-family:Black Ops One,cursive;"> <%--style="padding-top: 30px;"--%>
                        Batch<br />
                        <asp:DropDownList ID="ddlBatch" runat="server" Style=" display: inline;" CssClass="bg-danger form-control" Width="200px" AutoPostBack="True">
                        </asp:DropDownList>                       
                    </div>
                    
                     <div class="col-md-6" >  
                         <br />
                         <asp:Button ID="btnSearchStudent" class="btn btn-primary" runat="server" Text="Search By Student" OnClick="btnSearchStudent_Click" style="margin-left:10px;margin-right:10px" />                        
                        <asp:Button ID="btnSearchAlumni" class="btn btn-primary" runat="server" Text="Search By Alumni" OnClick="btnSearchAlumni_Click" style="float:left" />
                    </div>
                </div>
        <br />
        <div class="row" style="padding:10px;padding-right:40px;padding-left:50px">
            <div id="Student" class="col-md-12" style="height:500px;margin:10px;overflow:auto">
                
                <asp:GridView ID="gvData" runat="server"  AutoGenerateColumns="False" TabIndex="1" Width="100%"  CellPadding="4" ForeColor="#333333" GridLines="None" AlternatingRowStyle-BorderColor="#0066ff"  AllowPaging="True" PageSize="20"  ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="gvData_SelectedIndexChanged" OnPageIndexChanging="gvData_PageIndexChanging"  > <%--OnRowCommand="gvData_RowCommand" OnPageIndexChanging="OnPageIndexChanging" OnRowDataBound="gvData_RowDataBound" --%>
                     <pagersettings mode="NextPrevious"   nextpagetext="Next" previouspagetext="Prev" pagebuttoncount="10" position="Bottom"  />
                            <PagerStyle HorizontalAlign = "Center" CssClass = "GridPager"  />
<AlternatingRowStyle BorderColor="#0066FF" BackColor="White"></AlternatingRowStyle>
                            <Columns >
                                 <asp:TemplateField HeaderText="No" HeaderStyle-Width="10px" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" >  
                                    <ItemTemplate>  
                                        <asp:Label ID="No" runat="server" Text='<%# Eval("No") %>'></asp:Label>  
                                    </ItemTemplate>  

<HeaderStyle BackColor="#2461BF" ForeColor="White" Width="10px"></HeaderStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RollNo" HeaderStyle-Width="90px" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White"> 
                                   <ItemTemplate> 
                                       <asp:Label ID="RollNo" runat="server" Text='<%# Eval("RollNo")  %>'></asp:Label>                                        
                                       <%--<asp:Image ID="RollNo" runat="server" Height="50px" Width="80%" ImageUrl='<%# "~/BookImages/"+Eval("BImageName") %>' />--%>
                                   </ItemTemplate>

<HeaderStyle BackColor="#2461BF" ForeColor="White" Width="190px"></HeaderStyle>
                                </asp:TemplateField> 
                                <asp:TemplateField HeaderText="Name" HeaderStyle-Width="180px" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" >  
                                    <ItemTemplate>  
                                        <asp:Label ID="Name" runat="server" Text='<%# Eval("Name")  %>'></asp:Label>  
                                    </ItemTemplate>  

<HeaderStyle BackColor="#2461BF" ForeColor="White" Width="100px"></HeaderStyle>
                                </asp:TemplateField> 
                                <asp:TemplateField HeaderText="NRC" HeaderStyle-Width="100px" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" >  
                                    <ItemTemplate>  
                                        <asp:Label ID="NRC" runat="server" Text='<%# Eval("NRC")  %>'></asp:Label>  
                                    </ItemTemplate>  

<HeaderStyle BackColor="#2461BF" ForeColor="White" Width="80px"></HeaderStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Institute" HeaderStyle-Width="70px" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" >  
                                    <ItemTemplate>  
                                        <asp:Label ID="Institute" runat="server" Text='<%# Eval("InstituteName")  %>'></asp:Label>  
                                    </ItemTemplate>  

<HeaderStyle BackColor="#2461BF" ForeColor="White" Width="70px"></HeaderStyle>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Batch No" HeaderStyle-Width="70px" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" >  
                                    <ItemTemplate>  
                                        <asp:Label ID="Batch_No" runat="server" Text='<%# Eval("Batch_No")  %>'></asp:Label>  
                                    </ItemTemplate>  

<HeaderStyle BackColor="#2461BF" ForeColor="White" Width="250px"></HeaderStyle>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Course Name" HeaderStyle-Width="250px" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" >  
                                    <ItemTemplate>  
                                        <asp:Label ID="Course" runat="server" Text='<%# Eval("Course_Name")  %>'></asp:Label>  
                                    </ItemTemplate>  

<HeaderStyle BackColor="#2461BF" ForeColor="White" Width="250px"></HeaderStyle>
                                </asp:TemplateField>                     
                                 <asp:TemplateField HeaderText="Email" HeaderStyle-Width="200px" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" >  
                                    <ItemTemplate>  
                                        <asp:Label ID="Email" runat="server" Text='<%# Eval("Email")  %>'></asp:Label>  
                                    </ItemTemplate>  

<HeaderStyle BackColor="#2461BF" ForeColor="White" Width="170px"></HeaderStyle>
                                </asp:TemplateField>  
                                 <asp:TemplateField HeaderText="PhoneNo" HeaderStyle-Width="170px" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" >  
                                    <ItemTemplate>  
                                        <asp:Label ID="PhoneNo" runat="server" Text='<%# Eval("PhoneNo")  %>'></asp:Label>  
                                    </ItemTemplate>  

<HeaderStyle BackColor="#2461BF" ForeColor="White" Width="170px"></HeaderStyle>
                                </asp:TemplateField>   
                                <asp:TemplateField HeaderText="Degree" HeaderStyle-Width="170px" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" >  
                                    <ItemTemplate>  
                                        <asp:Label ID="Degree" runat="server" Text='<%# Eval("Degree")  %>'></asp:Label>  
                                    </ItemTemplate>  

<HeaderStyle BackColor="#2461BF" ForeColor="White" Width="180px"></HeaderStyle>
                                </asp:TemplateField>   
                                  <asp:TemplateField HeaderText="Graduated University" HeaderStyle-Width="170px" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" >  
                                    <ItemTemplate>  
                                        <asp:Label ID="GraduatedUniversity" runat="server" Text='<%# Eval("GraduatedUniversity")  %>'></asp:Label>  
                                    </ItemTemplate>  

<HeaderStyle BackColor="#2461BF" ForeColor="White" Width="170px"></HeaderStyle>
                                </asp:TemplateField>  
                                  <asp:TemplateField HeaderText="Gender" HeaderStyle-Width="170px" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" >  
                                    <ItemTemplate>  
                                        <asp:Label ID="Gender" runat="server" Text='<%# Eval("Gender")  %>'></asp:Label>  
                                    </ItemTemplate>  

<HeaderStyle BackColor="#2461BF" ForeColor="White" Width="170px"></HeaderStyle>
                                </asp:TemplateField>  
                                 <asp:TemplateField HeaderText="Status" HeaderStyle-Width="170px" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" >  
                                    <ItemTemplate>  
                                        <asp:Label ID="Status" runat="server" Text='<%# Eval("Status")  %>'></asp:Label>  
                                    </ItemTemplate>  

<HeaderStyle BackColor="#2461BF" ForeColor="White" Width="170px"></HeaderStyle>
                                </asp:TemplateField>  
                                
                                                                                                
                            
                            </Columns>
                     <EditRowStyle BackColor="#2461BF" CssClass="#myborder" />
                     <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle CssClass="HeaderStyle" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                      <PagerSettings FirstPageText="|<" LastPageText=">|" Position="Bottom" />
                     <PagerStyle HorizontalAlign = "Center" CssClass = "GridPager" BackColor="#2461BF" ForeColor="White"  />
                            <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" CssClass="#myborder" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" CssClass="#myborder" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" CssClass="#myborder" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" CssClass="#myborder" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" CssClass="#myborder" />
                 </asp:GridView>

            </div>
            <div id="Alumni" class="col-md-12" style="height: 500px; margin: 10px; overflow: auto">
                <asp:GridView ID="GVAlumini" runat="server" AutoGenerateColumns="False" TabIndex="1" Width="100%" CellPadding="4" GridLines="None" AlternatingRowStyle-BorderColor="#0066ff" AllowPaging="True" PageSize="20" ShowHeaderWhenEmpty="True" OnPageIndexChanging="GVAlumini_PageIndexChanging" ForeColor="#333333">
                    <%--OnRowCommand="gvData_RowCommand" OnPageIndexChanging="OnPageIndexChanging" OnRowDataBound="gvData_RowDataBound" --%>
                    <PagerSettings Mode="NextPrevious" NextPageText="Next" PreviousPageText="Prev" PageButtonCount="10" Position="Bottom" />
                    <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                    <AlternatingRowStyle BorderColor="#0066FF" BackColor="White"></AlternatingRowStyle>
                    <Columns>
                        <asp:TemplateField HeaderText="No" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" HeaderStyle-Width="10px">
                            <ItemTemplate>
                                <asp:Label ID="No" runat="server" Text='<%# Eval("No") %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle Width="10px"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="RollNo" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" HeaderStyle-Width="90px">
                            <ItemTemplate>
                                <asp:Label ID="RollNo" runat="server" Text='<%# Eval("RollNo")  %>'></asp:Label>
                                <%--<asp:Image ID="RollNo" runat="server" Height="50px" Width="80%" ImageUrl='<%# "~/BookImages/"+Eval("BImageName") %>' />--%>
                            </ItemTemplate>

                            <HeaderStyle Width="190px"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" HeaderStyle-Width="170px">
                            <ItemTemplate>
                                <asp:Label ID="Name" runat="server" Text='<%# Eval("Name")  %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle Width="100px"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="NRC" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" HeaderStyle-Width="80px">
                            <ItemTemplate>
                                <asp:Label ID="NRC" runat="server" Text='<%# Eval("NRC")  %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle Width="80px"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Institute" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" HeaderStyle-Width="70px">
                            <ItemTemplate>
                                <asp:Label ID="Institute" runat="server" Text='<%# Eval("InstituteName")  %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle Width="70px"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Batch No" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" HeaderStyle-Width="70px">
                            <ItemTemplate>
                                <asp:Label ID="Batch_No" runat="server" Text='<%# Eval("Batch_No")  %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle Width="170px"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Course Name" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" HeaderStyle-Width="250px">
                            <ItemTemplate>
                                <asp:Label ID="Course" runat="server" Text='<%# Eval("Course_Name")  %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle Width="250px"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" HeaderStyle-Width="170px">
                            <ItemTemplate>
                                <asp:Label ID="Email" runat="server" Text='<%# Eval("Email")  %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle Width="170px"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PhoneNo" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" HeaderStyle-Width="170px">
                            <ItemTemplate>
                                <asp:Label ID="PhoneNo" runat="server" Text='<%# Eval("PhoneNo")  %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle Width="170px"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Degree" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" HeaderStyle-Width="80px">
                            <ItemTemplate>
                                <asp:Label ID="Degree" runat="server" Text='<%# Eval("Degree")  %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle Width="80px"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Graduated University" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" HeaderStyle-Width="170px">
                            <ItemTemplate>
                                <asp:Label ID="GraduatedUniversity" runat="server" Text='<%# Eval("GraduatedUniversity")  %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle Width="170px"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gender" HeaderStyle-BackColor="#2461BF" HeaderStyle-ForeColor="White" HeaderStyle-Width="170px">
                            <ItemTemplate>
                                <asp:Label ID="Gender" runat="server" Text='<%# Eval("Gender")  %>'></asp:Label>
                            </ItemTemplate>

                            <HeaderStyle Width="170px"></HeaderStyle>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="white" Font-Bold="True" ForeColor="White" BorderColor="Red" />
                    <HeaderStyle CssClass="HeaderStyle" BackColor="#2461BF" Font-Bold="True" ForeColor="White" />
                    <PagerSettings FirstPageText="|<" LastPageText=">|" Position="Bottom" />
                    <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </div>
        </div>

    </form>
</asp:Content>

