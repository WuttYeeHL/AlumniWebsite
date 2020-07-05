<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminCoursePage.aspx.cs" Inherits="AdminCoursePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <!-- End breadcrumb -->
        <section id="mu-course-content">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="mu-course-content-area">
                            <div class="row">
                                <div class="col-md-8 col-lg-8 col-sm-8">
                                    <!-- start course content container -->
                                    <div class="mu-course-container">
                                        <%--<div class="row">--%>
                                        <div class="myrow">

                                            <div class="col-md-6 col-sm-6">
                                                <div class="mu-latest-course-single">
                                                    <figure class="mu-latest-course-img">
                                                        <a href="#">
                                                            <img src="Images/java.jpg" alt="img" style="width:100%;height:200px"></a>
                                                        <figcaption class="mu-latest-course-imgcaption">
                                                            <a href="#">Diploma Course</a>
                                                            <span><i class="fa fa-clock-o"></i>24 Weeks</span>
                                                        </figcaption>
                                                    </figure>
                                                    <div class="mu-latest-course-single-content">
                                                        <h4><a href="#">Professional Diploma in Java Programming Course</a></h4>
                                                        <table>
                                                            <tr>
                                                                <td>Place : </td>
                                                                <td>IMCEITS</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width:130px">Total Students : </td>
                                                                <td>60+</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Course Duration : </td>
                                                                <td>24 Weeks</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Subject : <br />                                                                    
                                                                </td>
                                                                <td>
                                                                    OS(Linux & Windows),
                                                                    SE,
                                                                    Basic OOP,
                                                                    DBMS(Oracle 11g,SQL),
                                                                    Web Technologies,
                                                                    Core Java,Enteiprise Java                                                                 
                                                                </td>
                                                            </tr>
                                                        </table>                                                         
                                                        <div class="mu-latest-course-single-contbottom">
                                                            <%--<a class="mu-course-details" href="#">Details</a>--%>
                                                            <%--<span class="mu-course-price">IMCEITS</span>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-md-6 col-sm-6">
                                                <div class="mu-latest-course-single">
                                                    <figure class="mu-latest-course-img">
                                                        <a href="#">
                                                            <img src="Images/dotnet.jpg" alt="img"style="width:100%;height:200px"></a>
                                                        <figcaption class="mu-latest-course-imgcaption">
                                                            <a href="#">Diploma Course</a>
                                                            <span><i class="fa fa-clock-o"></i>24 Weeks</span>
                                                        </figcaption>
                                                    </figure>
                                                    <div class="mu-latest-course-single-content">
                                                        <h4><a href="#">Professional Diploma in MS.Net Programming Course</a></h4>
                                                         <table>
                                                            <tr>
                                                                <td>Place : </td>
                                                                <td>IMCEITS</td>
                                                            </tr>
                                                            <tr>
                                                                <td  style="width:130px">Total Students : </td>
                                                                <td>40+</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Course Duration : </td>
                                                                <td>24 Weeks</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Subject : <br />                                                                    
                                                                </td>
                                                                <td>
                                                                   OS(Linux & Windows),
                                                                    SE,
                                                                    Basic OOP,
                                                                    DBMS(Oracle 11g,SQL),
                                                                    Web Technologies,
                                                                    C#.Net,ASP.Net,ADO.Net                                                                  
                                                                </td>
                                                            </tr>
                                                        </table> 
                                                        <div class="mu-latest-course-single-contbottom">
                                                            <%--<a class="mu-course-details" href="#">Details</a>
                                                            <span class="mu-course-price">IMCEITS</span>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6">
                                                <div class="mu-latest-course-single">
                                                    <figure class="mu-latest-course-img">
                                                        <a href="#">
                                                            <img src="Images/androidhero.jpg" alt="img"style="width:100%;height:200px"></a>
                                                        <figcaption class="mu-latest-course-imgcaption">
                                                            <a href="#">Certificate Course</a>
                                                            <span><i class="fa fa-clock-o"></i>8 Weeks</span>
                                                        </figcaption>
                                                    </figure>
                                                    <div class="mu-latest-course-single-content">
                                                        <h4><a href="#">Professional Certificate in Android Programming Course</a></h4>
                                                         <table>
                                                            <tr>
                                                                <td>Place : </td>
                                                                <td>IMCEITS</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width:130px">Total Students : </td>
                                                                <td>40+</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Course Duration : </td>
                                                                <td>8 Weeks</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Subject : <br />                                                                    
                                                                </td>
                                                                <td>
                                                                    Introduction to Android,Android Activities,Android UI Design
                                                                    Instents Android Persistency,Services,Maps,Geo-coding,Location based Services                                                              
                                                                </td>
                                                            </tr>
                                                        </table> 
                                                        <div class="mu-latest-course-single-contbottom">
                                                            <%--<a class="mu-course-details" href="#">Details</a>
                                                            <span class="mu-course-price">IMCEITS</span>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6">
                                                <div class="mu-latest-course-single">
                                                    <figure class="mu-latest-course-img">
                                                        <a href="#">
                                                            <img src="Images/SE.jpg" alt="img"style="width:100%;height:200px"></a>
                                                        <figcaption class="mu-latest-course-imgcaption">
                                                            <a href="#">Diploma Course</a>
                                                            <span><i class="fa fa-clock-o"></i>23 Weeks</span>
                                                        </figcaption>
                                                    </figure>
                                                    <div class="mu-latest-course-single-content">
                                                        <h4><a href="#">Professional Diploma in Software Engineering Course</a></h4>
                                                         <table>
                                                            <tr>
                                                                <td>Place : </td>
                                                                <td>ICTTI</td>
                                                            </tr>
                                                            <tr>
                                                                <td  style="width:130px">Total Students : </td>
                                                                <td>30+</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Course Duration : </td>
                                                                <td>23 Weeks</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Subject : <br />                                                                    
                                                                </td>
                                                                <td>
                                                                    Database Design and Adminstration,Database Programming,OO Analysis and Design,
                                                                    Advanced Java Programming,Planning,Evaluation and Testing,Mehtodology of Software Prodout Development,
                                                                    Localization and Globalization                                                                 
                                                                </td>
                                                            </tr>
                                                        </table> 
                                                        <div class="mu-latest-course-single-contbottom">
                                                            <%--<a class="mu-course-details" href="#">Details</a>
                                                            <span class="mu-course-price">ICTTI</span>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6">
                                                <div class="mu-latest-course-single">
                                                    <figure class="mu-latest-course-img">
                                                        <a href="#">
                                                            <img src="Images/NetworkEngineering.png" alt="img"style="width:100%;height:200px"></a>
                                                        <figcaption class="mu-latest-course-imgcaption">
                                                            <a href="#">Diploma Course</a>
                                                            <span><i class="fa fa-clock-o"></i>23 Weeks</span>
                                                        </figcaption>
                                                    </figure>
                                                    <div class="mu-latest-course-single-content">
                                                        <h4><a href="#">Professional Diploma in Network Engineering Course</a></h4>
                                                         <table>
                                                            <tr>
                                                                <td>Place : </td>
                                                                <td>ICTTI</td>
                                                            </tr>
                                                            <tr>
                                                                <td  style="width:130px">Total Students : </td>
                                                                <td>60+</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Course Duration : </td>
                                                                <td>23 Weeks</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Subject : <br />                                                                    
                                                                </td>
                                                                <td>
                                                                   TCP/IP and Routing Protocols,Network Design,Luniz Administration,Linux Server,Linux Mangagement & Security,
                                                                    Cyber Security & Forensics,Network Administration                                                               
                                                                </td>
                                                            </tr>
                                                        </table>                                                         
                                                        <div class="mu-latest-course-single-contbottom">
                                                            <%--<a class="mu-course-details" href="#">Details</a>
                                                            <span class="mu-course-price">ICTTI</span>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6">
                                                <div class="mu-latest-course-single">
                                                    <figure class="mu-latest-course-img">
                                                        <a href="#">
                                                            <img src="Images/Cisco.jpg" alt="img"style="width:100%;height:200px"></a>
                                                        <figcaption class="mu-latest-course-imgcaption">
                                                            <a href="#">Certificate Course</a>
                                                            <span><i class="fa fa-clock-o"></i>75Days</span>
                                                        </figcaption>
                                                    </figure>
                                                    <div class="mu-latest-course-single-content">
                                                        <h4><a href="#">Cisco Networking Academy Course(CCNA: Routing & Switching)</a></h4>
                                                         <table>
                                                            <tr>
                                                                <td>Place : </td>
                                                                <td>ICTTI</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width:130px">Total Students : </td>
                                                                <td>12+</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Course Duration : </td>
                                                                <td>8 Weeks</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Subject : <br />                                                                    
                                                                </td>
                                                                <td>
                                                                    TCP/IP and Routing Protocols,Network Design,Luniz Administration,Linux Server,Linux Mangagement & Security,
                                                                    Cyber Security & Forensics,Network Administration                                                                  
                                                                </td>
                                                            </tr>
                                                        </table> 
                                                        <div class="mu-latest-course-single-contbottom">
                                                           <%-- <a class="mu-course-details" href="#">Details</a>
                                                            <span class="mu-course-price">ICTTI</span>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-md-6 col-sm-6">
                                                <div class="mu-latest-course-single">
                                                    <figure class="mu-latest-course-img">
                                                        <a href="#">
                                                            <img src="Images/Oracle-11g.jpg" alt="img"style="width:100%;height:200px"></a>
                                                        <figcaption class="mu-latest-course-imgcaption">
                                                            <a href="#">Certificate Course</a>
                                                            <span><i class="fa fa-clock-o"></i>3 Weeks</span>
                                                        </figcaption>
                                                    </figure>
                                                    <div class="mu-latest-course-single-content">
                                                        <h4><a href="#">Oracle Database 11g Course (SQL PL/SQl and DBA)</a></h4>
                                                          <table>
                                                            <tr>
                                                                <td>Place : </td>
                                                                <td>ICTTI</td>
                                                            </tr>
                                                            <tr>
                                                                <td  style="width:130px">Total Students : </td>
                                                                <td>20+</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Course Duration : </td>
                                                                <td>3 Weeks</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Subject : <br />                                                                    
                                                                </td>
                                                                <td>
                                                                    Operating System,
                                                                    Software Engineering,
                                                                    MS.Net,
                                                                    C++,C#,ASP.Net                                                                   
                                                                </td>
                                                            </tr>
                                                        </table> 
                                                        <div class="mu-latest-course-single-contbottom">
                                                           <%-- <a class="mu-course-details" href="#">Details</a>
                                                            <span class="mu-course-price">ICTTI</span>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6">
                                                <div class="mu-latest-course-single">
                                                    <figure class="mu-latest-course-img">
                                                        <a href="#">
                                                            <img src="Images/ldap-logo.jpg" alt="img"style="width:100%;height:200px"></a>
                                                        <figcaption class="mu-latest-course-imgcaption">
                                                            <a href="#">Certificate Course</a>
                                                            <span><i class="fa fa-clock-o"></i>7 Weeks</span>
                                                        </figcaption>
                                                    </figure>
                                                    <div class="mu-latest-course-single-content">
                                                        <h4><a href="#">Advanced Server Course (Virtualization and LDAP)</a></h4>
                                                         <table>
                                                            <tr>
                                                                <td>Place : </td>
                                                                <td>ICTTI</td>
                                                            </tr>
                                                            <tr>
                                                                <td  style="width:130px">Total Students : </td>
                                                                <td>8+</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Course Duration : </td>
                                                                <td>7 Weeks</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Subject : <br />                                                                    
                                                                </td>
                                                                <td>
                                                                    Operating System,
                                                                    Software Engineering,
                                                                    MS.Net,
                                                                    C++,C#,ASP.Net                                                                   
                                                                </td>
                                                            </tr>
                                                        </table> 
                                                        <div class="mu-latest-course-single-contbottom">
                                                            <%--<a class="mu-course-details" href="#">Details</a>
                                                            <span class="mu-course-price">ICTTI</span>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6">
                                                <div class="mu-latest-course-single">
                                                    <figure class="mu-latest-course-img">
                                                        <a href="#">
                                                            <img src="Images/ADVANCED-WEB-DEVELOPMENT2-1.png" alt="img"style="width:100%;height:200px"></a>
                                                        <figcaption class="mu-latest-course-imgcaption">
                                                            <a href="#">Certificate Course</a>
                                                            <span><i class="fa fa-clock-o"></i>8 Weeks</span>
                                                        </figcaption>
                                                    </figure>
                                                    <div class="mu-latest-course-single-content">
                                                        <h4><a href="#">Advenced Web Depelopment Course (Web Design and PHP Web Depelopment)</a></h4>
                                                         <table>
                                                            <tr>
                                                                <td>Place : </td>
                                                                <td>ICTTI</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Total Students : </td>
                                                                <td>32+</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Course Duration : </td>
                                                                <td>8 Weeks</td>
                                                            </tr>
                                                            <tr>
                                                                <td>Subject : <br />                                                                    
                                                                </td>
                                                                <td>
                                                                    Operating System,
                                                                    Software Engineering,
                                                                    MS.Net,
                                                                    C++,C#,ASP.Net                                                                   
                                                                </td>
                                                            </tr>
                                                        </table> 
                                                        <div class="mu-latest-course-single-contbottom">
                                                            <%--<a class="mu-course-details" href="#">Details</a>
                                                            <span class="mu-course-price">ICTTI</span>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                    <!-- end course content container -->                               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>       

</asp:Content>

