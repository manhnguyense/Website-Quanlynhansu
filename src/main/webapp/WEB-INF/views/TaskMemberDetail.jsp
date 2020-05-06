<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Members</title>

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


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Begin Page Content -->
        <div class="container">
		<div class="row col-md-12">
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Tables</h1>
          <!-- DataTales Example -->
          <div class="table_task">
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Your Task</h6>
              <a href='<c:url value="/member/contact/${user.getIdmember() }"/>'>Contact and Reports</a>
              <a href='<c:url value="/member/kanban/${user.getIdmember() }"/>'>KANBAN for you</a>
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
                      <th>TaskDetail</th>
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
                      <th>TaskDetail</th>
                      <th>Select</th>
                    </tr>
                  </tfoot>
              
                  <tbody>
                    <c:forEach var="item" items="${listTask }">
		                    <tr class="onRow">
		                      <%-- <a href='<c:url value="/getTask/${item.getIdtask() }"/>'> --%>
		                   
		                      <td class="idchange" data-id="${item.getIdtask() }">${item.getIdtask() }</td>
		                      <td>${item.getTitle() }</td>
		                      <td>${item.getDescription() }</td>
		                      <td>${item.getDuedatetime() }</td>
		                      <td>${item.getDuedatehour() } : ${item.getDuedateminute() } </td>		                   		                      
		                      <td>	
		                      	<c:forEach var="member" items="${item.getListmember() }">
		                      		<span>${member.getName() }</span><br>
		                      	</c:forEach>
		                      </td>
		                      <td>
			                     <select id="myselect" class="choose form-control">
								    <option value="1"> ${item.getState() }</option>
								    <option value="2">Notaccept</option>
								    <option value="3">Working</option>
								    <option value="4">Success</option>
								</select>            
		                      
		                       <td>
		                      	<%int num=0; %>    
		                      	<c:forEach var="detail" items="${item.getListTaskDetail() }">  
		                      	<%-- <img alt="" src='<c:url value="/resources/document/${detail.getDocument() }"/>'> --%>
		                      	<%-- <iframe src='<c:url value="/resources/document/${detail.getDocument() }"/>'></iframe> --%>
		                      	
		                      	
		                      
			                      	<div class="form-check">   
			                   	<c:choose>
									  <c:when test="${detail.isState()==true }">	 
									   	 <div class="checkbox">
									   	 
											<label><input type="checkbox" checked="checked" name="members"value="${detail.getId() }">${detail.getTaskname() }</label>
										 
										</div>
										<a href='<c:url value="/resources/document/${detail.getDocument() }"/>'>+viewFile</a>
										<%num++; %>
									  </c:when>
									  <c:otherwise>
										  <div class="checkbox">
												<label><input type="checkbox" name="members"value="${detail.getId() }">${detail.getTaskname() }</label>
											</div>
											<a href='<c:url value="/resources/document/${detail.getDocument() }"/>'>+viewFile</a>
									  </c:otherwise>
									</c:choose>
									 </div>
									 <br>
		                      	</c:forEach> 
		                      	<c:set var="wins" ><fmt:parseNumber type="number" value="${fn:length(item.getListTaskDetail())}" /></c:set>
		                      	<!-- JSP scriptlet culculator progess barr -->
		                      	<%
		                      	 String someVar = (String) pageContext.getAttribute("wins");
		                         Integer someVar1 = Integer.parseInt(someVar);
		                         Integer total=0;
		                         if(someVar1!=0){
		                        	 total=num*100/someVar1;
		                         }else{
		                        	total=0;
		                         }
		                      	 
		                      	%>
		                      <div class="progress">
			 					 <div class="progress-bar" role="progressbar" style="width: <%=total%>%;" aria-valuenow="<%=total%>" aria-valuemin="0" aria-valuemax="100"> <%out.println(total);%>%</div>
			 				  </div>
		                      </td> 
		                   
		                      <%--  <td>${item.getState() }</td> --%>
		                      <td>
		                      <a class="btn btn-primary btn-update-state">Update State</a>
		                      </td>
		                    </tr>
                      </c:forEach>
                      
                       
                   
                  </tbody>
                </table>
              </div>
             
            </div>
          </div>
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
