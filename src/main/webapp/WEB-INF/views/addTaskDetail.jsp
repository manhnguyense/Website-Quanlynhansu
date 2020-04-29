<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add TASK DETAIL</title>
</head>
<body>
    <div class="container-fluid">
	<form action="" method="post">
	  <div class="form-group row">
		<div class="form-group">
		  <label for="taskname">Task Name</label>
		    <input type="text" class="form-control" id="taskname" placeholder="Task" name="taskname">
		  </div>
	  </div>
	   <div class="form-group">
	    <label for="exampleFormControlFile1">Document</label>
	    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="document">
	  </div>
	  <button type="submit">Submit</button>	 
	</form>
	</div>
</body>
</html>