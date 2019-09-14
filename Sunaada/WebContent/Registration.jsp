<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Registration</title>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
</head>


<style type="text/css">

	body,html{
	background: url(http://localhost:8081/Sunaada/Images/ConfigImages/background2.jpg);
	background-size:cover;
	background-repeat: no-repeat;
	height: 100%; font-family: 'Numans',sans-serif;

	background-size:100% 100vh;
}

.container{
	height: 100%;
	align-content: center;
}

.card{
	height: 600px;
	margin-top: auto;
	margin-bottom: auto;
	width: 400px;
	background-color: rgba(0,0,0,0.6) !important;
}

.social_icon span{
	font-size: 60px;
	margin-left: 10px;
	color: #81C922;
}

.social_icon span:hover{
	color: white;
	cursor: pointer;
}

.card-header h3{
	color: white;
}

.social_icon{
	position: absolute;
	right: 20px;
	top: -45px;
}

.input-group-prepend span{
	width: 50px;
	background-color: #81C922;
	color: black;
	border:0 !important;
}

input:focus{
	outline: 0 0 0 0  !important;
	box-shadow: 0 0 0 0 !important;

}

.remember{
	color: white;
}

.remember input
{
	width: 20px;
	height: 20px;
	margin-left: 15px;
	margin-right: 5px;
}

.reg_btn{
	color: black;
	background-color: #81C922;
	width: 130px;

}

.reg_btn:hover{
	color: black;
	background-color: white;
}

.links{
	color: white;
}

.links a{
	margin-left: 4px;
}
</style>

<body>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h3>Register</h3>
					
				</div>
				<div class="card-body">
					<form>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="Full Name">

						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-at"></i></span>
							</div>
							<input type="password" class="form-control" placeholder="Email ID">
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-mobile-alt"></i></span>
							</div>
							<input type="password" class="form-control" placeholder="Mobile Number">
						</div>
						
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" class="form-control" placeholder="Password">
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" class="form-control" placeholder="ReType Password">
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-question"></i></span>
							</div>
							<input type="password" class="form-control" placeholder="SecQ">
						</div>

							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-edit"></i></span>
								</div>
								<input type="password" class="form-control" placeholder="SecA">
							</div>
							<br>
							<div class="form-group ">
								<center>
									<input type="submit" value="Register Now" class="btn reg_btn ">
								</center>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</body>
	</html>

