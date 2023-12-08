<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP Page</title>

    f<!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            
</head>
<body style="background: url(img/bg1.jpg); background-size:cover; background-attachment:fixed;">
	<div class="container">
		<div class="row">
			<div class="col m6 offset-m3">
				<div class="card">
					<div class="card-content">
					<h3 style="margin-top" class="center-align">Register here !!</h3>
					<h5 id="msg" class="center-align"></h5>
					<div class="form center-align" >
					<!-- creating form -->
					<form action="Register" method="post" id="myForm">
						<input type="text" name="user_name" placeholder="Enter your name here">
						<input type="password" name="user_password" placeholder="Enter your password here">
						<input type="email" name="user_email" placeholder="Enter your email here">

								<div class="file-field input-field">
									<div class="btn blue">
										<span>File</span> <input type="file">
									</div>
									<div class="file-path-wrapper">
										<input class="file-path validate" type="text">
									</div>
								</div>

								<button type="submit" class="btn light-blue accent-3">Submit</button>
					</form>
					</div>
					<div class="loader center-align" style="margin-top:10px; display:none;" >
						<div class="preloader-wrapper big active">
							  <div class="spinner-layer spinner-blue">
							    <div class="circle-clipper left">
							      <div class="circle"></div>
							    </div><div class="gap-patch">
							      <div class="circle"></div>
							    </div><div class="circle-clipper right">
							      <div class="circle"></div>
							    </div>
							  </div>
							
							  <div class="spinner-layer spinner-red">
							    <div class="circle-clipper left">
							      <div class="circle"></div>
							    </div><div class="gap-patch">
							      <div class="circle"></div>
							    </div><div class="circle-clipper right">
							      <div class="circle"></div>
							    </div>
							  </div>
							
							  <div class="spinner-layer spinner-yellow">
							    <div class="circle-clipper left">
							      <div class="circle"></div>
							    </div><div class="gap-patch">
							      <div class="circle"></div>
							    </div><div class="circle-clipper right">
							      <div class="circle"></div>
							    </div>
							  </div>
							
							  <div class="spinner-layer spinner-green">
							    <div class="circle-clipper left">
							      <div class="circle"></div>
							    </div><div class="gap-patch">
							      <div class="circle"></div>
							    </div><div class="circle-clipper right">
							      <div class="circle"></div>
							    </div>
							  </div>
							</div>
        						<h5>Please wait...</h5>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script
  src="https://code.jquery.com/jquery-3.6.2.min.js"
  integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA="
  crossorigin="anonymous"></script>
  
  <script type="text/javascript">
  	$(document).ready(function(){
  		console.log("page is ready....");
  		
  		$("#myForm").on('submit',function (event){
  			event.preventDefault();
  			//var f = $(this).serialize();
  			let f = new FormData(this);
  			console.log(f);
  			
  			$(".loader").show();
  			$("form").hide();
  			
  			$.ajax({
  				url: "Register",
  				data: f,
  				type: 'POST',
  				success: function (data,textStatus,jqXHR){
  					console.log(data);
  					console.log("success...");
  					$(".loader").hide();
  		  			$("form").show();
  		  			if(data.trim() === 'done'){
  		  				$('#msg').html("successfully Registerd !!");
  		  				$("#msg").addClass('green-text');
  		  			}else{
  		  				$('#msg').html("Something went wrong on server... !!");
  		  			    $("#msg").addClass('red-text');
  		  			}
  				},
  				error: function (jqXHR,textStatus,errorThrown){
  					console.log(data);
  					console.log("error...");
  					$(".loader").hide();
  		  			$("form").show();
  		  		    $('#msg').html("Something went wrong on server... !!");
	  			    $("#msg").addClass('red-text');
  				},
  				processData: false,
  				contentType: false
  			})
  		})
  	})
  </script>
</body>
</html>