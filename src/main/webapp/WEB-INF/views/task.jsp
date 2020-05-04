<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Tables</title>

  <!-- Custom fonts for this template -->
  <link href='<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>' rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href='<c:url value="/resources/css/sb-admin-2.min.css"/>' rel="stylesheet">
  <link href='<c:url value="/resources/css/style.css"/>' rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href='<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.min.css"/>' rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
 
  

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href='<c:url value="/"/>'>
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">TASK</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>
      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Addons
      </div>
    <li class="nav-item">
        <a class="nav-link" href='<c:url value="/member/"/>'>
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Member</span></a>
      </li>

      <!-- Nav Item - Tables -->
        <li class="nav-item active">
        <a class="nav-link" href='<c:url value="/"/>'>
          <i class="fas fa-fw fa-table"></i>
          <span>Task</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href='<c:url value="/active/"/>'>
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Active</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Tables</h1>
          <!-- DataTales Example -->
          <div class="table_task">
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">TaskList</h6>
              <a class="btn btn-success btn-add">Add</a>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Id</th>
                      <th>Title</th>
                      <th>Description</th>
                      <th>Duedatetime</th>
                      <th>Duedatehour</th>
                      <th>Members</th>
                      <th>State</th>
                      <th>Select</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                       <th>Id</th>
                      <th>Title</th>
                      <th>Description</th>
                      <th>Duedatetime</th>
                      <th>Duedatehour</th>
                      <th>Members</th>
                      <th>State</th>
                      <th>Select</th>
                    </tr>
                  </tfoot>
              
                  <tbody>
                    <c:forEach var="item" items="${listTask }">
		                    <tr>
		                      <%-- <a href='<c:url value="/getTask/${item.getIdtask() }"/>'> --%>
		                   
		                      <td class="idstask">${item.getIdtask() }</td>
		                      <td>${item.getTitle() }</td>
		                      <td>${item.getDescription() }</td>
		                      <td>
		                     
		                      <a class="btn btn-secondary btn-notify">+</a>
				                       <div class="form-notify">
				                      		<label>DueDate</label><br>
				                      		<label>Day: ${item.getDuedatetime() }</label><br><label>Time: ${item.getDuedatehour() } : ${item.getDuedateminute() }</label>
				                      		<br>
				                      		<div class="form-group">
										    <label for="ee">Notify</label>
										    <input type="text" class="form-control" id="notifyTask">
										    <div>
										    <br>
										    <span class="btn btn-success btn-update-notify">Save</span>
										    <span class="btn btn-danger btn-close">Close</span>
										    </div>
										  </div>
				                      </div>  
				                      <a class="default">${item.getDuedatetime() }</a>
		                      </td>
		                      <td>${item.getDuedatehour() } : ${item.getDuedateminute() } </td>		                   		                      
		                      <td>	
		                      	<c:forEach var="member" items="${item.getListmember() }">
		                      		<span>${member.getName() }</span><br>
		                      	</c:forEach>
		                      </td>
		                       <td>${item.getState() }</td>
		                      <td><a class="btn btn-primary" href='<c:url value="/getTask/${item.getIdtask() }"/>'>Update</a>
		                      		<a class="btn btn-danger btn-delete" href='<c:url value="${item.getIdtask() }"/>' >Delete</a>
		                      </td>
		                    </tr>
		                   
                      </c:forEach>
                   
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          </div>
          <div class="row">
          <div class="add_task col-sm-6">
          	<a class="btn btn-info btn-back">Back</a>
			  <div class="form-group">
			    <label for="title">Title(*)</label>
			    <input type="text" class="form-control" id="title" aria-describedby="title" placeholder="Title" name="title">
			  </div>
			  <div class="form-group">
			    <label for="discriber">Discriber(*)</label>
			    <textarea class="form-control" id="discriber" rows="3"></textarea>
			  </div>
			  <div>
			  	 <label>DueDateTime(*)</label>
			  	 <input id="datepicker" width="276" />
				    <script>
				        $('#datepicker').datepicker({
				            uiLibrary: 'bootstrap4'
				        });
				    </script>
			  </div>
			 <label>DueTime(*)</label><br>
			<div class="input-group bootstrap-timepicker timepicker">
				
	            <input id="timepicker1" type="text" class="form-control input-small">
	            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
	        </div>
	        <div class="form-group">
			    <label for="title">NotifyTime(*)</label>
			    <input type="text" class="form-control" id="notifytime" aria-describedby="NotifyTime" placeholder="Notifytime" name="Notifytime">
			  </div>
	 
	        <script type="text/javascript">
	            $('#timepicker1').timepicker();
	        </script>
	        <div>
	        	<label>List Member</label>
	        	<c:forEach var="members" items="${listMember}">
	        		<div class="checkbox">
						<label><input type="checkbox" name="members"value="${members.getIdmember() }">${members.getName() }</label>
					</div>
	        	</c:forEach> 
	         
  			</div>    
  			 <button type="submit" class="btn btn-primary btn-submit">Submit</button>
          </div>
          </div>


        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
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
            <span aria-hidden="true">Ã</span>
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
  <script src='<c:url value="/resources/vendor/jquery/jquery.min.js"/>'></script>
  <script src='<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>'></script>

  <!-- Core plugin JavaScript-->
  <script src='<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>'></script>

  <!-- Custom scripts for all pages-->
  <script src='<c:url value="/resources/js/sb-admin-2.min.js"/>'></script>

  <!-- Page level plugins -->
  <script src='<c:url value="/resources/vendor/datatables/jquery.dataTables.min.js"/>'></script>
  <script src='<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.min.js"/>'></script>

  <!-- Page level custom scripts -->
  <script src='<c:url value="/resources/js/demo/datatables-demo.js"/>'></script>
	<!--   JS file -->
  <script src='<c:url value="/resources/js/custom.js"/>'></script>
  

</body>

</html>
