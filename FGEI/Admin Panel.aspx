<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin Panel.aspx.cs" Inherits="FGEI.Admin_Panel" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js" type="text/javascript"></script>
    <script src = "https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js" defer ></script>
    <script src="assets/js/datatables.js"></script>
<script>

    var ID = 0;
    $(document).ready(
        
        function () {
            debugger
            $("#TableId").on("click", "#delete", function (e) {
                t.row($(this).closest("tr")).remove().draw();
            });
        });
    function getTextValue() {
        debugger
        ID = ID + 1;
        var date = document.getElementById("closedate").value;
        var date1 = date.split('/')[0];
        var aDay = date1.split('-')[0];
        var aYear = date1.split('-')[2];
        var AD = aYear + '/' + aDay;
        var Case = document.getElementById("caseno").value;
        var Post = document.getElementById("postname").value;
        var Fee = document.getElementById("fees").value;
        var Dept = document.getElementById("dept").value;
        var ADate = document.getElementById("date").value;
        var CDate = document.getElementById("closedate").value;

            t = $('#TableId').DataTable();
            var rowNode = t.row.add([
                ID,
                AD,
                Case,
                Post,
                Fee,
                Dept,
                ADate,
                CDate,
                '<button class="fa fa-minus-square btn btn-info btn-sm" style="width:70px" type="button" id="delete">' + '' + '</button>'
            ]).draw().node();

            $(rowNode)
                .css('color', 'forestgreen')
                .animate({ color: 'black' });

    }
    function store() {
        debugger
        var id = new Array();
        var ad = new Array();
        var caseno = new Array();
        var posts = new Array();
        var fee = new Array();
        var dept = new Array();
        var adate = new Array();
        var cdate = new Array();
        $('#TableId tr td:nth-child(1)').each(function (i) {
            id.push($(this).text());
        });
        $('#TableId tr td:nth-child(2)').each(function (i) {
            ad.push($(this).text());
        });
        $('#TableId tr td:nth-child(3)').each(function (i) {
            caseno.push($(this).text());
        });
        $('#TableId tr td:nth-child(4)').each(function (i) {
            posts.push($(this).text());
        });
        $('#TableId tr td:nth-child(5)').each(function (i) {
            fee.push($(this).text());
        });
        $('#TableId tr td:nth-child(6)').each(function (i) {
            dept.push($(this).text());
        });
        $('#TableId tr td:nth-child(7)').each(function (i) {
            adate.push($(this).text());
        });
        $('#TableId tr td:nth-child(8)').each(function (i) {
            cdate.push($(this).text());
        });
        // NOW CALL THE WEB METHOD WITH THE PARAMETERS USING AJAX.
        $.ajax({
            type: 'POST',
            url: 'Admin.asmx/StoreDB',
            data: '{"id":"' + id + '","ad":"' + ad + '","caseno":"' + caseno + '","posts":"' + posts + '","fee":"' + fee + '","dept":"' + dept + '","adate":"' + adate + '","cdate":"' + cdate + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            traditional: true,
            //async: false,
            success: function (response) {
                id = [];    // EMPTY THE ARRAY.
                ad = [];
                caseno = [];
                posts = [];
                fee = [];
                dept = [];
                adate = [];
                cdate = [];
                alert("Success");
                Response.redirect("Admin Panel.aspx");
            },
            error: function () {
                alert("This is not working");
            }
        });

    }

</script>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Admin - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
        <div class="sidebar-brand-icon">
          <i>
    <img src="assets/img/fgei.png" width="60" height="60" />
          </i>
        </div>
        <div class="sidebar-brand-text mx-3">Admin Panel </div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

         





    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content" style="text-align:center">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
            
          <div >
            <h1 class=" h3 mb-0 text-gray-800">Dashboard</h1>
              </div> 


          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>
            </nav>
          <div class="row">
                        <div class="col-lg-2">
                            <label>Case no</label>
                            <input type="text" class="form-control" runat="server" required="required" clientidmode="Static" id="caseno" />
                        </div>
                        <div class="col-lg-2">
                            <label>Post Name</label>
                            <input type="text"  required="required" class="form-control" id="postname" runat="server" clientidmode="Static" />
                        </div>
                        <div class="col-lg-2">
                            <label>Fee (Rs)</label>
                            <input type="number" class="form-control" required="required" id="fees" />
                        </div>
                        <div class="col-lg-2">
                            <label>Department</label>
                            <input type="text" class="form-control" required="required" id="dept" />
                        </div>
        <div class="col-lg-2">
                            <label>Ad Date</label>
                            <input type="date" class="form-control" id="date" required="required" />
                        </div>
                        <div class="col-lg-2">
                            <label>Closing Date</label>
                            <input type="date" class="form-control" id="closedate"  required="required"/>
                        </div>
              </div>
          <div class="row">
              <div class="col-12">
                  <label></label>
              </div>
          </div>
          <div class="row">
              <div class="col-4">
              </div>
              <div class="col-2">
                  <input type="button" onclick="getTextValue();" id="additems" style="width: 150px; height: 40px; font-weight: bold; margin-left: 63%" value="Add" class="btn btn-primary" />
              </div>
          </div>
          <div class="row">
              <div class="col-12">
                  <label></label>
              </div>
          </div>
         <div class=" content">
        <div class="row">
            <div class="col-2"></div>
            <section class="col-md-10 col-sm-10 col-xs-10 col-md-push-0">
                <div class="panel panel-primary">
                    <section >
                        <div class="well bs-component">
                            <div class="row">
                                <div>
                                    <div class="panel-body">
                                        <table id="TableId" class="table table-bordered  table-hover">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>AD No</th>
                                                    <th>Case No</th>
                                                    <th>Post Name</th>
                                                    <th>Fee (Rs)</th>
                                                    <th>Department</th>
                                                    <th>AD Date</th>
                                                    <th>Closing Date</th>
                                                    <th>Remove</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </section>
    </div>
             </div>
        
          </div>
          <div class="row">
              <div class="col-4">
              </div>
              <div class="col-2">
                  <input type="button" onclick="store();" id="save" style="width: 150px; height: 40px; font-weight: bold; margin-left: 63%" value="Save" class="btn btn-primary" />
              </div>
          </div>





      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Markit Solutions 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/chart-area-demo.js"></script>
  <script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>

