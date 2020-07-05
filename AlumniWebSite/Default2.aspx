<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href='https://fonts.googleapis.com/css?family=Notable' rel='stylesheet'/>
    <link href="https://fonts.googleapis.com/css?family=Bungee+Inline" rel="stylesheet"/>
    <style>

        h1 {
  /*width: 100px;
  height: 100px;*/
  
  position: relative;
  -webkit-animation: mymove 5s infinite; /* Safari 4.0 - 8.0 */
  -webkit-animation-delay: 5s; /* Safari 4.0 - 8.0 */
  animation: mymove 8s infinite;
  animation-delay: 5s;
}

/* Safari 4.0 - 8.0 */
@-webkit-keyframes mymove {
  from {left: 0px;}
  to {left: 100%;}
}

@keyframes mymove {
  from {left: 0px;}
  to {left: 100%;}
}
h1 {
    /*font-family: 'Notable';*/font-size: 28px;
    color:white;
    /*font-family: 'Black Ops One', cursive;
font-family: 'Monoton', cursive;*/
    /*margin-top:80px;*/
    font-family: 'Bungee Inline', cursive;
}
.text {font-family: Arial, Helvetica, sans-serif;}

.bodyhome {
  /*background-image: url(Images/alumni4.jpg);
  background-repeat:repeat;*/
  background-image: url(Images/a2.jpg);
  background-size: cover;
  position: relative;
  height: 300px;
}

.text {
  /*background-color: white;*/
 opacity:0.6;
 
  color: black;
  font-size: 10vw; 
  font-weight: bold;
  margin: 0 auto;
  padding: 10px;
  width: 50%;
  text-align: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);

  /*mix-blend-mode: screen;*/
}


    </style>

<div class="slide1" style="height:100px;width:100%;background-color:#323240;border:1px #323240 dotted ">
    
    <h1 style="padding-top: 8px;">Welcome from Alumni</h1>

</div>

    <div class="bodyhome" style="height:680px;width:100%;background-color:#2f3d3e">

         <div class="text">Alumni</div>
    </div>

</asp:Content>

