<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>New Instruments</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!--Fontawesome CDN-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
	




</head>
<!-- 
<script type="text/javascript">
	function validateForm() {
		if (document.getElementById("psw").value != document
				.getElementById("cpsw").value) {
			swal("Warning!", "Password Mismatched", "warning");
			return false;
		} else {
			var e = document.getElementById("mylist");
			var x = e.options[e.selectedIndex].text;
			if (x == "Select a security Question") {
				swal("Warning!", "Select a valid security Question", "warning");
				return false;
			}
		}
	}
</script>
 -->
<style type="text/css">
body, html {
	background-image:
		url(http://localhost:8080/Sunaada/Images/ConfigImages/background2.jpg);
	background-size: cover;
	background-repeat: no-repeat;
	height: 100%;
	font-family: 'Numans', sans-serif;
	background-size: 100% 100vh;
}

.container {
	height: 100%;
	align-content: center;
}

.card {
	height: 650px;
	margin-top: 100px;
	margin-bottom: auto;
	width: 400px;
	background-color: rgba(0, 0, 0, 0.6) !important;
}

.social_icon span {
	font-size: 60px;
	margin-left: 10px;
	color: #81C922;
}

.social_icon span:hover {
	color: white;
	cursor: pointer;
}

.card-header h3 {
	color: white;
}

.social_icon {
	position: absolute;
	right: 20px;
	top: -45px;
}

.input-group-prepend span {
	width: 50px;
	background-color: #81C922;
	color: black;
	border: 0 !important;
}

input:focus {
	outline: 0 0 0 0 !important;
	box-shadow: 0 0 0 0 !important;
}

.remember {
	color: white;
}

.remember input {
	width: 20px;
	height: 20px;
	margin-left: 15px;
	margin-right: 5px;
}

.reg_btn {
	color: black;
	background-color: #81C922;
	width: 130px;
}

.reg_btn:hover {
	color: black;
	background-color: white;
}

.links {
	color: white;
}

.links a {
	margin-left: 4px;
}

.dropdown {
	background-color: white;
	color: black;
	width: 309px;
	padding: 7px;
	font-size: 16px;
	border: 0 !important;
}

.list {
	width: 300px;
	border: 0 !important;
}
</style>

<body>
	
	<form name="add" action="InstrumentAdder.jsp"  method="get" enctype='multipart/form-data'>
	
		<div class="container">
			<div class="d-flex justify-content-center h-100">
				<div class="card">
					<div class="card-header">
					<center>
						<h3>Add New Instruments</h3></center>
					</div>
					<div class="card-body">
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-question"></i></span>
							</div>
							<input type="text" name="iname" class="form-control"
								placeholder="Instrument Name" required>

						</div>
						
						
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-question"></i></span>
							</div>
							<div class="dropdown">
								<select id="cat" name="cat" class="list">
									
									<option value="Thabala">Thabala</option>
									<option value="Veena">Veena</option>
									<option
										value="Violin">Violin</option>
									<option value="Morsing">Morsing</option>
										<option value="Mridanga">Mridanga</option>
									<option value="Flute">Flute</option>
									<option value="Ghata">Ghata</option>
									<option
										value="Khanjari">Khanjari</option>
									
								</select>
							</div>
						</div>
						
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-question"></i></span>
							</div>
							<input type="text" name="desc" id="eid" class="form-control"
								placeholder="Description" required>
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i
									class="fas fa-question"></i></span>
							</div>
							<input type="text" name="pdf" class="form-control"
								placeholder="Per Day Fare" required>
						</div>

						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-question"></i></span>
							</div>
							<input type="text" name="deposite" 
								id="psw" class="form-control" placeholder="Security Deposite"   required>
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-question"></i></span>
							</div>
							<input type="text" id="cpsw"  name="stock"
								class="form-control" placeholder="Initial Stock" maxlength=6 minlength=1  pattern="[1234567890][0-9]{}" required>
						</div>

						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-image"></i></span>
							</div>
							<input type="file" name="pic1" class="form-control"
								placeholder="Image1" required>
						</div>
						
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-image"></i></span>
							</div>
							<input type="file" name="pic2" class="form-control"
								placeholder="Image2" required>
						</div>

						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-edit"></i></span>
							</div>
							<input type="text" name="discount" class="form-control"
								placeholder="Discount Rate"  required>
						</div>
						<div class="form-group ">
							<center>
								<input type="submit" value="Add Instrument" class="btn reg_btn ">
								</center>
							
							
						</div>
						
						

					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>

