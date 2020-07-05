<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 109px;
        }
    </style>
    <script src="js/Chart.js"></script>

    <script>
        //$('#exampleModal').on('shown.bs.modal', function () {
        //    $(this).find('.modal-dialog').css({
        //        width: 'auto',
        //        height: 'auto',
        //        'max-height': '100%'
        //    });
        //});

        function ShowChart1Modal() {
            $("#exampleModal").modal('show');
        }

        function CloseModal() {
            $("#exampleModal").modal('hide');
        }

        function ShowChart2Modal() {
            $("#modalChart2").modal('show');
        }

        function CloseChart2Modal() {
            $("#modalChart2").modal('hide');
        }

        function hideButtonDetail() {
            document.getElementById("btnShowChart1").style.display = 'none';

        }
        function showButtonDetail() {
            document.getElementById("btnShowChart1").style.display = 'block';
        }

        function hideButtonChart2Modal() {
            document.getElementById("btnShowChart2").style.display = 'none';

        }
        function showButtonChart2Modal() {
            document.getElementById("btnShowChart2").style.display = 'block';
        }

        function hideAllButton() {
            document.getElementById("btnShowChart1").style.display = 'none';
            document.getElementById("btnShowChart2").style.display = 'none';

        }
        function hideBtn1ShowBtn2() {
            document.getElementById("btnShowChart1").style.display = 'none';
            document.getElementById("btnShowChart2").style.display = 'block';

        }
        function hideBtn2ShowBtn1() {
            document.getElementById("btnShowChart1").style.display = 'block';
            document.getElementById("btnShowChart2").style.display = 'none';

        }

        function LoadSectorChart(institute, batch, course) {
            document.getElementById("btnShowChart1").style.display = 'block';
            $.ajax({
                type: "POST",
                url: "MemberSearchPage.aspx/getSectorLineChartData",
                data: "{'Institute':'" + institute + "','Batch':'" + batch + "','Course':'" + course + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    var aData = msg.d;
                    var aLabels = aData[0];
                    var aDatasets1 = aData[1];
                    var aDatasets2 = aData[2];
                    var maxnum = Math.max.apply(Math, aDatasets1);
                    //var barChartData = {
                    //    labels: aLabels,
                    //    datasets: [
                    //           {
                    //               fillColor: 'rgb(42,128,185)',
                    //               strokeColor: 'rgb(42,128,185)',
                    //               data: aDatasets1
                    //           },
                    //    ]
                    //}
                    //var step = 5;
                    //var max = 90
                    //var start = 40;
                    var ctx = document.getElementById("bar-area").getContext("2d");
                    //window.myBar = new Chart(ctx).Bar(barChartData, { responsive: true });
                    Chart.defaults.global.defaultFontSize= 11;
                    Chart.defaults.global.defaultFontStyle='bold';
                    const chart = new Chart(ctx, {
                        //scaleOverride: true,
                        //scaleSteps: Math.ceil((max-start)/step),
                        //scaleStepWidth: step,
                        //scaleStartValue: start,
                        type: "bar",
                        //label: aLabels,
                        //data: aDatasets1,
                        data: {
                            labels: aLabels,
                            datasets: [{
                                label: "Sector",
                                backgroundColor: aDatasets2,
                                //backgroundColor: ["#AF7", "#FA4", "#FF7"],
                                data: aDatasets1,
                            },
                            //{
                            //    backgroundColor: "#FA4",
                            //    data:[200],
                            //}
                            //}, {
                            //    label: "Feb",
                            //    backgroundColor: "#FA4",
                            //    data: [200],
                            //}, {
                            //    label: "Mar",
                            //    backgroundColor: "#FF7",
                            //    data: [300],
                            //}
                            ]
                        },
                        options: {
                            responsive: true,
                            legend: { position: 'right', display: false },
                            title: { display: true, text: 'Sectors For Alumni' },
                            scales: {
                                yAxes: [
                                        {
                                            ticks: {
                                                min: 0,
                                                max: maxnum,// Your absolute max value
                                                //callback: function (value) {
                                                //    return (value / 50 * 100).toFixed(0) + '%'; // convert it to percentage
                                                //},
                                            },
                                            scaleLabel: {
                                                display: true,
                                                labelString: 'Count',
                                            },
                                        },
                                ],
                            }
                        }
                    });

                }
            });
            return false;
        }
        function LoadSectorChartModalShow(institute, batch, course) {
            $("#exampleModal").modal('show');
            document.getElementById("btnShowChart1").style.display = 'block';
            $.ajax({
                type: "POST",
                url: "MemberSearchPage.aspx/getSectorLineChartData",
                data: "{'Institute':'" + institute + "','Batch':'" + batch + "','Course':'" + course + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    var aData = msg.d;
                    var aLabels = aData[0];
                    var aDatasets1 = aData[1];
                    var aDatasets2 = aData[2];
                    var maxnum = Math.max.apply(Math, aDatasets1);
                    //var barChartData = {
                    //    labels: aLabels,
                    //    datasets: [
                    //           {
                    //               fillColor: 'rgb(42,128,185)',
                    //               strokeColor: 'rgb(42,128,185)',
                    //               data: aDatasets1
                    //           },
                    //    ]
                    //}
                    //var step = 5;
                    //var max = 90
                    //var start = 40;
                    var ctx = document.getElementById("bar-area").getContext("2d");
                    //window.myBar = new Chart(ctx).Bar(barChartData, { responsive: true });
                    Chart.defaults.global.defaultFontSize= 11;
                    Chart.defaults.global.defaultFontStyle='bold';
                    const chart = new Chart(ctx, {
                        //scaleOverride: true,
                        //scaleSteps: Math.ceil((max-start)/step),
                        //scaleStepWidth: step,
                        //scaleStartValue: start,
                        type: "bar",
                        //label: aLabels,
                        //data: aDatasets1,
                        data: {
                            labels: aLabels,
                            datasets: [{
                                label: "Sector",
                                backgroundColor: aDatasets2,
                                //backgroundColor: ["#AF7", "#FA4", "#FF7"],
                                data: aDatasets1,
                            },
                            //{
                            //    backgroundColor: "#FA4",
                            //    data:[200],
                            //}
                            //}, {
                            //    label: "Feb",
                            //    backgroundColor: "#FA4",
                            //    data: [200],
                            //}, {
                            //    label: "Mar",
                            //    backgroundColor: "#FF7",
                            //    data: [300],
                            //}
                            ]
                        },
                        options: {
                            responsive: true,
                            legend: { position: 'right', display: false },
                            title: { display: true, text: 'Sectors For Alumni' },
                            scales: {
                                yAxes: [
                                        {
                                            ticks: {
                                                min: 0,
                                                max: maxnum,// Your absolute max value
                                                //callback: function (value) {
                                                //    return (value / 50 * 100).toFixed(0) + '%'; // convert it to percentage
                                                //},
                                            },
                                            scaleLabel: {
                                                display: true,
                                                labelString: 'Count',
                                            },
                                        },
                                ],
                            }
                        }
                    });

                }
            });
            return false;
        }
        function LoadPositionChart(institute, batch, course) {
            document.getElementById("btnShowChart1").style.display = 'block';
            $.ajax({
                type: "POST",
                url: "MemberSearchPage.aspx/getLineChartData",
                data: "{'Institute':'" + institute + "','Batch':'" + batch + "','Course':'" + course + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    var aData = msg.d;
                    var aLabels = aData[0];
                    var aDatasets1 = aData[1];
                    var aDatasets2 = aData[2];
                    var maxnum = Math.max.apply(Math, aDatasets1);
                    //var barChartData = {
                    //    labels: aLabels,
                    //    datasets: [
                    //           {
                    //               fillColor: 'rgb(42,128,185)',
                    //               strokeColor: 'rgb(42,128,185)',
                    //               data: aDatasets1
                    //           },
                    //    ]
                    //}
                    //var step = 5;
                    //var max = 90
                    //var start = 40;
                    var ctx = document.getElementById("bar-area").getContext("2d");
                    //window.myBar = new Chart(ctx).Bar(barChartData, { responsive: true });
                    Chart.defaults.global.defaultFontSize= 13;
                    Chart.defaults.global.defaultFontStyle='bold';
                    const chart = new Chart(ctx, {
                        //scaleOverride: true,
                        //scaleSteps: Math.ceil((max-start)/step),
                        //scaleStepWidth: step,
                        //scaleStartValue: start,
                        type: "bar",
                        //label: aLabels,
                        //data: aDatasets1,
                        data: {
                            labels: aLabels,
                            datasets: [{
                                label: "Position",
                                backgroundColor: aDatasets2,
                                //backgroundColor: ["#AF7", "#FA4", "#FF7"],
                                data: aDatasets1,
                            },
                            //{
                            //    backgroundColor: "#FA4",
                            //    data:[200],
                            //}
                            //}, {
                            //    label: "Feb",
                            //    backgroundColor: "#FA4",
                            //    data: [200],
                            //}, {
                            //    label: "Mar",
                            //    backgroundColor: "#FF7",
                            //    data: [300],
                            //}
                            ]
                        },
                        options: {
                            responsive: true,
                            legend: { position: 'right', display: false },
                            title: { display: true, text: 'Position For Alumni' },
                            scales: {
                                yAxes: [
                                        {
                                            ticks: {
                                                min: 0,
                                                max: maxnum,// Your absolute max value
                                                //callback: function (value) {
                                                //    return (value / 50 * 100).toFixed(0) + '%'; // convert it to percentage
                                                //},
                                            },
                                            scaleLabel: {
                                                display: true,
                                                labelString: 'Count',
                                            },
                                        },
                                ],
                            }
                        }
                    });

                }
            });
            return false;
        }
        function LoadPositionChartShowModal(institute, batch, course) {
            $("#exampleModal").modal('show');
            document.getElementById("btnShowChart1").style.display = 'block';
            $.ajax({
                type: "POST",
                url: "MemberSearchPage.aspx/getLineChartData",
                data: "{'Institute':'" + institute + "','Batch':'" + batch + "','Course':'" + course + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    var aData = msg.d;
                    var aLabels = aData[0];
                    var aDatasets1 = aData[1];
                    var aDatasets2 = aData[2];
                    var maxnum = Math.max.apply(Math, aDatasets1);
                    //var barChartData = {
                    //    labels: aLabels,
                    //    datasets: [
                    //           {
                    //               fillColor: 'rgb(42,128,185)',
                    //               strokeColor: 'rgb(42,128,185)',
                    //               data: aDatasets1
                    //           },
                    //    ]
                    //}
                    //var step = 5;
                    //var max = 90
                    //var start = 40;
                    var ctx = document.getElementById("bar-area").getContext("2d");
                    //window.myBar = new Chart(ctx).Bar(barChartData, { responsive: true });
                    Chart.defaults.global.defaultFontSize= 13;
                    Chart.defaults.global.defaultFontStyle='bold';
                    const chart = new Chart(ctx, {
                        //scaleOverride: true,
                        //scaleSteps: Math.ceil((max-start)/step),
                        //scaleStepWidth: step,
                        //scaleStartValue: start,
                        type: "bar",
                        //label: aLabels,
                        //data: aDatasets1,
                        data: {
                            labels: aLabels,
                            datasets: [{
                                label: "Position",
                                backgroundColor: aDatasets2,
                                //backgroundColor: ["#AF7", "#FA4", "#FF7"],
                                data: aDatasets1,
                            },
                            //{
                            //    backgroundColor: "#FA4",
                            //    data:[200],
                            //}
                            //}, {
                            //    label: "Feb",
                            //    backgroundColor: "#FA4",
                            //    data: [200],
                            //}, {
                            //    label: "Mar",
                            //    backgroundColor: "#FF7",
                            //    data: [300],
                            //}
                            ]
                        },
                        options: {
                            responsive: true,
                            legend: { position: 'right', display: false },
                            title: { display: true, text: 'Position For Alumni' },
                            scales: {
                                yAxes: [
                                        {
                                            ticks: {
                                                min: 0,
                                                max: maxnum,// Your absolute max value
                                                //callback: function (value) {
                                                //    return (value / 50 * 100).toFixed(0) + '%'; // convert it to percentage
                                                //},
                                            },
                                            scaleLabel: {
                                                display: true,
                                                labelString: 'Count',
                                            },
                                        },
                                ],
                            }
                        }
                    });

                }
            });
            return false;
        }
        window.onload = function () {

        };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="Form1" runat="server">
        <%-- <section style="background-color: #17a2b2;border:1px solid green;">--%>
        <div class="container-fluid">
            <%--filter--%>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <div class="row" style="height: 70px; background-color: #83bcfb">


                <div class="col-lg-8 col-md-8 col-sm-8">
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        Institutes
                        
                             <asp:DropDownList ID="ddlInstitutes" runat="server" Width="160px" CssClass="form-control" OnSelectedIndexChanged="ddlInstitutes_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        Batch
                     
                             <asp:DropDownList ID="ddlBatch" runat="server" Width="160px" CssClass="form-control" OnSelectedIndexChanged="ddlBatch_SelectedIndexChanged" AutoPostBack="True">
                                 <asp:ListItem>--Select Batch--</asp:ListItem>
                             </asp:DropDownList>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        Course
                       
                            <asp:DropDownList ID="ddlCourse" runat="server" Width="160px" CssClass="form-control" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem>-- Select Course --</asp:ListItem>
                            </asp:DropDownList>

                    </div>
                </div>

                <div class="col-lg-4 col-md-4 col-sm-4" style="padding-top: 25px;">
                    <asp:Button ID="btnSearchPosition" runat="server" CssClass="btn-primary" Style="margin-right: 10px; border-radius: 3px" Text="Search By Position" OnClick="btnSearchPosition_Click" />
                    <asp:Button ID="btnSearchSector" runat="server" CssClass="btn-primary" Style="margin-left: 10px; border-radius: 3px" Text="Search By Sector" OnClick="btnSearchSector_Click1" />
                </div>
            </div>


            <div class="row" style="display: block; height: 430px;">

                <div class="col-lg-12 col-md-12 col-sm-12">
                    <center>
                         <canvas id="bar-area" style="width: 100%; "></canvas>
                    </center>
                </div>


            </div>






            <!-- Button trigger modal -->
            <%--<asp:Button ID="btnShowDetail" runat="server" CssClass="btn-primary" Style="border-radius: 3px" Text="Show Detail" Visible="false" OnClick="btnShowDetail_Click"/>--%>


            <%--<button type="button" id="btnShowChart2" class="btn btn-primary" onclick="ShowChart2Modal()" >Show Chart</button>--%>




            <%-- <div class="col-lg-2 col-md-2 col-sm-2">
                </div>--%>
            <button type="button" id="btnShowChart1" class="btn btn-primary" style="display: none;" onclick="ShowChart1Modal()">Show Detail</button>
        </div>


        <!-- Modal Chart 1 -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document" style="width: 90%;">
                <div class="modal-content" style="width: 100%">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Detail Information</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Right" CellPadding="4" ForeColor="#333333" AllowPaging="True" GridLines="None" Style="width: 100%" OnPageIndexChanging="GridView1_PageIndexChanging">
                            <PagerSettings Mode="NextPrevious" NextPageText="Next" PreviousPageText="Prev" PageButtonCount="5" Position="Bottom" />
                            <RowStyle />
                            <AlternatingRowStyle BackColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnCloseModal" runat="server" Text="Close" class="btn btn-success" data-dismiss="modal" OnClick="btnCloseModal_Click" />


                        <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
                    </div>
                </div>
            </div>
        </div>

        <%--  </section>--%>
    </form>
</asp:Content>

