$(document).ready(function(){
	$(".btn-add").on("click",function(){
		$(".table_task").hide();
		$(".add_task").show();
	})
	
	function hide(){
		$(".add_task").hide();
		$(".form-notify").hide();
	}
	
	$(".btn-back").on("click",function(){
		$(".table_task").show();
		$(".add_task").hide();
	})
	//add task
	$(".btn-submit").on("click",function(){
		title=$('input[id="title"]').val();
		describer=$('textarea[id="discriber"]').val();
		duedate=$('input[id="datepicker"]').val();
		duetime=$('input[id="timepicker1"]').val();
		notifytime=$('input[id="notifytime"').val();
		var array = [];
	        $(':checkbox:checked').each(function(i){
	         Object1={};
	         
	          Object1["id"] = $(this).val();
	          array.push(Object1);
	        });
		json={}
		json["title"]=title;
		json["describer"]=describer;
		json["duedate"]=duedate;
		json["duetime"]=duetime;
		json["listmember"]=array;
		json["notifytime"]=notifytime;
	$.ajax({
		url:"/springmvc5-hibernate5-jsp-mysql-example/api/add",
		type:"GET",
		data:{
				json:JSON.stringify(json)
				
			},
			success: function(value){
				if(value=="true"){
					location.reload();
				}
				else{
					alert("Fail add task");
				}
			}	
	})
		
	})
	// add member
	$(".btn-add-member").on("click",function(){
     	name=$('input[id="membername"]').val();
		address=$('input[id="address1"]').val();
		email=$("input[id='email']").val();
		phone=$("input[id='phone']").val();
		sex=$("#sex option:selected").val();
		username=$("input[id='username']").val();
		password=$("input[id='password']").val();
		json1={};
		json1["name"]=name;
		json1["address"]=address;
		json1["email"]=email;
		json1["phone"]=phone;
		json1["sex"]=sex;
		json1["username"]=username;
		json1["password"]=password;
		console.log(json1);
		$.ajax({
			url:"/springmvc5-hibernate5-jsp-mysql-example/api/addMember",
			type:"POST",
			data:{
					json:JSON.stringify(json1)
					
				},
				success: function(value){
					if(value=="true"){
						alert("Success");
						}
					else{
						alert("Fail add task");
					}
				}	
		})
	})
	//update task
	$(".btn-update").on("click",function(){
		title=$('input[id="title"]').val();
		describer=$('textarea[id="discriber"]').val();
		duedate=$('input[id="datepicker"]').val();
		duetime=$('input[id="timepicker1"]').val();
		id=$("#idtask").attr("data-id");
		state=$('input[id="state"]').val();
		 var array = [];
	        $(':checkbox:checked').each(function(i){
	         Object1={};
	         
	          Object1["id"] = $(this).val();
	          array.push(Object1);
	        });
		json={}
		json["id"]=id;
		json["title"]=title;
		json["describer"]=describer;
		json["duedate"]=duedate;
		json["duetime"]=duetime;
		json["state"]=state;
		json["listmember"]=array;
		console.log(json);
	$.ajax({
		url:"/springmvc5-hibernate5-jsp-mysql-example/api/updateTask",
		type:"POST",
		data:{
				json:JSON.stringify(json)
				
			},
			success: function(value){
				if(value=="true"){
					alert("success");
				}
				else{
					alert("Fail add task");
				}
			}	
	})
		
	})
	//login
	$(".btn-login").on("click",function(){
		var username=$("input[type='email']").val();
		var password=$("input[type='password']").val();
		$.ajax({
			url:"/springmvc5-hibernate5-jsp-mysql-example/api/login",
			type:"POST",
			data:{
					username:username,
					password:password
					
				},
				success: function(value){
					if(value=="true"){
						 window.location="/springmvc5-hibernate5-jsp-mysql-example/member/taskMember";
					}else{
						$("#checklogin").text("Login Failed");
					}
				}	
		})
		
	})
	//update state
	$(".btn-update-state").on("click",function(){
		var id = $(this).closest("tr").find(".idchange").text() 
		var state = $(this).closest("tr").find(".choose").find("option:selected").text() 
		var array = [];
	        $(this).closest("tr").find(':checkbox:checked').each(function(i){
	         Object1={};
	         Object1["id"] = $(this).val();
	         array.push(Object1);
	        });
	        json={};
	        json["id"]=id;
			json["state"]=state;
			json["list"]=array;
			console.log(json);
		$.ajax({
			url:"/springmvc5-hibernate5-jsp-mysql-example/api/updatestate",
			type:"POST",
			data:{
					json:JSON.stringify(json)
				
					
				},
				success: function(value){
					if(value=="true"){
						location.reload();
					}
				}	
		})
	})
	
	//send data update notify time
	$(document).on("click",".btn-update-notify",function(){
		var id = $(this).closest("tr").find(".idstask").text() 
		var notifyTime= $(this).closest("tr").find('input[id="notifyTask"]').val();
	
		$.ajax({
			url:"/springmvc5-hibernate5-jsp-mysql-example/api/updatenotifytime",
			type:"POST",
			data:{
					id:id,
					notifyTime:notifyTime
					
				},
				success: function(value){
					if(value=="true"){
						location.reload();
					}
				}	
		})
	})
	$(document).on("click",".paginate_button",function(){
		$(".form-notify").hide();
	})
	hide();
	//showform
	$(document).on("click",".btn-notify",function(){
		$(this).hide();
		$(this).closest("tr").find(".form-notify").show();
		$(".default").hide();
	})
	$(document).on("click",".btn-close",function(){
		$(this).closest("tr").find(".form-notify").hide();
		$(".btn-notify").show();
		$(".default").show();
	})
	
})