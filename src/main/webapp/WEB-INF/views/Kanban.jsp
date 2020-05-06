<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body>
	<div class="container-fluid pt-3">
	    <h3 class="font-weight-light text-white">Kanban Board</h3>
	    <div class="small  text-light">Drag and drop between swim lanes</div>
	    <div class="row flex-row flex-sm-nowrap py-3">
	        <div class="col-sm-6 col-md-3 col-xl-3">
	            <div class="card bg-light">
	                <div class="card-body">
	                    <h6 class="card-title text-uppercase text-truncate py-2">Notaccept</h6>
	                    <div class="items border border-light">
	                    <div class="dropzone rounded" ondrop="drop(event)" ondragover="allowDrop(event)" ondragleave="clearDrop(event)"> &nbsp; </div>
	                    <c:forEach var="task" items="${list}">
	                      <c:if test="${task.getState()=='Notaccept' }">
	                      
	                    
	                      <div class="card draggable shadow-sm" id="cd${task.getIdtask() }"data-id="${task.getIdtask() }"  draggable="true" ondragstart="drag(event)">
	                            <div class="card-body p-2">
	                                <div class="card-title" >
	                                    <img src="//placehold.it/30" class="rounded-circle float-right">
	                                    <a href="" class="lead font-weight-light">${task.getIdtask() }</a>
	                                </div>
	                                <p>
	                                   ${task.getTitle() }<hr>
	                                   ${task.getDescription() }
	                                </p>
	                                <button class="btn btn-primary btn-sm">View</button>
	                            </div>
	                        </div>
	                          <div class="dropzone rounded" ondrop="drop(event)" ondragover="allowDrop(event)" ondragleave="clearDrop(event)"> &nbsp; </div>
	                      </c:if>
	                    </c:forEach>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-sm-6 col-md-3 col-xl-3">
            <div class="card bg-light">
                <div class="card-body">
                    <h6 class="card-title text-uppercase text-truncate py-2">Working</h6>
                    <div class="items border border-light">
                   <div class="dropzone rounded" ondrop="drop(event)" ondragover="allowDrop(event)" ondragleave="clearDrop(event)"> &nbsp; </div>
                    <c:forEach var="taskworking" items="${list }">
                    	<c:if test="${taskworking.getState()=='Working' }">
                    	<div class="card draggable shadow-sm" id="cd${taskworking.getIdtask() }" data-id="${taskworking.getIdtask() }" draggable="true" ondragstart="drag(event)">
                            <div class="card-body p-2">
                                <div class="card-title" >
                                    <img src="//placehold.it/30" class="rounded-circle float-right">
                                    <a href="" class="lead font-weight-light">${taskworking.getIdtask() }</a>
                                </div>
                                <p>
                                    ${taskworking.getTitle() }<hr>
                                    ${taskworking.getDescription() }
                                </p>
                                <button class="btn btn-primary btn-sm">View</button>
                            </div>
                            </div>
                           <div class="dropzone rounded" ondrop="drop(event)" ondragover="allowDrop(event)" ondragleave="clearDrop(event)"> &nbsp; </div>
                             
                             
                            </c:if>
                    </c:forEach>
                    </div>
                </div>
            </div>
        </div>
	        <div class="col-sm-6 col-md-3 col-xl-3">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title text-uppercase text-truncate py-2">Success</h6>
                    <div class="items border border-light">
                    <div class="dropzone rounded" ondrop="drop(event)" ondragover="allowDrop(event)" ondragleave="clearDrop(event)"> &nbsp; </div>
                    <c:forEach var="tasksuccess" items="${list }">
                     <c:if test="${tasksuccess.getState()=='Success' }">
	                    <div class="card draggable shadow-sm" id="cd${tasksuccess.getIdtask() }" data-id="${tasksuccess.getIdtask() }" draggable="true" ondragstart="drag(event)">
	                            <div class="card-body p-2">
	                                <div class="card-title">
	                                    <img src="//placehold.it/30" class="rounded-circle float-right">
	                                    <a href="" class="lead font-weight-light">${tasksuccess.getIdtask() }</a>
	                                </div>
	                                <p>
	                                   ${tasksuccess.getTitle() }<hr>
	                                   ${taskworking.getDescription() }
	                                </p>
	                                <button class="btn btn-primary btn-sm">View</button>
	                            </div>
	                        </div>
                        <div class="dropzone rounded" ondrop="drop(event)" ondragover="allowDrop(event)" ondragleave="clearDrop(event)"> &nbsp; </div>
                     </c:if>
                    </c:forEach>
                       
                    </div>
                </div>
            </div>
        </div>
	    </div>
	</div>
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
  <script src='<c:url value="/resources/js/demo/customKanban.js"/>'></script>
  
</body>
</html>