<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  <link href='<c:url value="/resources/vendor/fontawesome-free/css/all.min.css"/>' rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link href='<c:url value="/resources/css/style.css"/>' rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href='<c:url value="/resources/css/sb-admin-2.min.css"/>' rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href='<c:url value="/resources/vendor/datatables/dataTables.bootstrap4.min.css"/>' rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
  <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
	<!------ Include the above in your HEAD tag ---------->
</head>
<body>
	<div class="container">
	<div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="well well-sm">
          <form class="form-horizontal">
          <fieldset>
            <legend class="text-center">Contact us</legend>
			 <div class="form-group">
              <label class="col-md-3 control-label" for="Idlist">Member</label>
              <div class="col-md-9">
                <select class="form-control" id="Idlist">
                  <option>Choose Employee</option>
			      <c:forEach var="item" items="${listmember }">
			  		<option  class="dropdown-item" data-id="${item.getIdmember() }">${item. getName() }</option>
			  	</c:forEach>
			    </select>
              </div>
            </div>
            	
			 
            <!-- Message body -->
            <div class="form-group">
              <label class="col-md-3 control-label" for="message">Your message</label>
              <div class="col-md-9">
                <textarea class="form-control" id="message" name="message" placeholder="Please enter your message here..." rows="5"></textarea>
              </div>
            </div>
             <div class="custom-file">
			    <input type="file" class="custom-file-input" id="filename" name="document">
			    <label class="custom-file-label" for="filename">Choose file</label>
			  </div>
				<br/>
			 <div class="progress">
				  <div class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
			</div> 
    
            <!-- Form actions -->
            <div class="form-group">
              <div class="col-md-12 text-right">
                <a type="submit" class="btn btn-primary btn-lg btn-xq">Submit</a>
              </div>
            </div>
          </fieldset>
          </form>
        </div>
          <div><h3>History Contact</h3>
	      	<div class="row">
	      	 	<h4 class="information"></h4>
	      	 	
	      	</div>
	      </div>
      </div>
     
	</div>
     
     
</div>
<script>
// Add the following code if you want the name of the file appear on select
	$(".custom-file-input").on("change", function() {
	  var fileName = $(this).val().split("\\").pop();
	  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
	});
	</script>
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