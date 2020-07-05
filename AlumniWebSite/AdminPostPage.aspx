<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminPostPage.aspx.cs" Inherits="AdminPostPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
      
   <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<%--<head id="Head1" runat="server">--%>
    <title></title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />

    <script src="bootstrap/js/jquery-3.3.1.min.js"></script>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/LanguageVaidation.js"></script>

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="bootstrap/css/emoji.css" rel="stylesheet" />
    <script src="ckeditor/ckeditor.js"></script>

    <script>
        var session;
        $(document).ready(function () {
            session = '<%= Session["username"] %>';
            //alert(session);
        });
        jQuery(function ($) {
            $('#scrolldiv').on('scroll', function () {
                if ($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
                    //alert('end reached');
                    document.getElementById('<%= btnloadmore.ClientID %>').click();
                }
            })
        });
        //function openloader() {
        //    document.getElementById("loader").style.display = "block";
        //}
        //function hideloader() {
        //    document.getElementById("loader").style.display = "hidden";
        //}

        function editmodal() {
            $("#exampleModal").modal('show');
        }
    </script>
<%--</head>--%>
<body style="overflow:hidden; background-color:#bbb8fb">
    <form id="form1" runat="server">
    <div class="container" style="width:80%">
        
    <span><asp:Label ID="lblUser" runat="server" Text=""></asp:Label></span>    
       
<!-- Modal Edit -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Post</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <asp:TextBox ID="txtEditTitle" runat="server" TextMode="MultiLine" CssClass="form-control" style="width:90%;height:30px"></asp:TextBox>
                <asp:TextBox ID="txtEditDescription" TextMode="MultiLine" style="height:70px;width:90%;display:inline" CssClass="form-control" runat="server"></asp:TextBox>
      </div>
      <div class="modal-footer">
          <asp:Label ID="lblmodalEditID" runat="server" Visible="false"></asp:Label>
          <asp:Button ID="btnEditSaveChange" runat="server" Text="Post Change" CssClass="btn btn-primary" OnClick="btnEditSaveChange_Click"/>
          <asp:Button ID="btnEditClose" runat="server" Text="Close" CssClass="btn btn-secondary" OnClick="btnEditClose_Click"/>
      </div>
    </div>
  </div>
</div>



<!-- Modal NewPost -->
<div class="modal fade" id="ModalNewPost" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalNewPostLabel">New Post</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <asp:TextBox ID="txtTitle" runat="server"  placeholder="Post title here.." TextMode="MultiLine" CssClass="form-control" style="width:70%;height:60px;" data-emojiable="true" data-emoji-input="unicode"></asp:TextBox>
                <%--<script>
                    CKEDITOR.replace("txtTitle");
                </script>--%>
                <asp:TextBox ID="txtPost" placeholder="Post here..." TextMode="MultiLine" style="height:70px;width:70%;display:inline" CssClass="form-control" runat="server" data-emojiable="true" data-emoji-input="unicode"></asp:TextBox>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
         <asp:Button ID="btnPost" runat="server" Text="Post News" CssClass="btn btn-primary" style="float:right" OnClick="btnPost_Click"/>
      </div>
    </div>
  </div>
</div>
        <asp:Button ID="btnloadmore" runat="server"  style="display:none" OnClick="btnloadmore_Click" />
        
        
        <div class="row" style="height:500px">
            <div class="col-md-12"  style="height:80%;border-radius:20px;border:2px solid black;background-color:#e9e8e3; margin-top:25px">
               <div id="scrolldiv" style="width:100%;height:100%;overflow:auto">
                   <asp:ListView ID="ListView1" runat="server" OnItemEditing="ListView1_ItemEditing" OnItemCommand="ListView1_ItemCommand" OnItemDeleting="ListView1_ItemDeleting">
                       <ItemTemplate>
                           <div class="list" style="padding: 10px; width: 100%;">
                               <table style="border: 1px inset black; border-radius: 4px; width: 100%; padding: 80px; box-shadow: 10px 5px 5px #808080; background-color: #fff">
                                   <tr>
                                       <td>
                                           <div style="border-radius: 200px">
                                               <table style="float: left;">
                                                   <tr>
                                                       <td>
                                                           
                                                           <img src="Images/profileimg.jpg" style="width: 50px; height: 50px; border-radius: 30px; background-color: #808080" />
                                                       </td>
                                                       <td>
                                                           
                                                           <asp:Label ID="lblID" runat="server" Visible="false" Text='<%# Eval("ID") %>'></asp:Label>
                                                           <h5><asp:Label ID="lblUserName" runat="server" style="text-align: left; padding: 10px" Text='<%# Eval("UserName") %>'></asp:Label></h5>
                                                       </td>
                                                       <td style="margin-right: 0">
                                                         

                                                                            
                                                       </td>
                                                       <td>
                                                          <%-- <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="..." style="float:right;margin-right:0" OnClick="LinkButton1_Click" Visible='<%# Eval("UserName").ToString()== Session["username"].ToString() ? true:false %>'></asp:LinkButton>--%>
                                                       </td>
                                                   </tr>
                                               </table>

                                           </div>
                                           <div style="float:right;padding-top:10px;padding-right:50px;">
                                               <div class="dropdown">
                                                   <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" Visible='<%# Session["username"].ToString()== "Adminictrc" ? true:Eval("UserName").ToString()== Session["username"].ToString() ? true : false %>'>
                                                       ☰
                                                   </asp:LinkButton>
                                                   <div class="dropdown-menu" aria-labelledby="LinkButton2">
                                                       <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" CommandName="Edit"  >Edit</asp:LinkButton><br />
                                                      <asp:LinkButton ID="lbtnDelete" runat="server" CausesValidation="False" CommandName="Remove" >Delete</asp:LinkButton>
                                                      <%-- <button class="dropdown-item" type="button">Action</button>
                                                       <button class="dropdown-item" type="button">Another action</button>
                                                       <button class="dropdown-item" type="button">Something else here</button>--%>
                                                   </div>
                                               </div>
                                           </div>

                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date") %>'></asp:Label></h6>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <h3><asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>'></asp:Label></h3>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <p><asp:Label id="pDescription" runat="server" style="text-align: justify" Text='<%# Eval("Description") %>'></asp:Label></p>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <%--<span style="text-align: justify"><%# Eval("Image") %></span>--%>
                                       </td>
                                   </tr>
                                   <tr>
                                       <td>
                                           <div class="row"></div>
                                       </td>
                                   </tr>
                               </table>
                           </div>
                       </ItemTemplate>
                     
                   </asp:ListView>
            </div>
            </div>
            <div id="loader" class="col-md-12"  style="height:5%;display:none">
              <center><img src="img/myloader.gif" style="width:300px;height:50px"/></center>  

            </div>
            <div class="col-md-12" style="height: 10%; bottom: 0; display: inline;">

                <!-- Button trigger modal NewPost -->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalNewPost" style="float:right;margin-top:30px;">
                    New Post
                </button>
            </div>
           
        </div>
    </div>
    <div >

    </div>


    </form>
    
     <!-- ** Don't forget to Add jQuery here ** -->
  <script src="bootstrap/js/config.js"></script>
  <script src="bootstrap/js/util.js"></script>
  <script src="bootstrap/js/jquery.emojiarea.js"></script>
  <script src="bootstrap/js/emoji-picker.js"></script>
</body>
</html>
</asp:Content>

