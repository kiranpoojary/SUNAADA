<%@page import="java.util.zip.CheckedInputStream"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sunada-Home</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="style.css">


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<style type="text/css">
.card {
	text-align: center;
	border: none;
	border-radius: 5px;
	-webkit-box-shadow: 12px 14px 22px 2px rgba(0, 0, 0, 0.75);
	-moz-box-shadow: 12px 14px 22px 2px rgba(0, 0, 0, 0.75);
	box-shadow: 12px 14px 22px 2px rgba(0, 0, 0, 0.75);
	margin-bottom: 100px;
}
/* Footer */
@import
	url('https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css')
	;

section {
	padding: 60px 0;
}

section .section-title {
	text-align: center;
	color: #007b5e;
	margin-bottom: 50px;
	text-transform: uppercase;
}

#footer {
	background: #007b5e !important;
}

#footer h5 {
	padding-left: 10px;
	border-left: 3px solid #eeeeee;
	padding-bottom: 6px;
	margin-bottom: 20px;
	color: #ffffff;
}

#footer a {
	color: #ffffff;
	text-decoration: none !important;
	background-color: transparent;
	-webkit-text-decoration-skip: objects;
}

#footer ul.social li {
	padding: 3px 0;
}

#footer ul.social li a i {
	margin-right: 5px;
	font-size: 25px;
	-webkit-transition: .5s all ease;
	-moz-transition: .5s all ease;
	transition: .5s all ease;
}

#footer ul.social li:hover a i {
	font-size: 30px;
	margin-top: -10px;
}

#footer ul.social li a, #footer ul.quick-links li a {
	color: #ffffff;
}

#footer ul.social li a:hover {
	color: #eeeeee;
}

#footer ul.quick-links li {
	padding: 3px 0;
	-webkit-transition: .5s all ease;
	-moz-transition: .5s all ease;
	transition: .5s all ease;
}

#footer ul.quick-links li:hover {
	padding: 3px 0;
	margin-left: 5px;
	font-weight: 700;
}

#footer ul.quick-links li a i {
	margin-right: 5px;
}

#footer ul.quick-links li:hover a i {
	font-weight: 700;
}

@media ( max-width :767px) {
	#footer h5 {
		padding-left: 0;
		border-left: transparent;
		padding-bottom: 0px;
		margin-bottom: 10px;
	}
}
</style>
</head>
<body>
	<%
		String log = "";
		String logeduser = "";
		if (session.getAttribute("currentSessionUser") != null && session.getAttribute("loged").equals("true")) {

			logeduser = (String) session.getAttribute("currentSessionUser");
			

		} else {
			logeduser = "Login";
			
		}
		
		
		
		HttpSession usersession = request.getSession();
		usersession.setAttribute("UserName", logeduser);

		String dbUrl = "jdbc:mysql://localhost/sunada";
		String driverName = "com.mysql.jdbc.Driver";
		Class.forName(driverName);
		Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
		String CheckingQuery = "select * from instruments order by sl desc";
		Statement statement = connection.createStatement();

		//PreparedStatement chekingStatement = (PreparedStatement) connection.prepareStatement(CheckingQuery);
		//chekingStatement.setString(1, userid);
		ResultSet checkedResult = statement.executeQuery(CheckingQuery);
		String encode;

		checkedResult.next();
		String pname1=checkedResult.getString(2);
		String pdesc1=checkedResult.getString(4);
		byte[] imgData1 = checkedResult.getBytes(8); // blob field 
		encode = Base64.getEncoder().encodeToString(imgData1);
		request.setAttribute("imgBase1", encode);

		checkedResult.next();
		String pname2=checkedResult.getString(2);
		String pdesc2=checkedResult.getString(4);
		byte[] imgData2 = checkedResult.getBytes(8);
		encode = Base64.getEncoder().encodeToString(imgData2);
		request.setAttribute("imgBase2", encode);

		checkedResult.next();
		String pname3=checkedResult.getString(2);
		String pdesc3=checkedResult.getString(4);
		byte[] imgData3 = checkedResult.getBytes(8); // blob field 
		encode = Base64.getEncoder().encodeToString(imgData3);
		request.setAttribute("imgBase3", encode);

		checkedResult.next();
		String pname4=checkedResult.getString(2);
		String pdesc4=checkedResult.getString(4);
		byte[] imgData4 = checkedResult.getBytes(8);
		encode = Base64.getEncoder().encodeToString(imgData4);
		request.setAttribute("imgBase4", encode);
		
		checkedResult.next();
		String pname5=checkedResult.getString(2);
		String pdesc5=checkedResult.getString(4);
		byte[] imgData5 = checkedResult.getBytes(8); // blob field 
		encode = Base64.getEncoder().encodeToString(imgData5);
		request.setAttribute("imgBase5", encode);

		checkedResult.next();
		String pname6=checkedResult.getString(2);
		String pdesc6=checkedResult.getString(4);
		byte[] imgData6 = checkedResult.getBytes(8);
		encode = Base64.getEncoder().encodeToString(imgData6);
		request.setAttribute("imgBase6", encode);

		checkedResult.next();
		String pname7=checkedResult.getString(2);
		String pdesc7=checkedResult.getString(4);
		byte[] imgData7 = checkedResult.getBytes(8); // blob field 
		encode = Base64.getEncoder().encodeToString(imgData7);
		request.setAttribute("imgBase7", encode);

		checkedResult.next();
		String pname8=checkedResult.getString(2);
		String pdesc8=checkedResult.getString(4);
		byte[] imgData8 = checkedResult.getBytes(8);
		encode = Base64.getEncoder().encodeToString(imgData8);
		request.setAttribute("imgBase8", encode);
	%>

	<form action="HomeServlet" method="post">
		<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
			class="navbar-brand" href="#">Sunada</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="AddInstrument.jsp">Add Instrument</a></li>

				<li class="nav-item"><a class="nav-link " href="DeleteInstrument.jsp">Delete Instrument</a>
				<li class="nav-item"><a class="nav-link" href="ActiveRents.jsp">View Rent Request</a>
				</li>
			</ul>

			 &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
			&nbsp; &nbsp;<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Administrator
			</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					
					<a class="dropdown-item" href="#">Change Password</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="Login.jsp">Logout</a>
				</div></li>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"></li>
				<li class="nav-item">

				</li>
			</ul>
		</div>
		</nav>



		<div class="row">
			<div class="col-md-12">
				<div id="carouselExampleControls" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img style="height: 500px; width: 700px" class="d-block w-100"
								src="http://localhost:8080/Sunaada/Images/ConfigImages/slider1.jpg"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img style="height: 500px; width: 700px" class="d-block w-100"
								src="http://localhost:8080/Sunaada/Images/ConfigImages/slider2.jpg"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img style="height: 500px; width: 700px" class="d-block w-100"
								src="http://localhost:8080/Sunaada/Images/ConfigImages/slider3.jpg"
								alt="Second slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleControls"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleControls"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>



		<div class="container">
			<div class="row mt-5">
				<h2>Newly Added Instruments</h2>
			</div>
			<div class="row mt-5">
				<div class="col-md-3">
					<div class="card">
						<img class="card-img-top img-fluid"
							src="data:image/jpeg;base64,${imgBase1}">
						<div class="card-title">
							<h4><%=pname1 %></h4>
						</div>
						<div class="card-text">
							<%= pdesc1 %><br />
							<br /><br>
							<button class="btn btn-success text-light" " aria-hidden="true"
								type="submit" value="rentNow1" name="clicked">View Details</button>
							 &nbsp;<br><br>
							
							<br /> <br />
						</div>
					</div>
				</div>


				<div class="col-md-3">
					<div class="card">
						<img class="card-img-top img-fluid"
							src="data:image/jpeg;base64,${imgBase2}">
						<div class="card-title">
							<h4><%=pname2 %></h4>
						</div>
						<div class="card-text">
							<%= pdesc2 %><br />
							<br />
							<button class="btn btn-success text-light" " aria-hidden="true"
								type="submit" value="rentNow2" name="clicked">View Details</button>
							&nbsp;<br><br>

							<br /> <br />
						</div>
					</div>
				</div>


				<div class="col-md-3">
					<div class="card">
						<img class="card-img-top img-fluid"
							src="data:image/jpeg;base64,${imgBase3}">
						<div class="card-title">
							<h4><%=pname3 %></h4>
						</div>
						<div class="card-text">
							<%= pdesc3 %><br />
							<br />
							<button class="btn btn-success text-light" " aria-hidden="true"
								type="submit" value="rentNow3" name="clicked">View Details</button>
							&nbsp;<br><br>

							<br /> <br />
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card">
						<img class="card-img-top img-fluid"
							src="data:image/jpeg;base64,${imgBase4}">
						<div class="card-title">
							<h4><%=pname4 %></h4>
						</div>
						<div class="card-text">
							<%= pdesc4 %><br />
							<br />
							<button class="btn btn-success text-light" " aria-hidden="true"
								type="submit" value="rentNow4" name="clicked">View Details</button>
							&nbsp;<br><br>

							<br /> <br />
						</div>
					</div>
				</div>
			</div>


		</div>

		<div class="container">


			<div class="row mt-5">
				<div class="col-md-3">
					<div class="card">
						<img class="card-img-top img-fluid"
							src="data:image/jpeg;base64,${imgBase5}">
						<div class="card-title">
							<h4><%=pname5 %></h4>
						</div>
						<div class="card-text">
							<%= pdesc5 %><br />
							<br />
							<button class="btn btn-success text-light" " aria-hidden="true"
								type="submit" value="rentNow5" name="clicked">View Details</button>
							&nbsp;<br><br>

							<br /> <br />
						</div>
					</div>
				</div>


				<div class="col-md-3">
					<div class="card">
						<img class="card-img-top img-fluid"
							src="data:image/jpeg;base64,${imgBase6}">
						<div class="card-title">
							<h4><%=pname6 %></h4>
						</div>
						<div class="card-text">
							<%= pdesc6 %><br />
							<br />
							<button class="btn btn-success text-light" " aria-hidden="true"
								type="submit" value="rentNow6" name="clicked">View Details</button>
							&nbsp;<br><br>

							<br /> <br />
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card">
						<img class="card-img-top img-fluid"
							src="data:image/jpeg;base64,${imgBase7}">
						<div class="card-title">
							<h4><%=pname7 %></h4>
						</div>
						<div class="card-text">
							<%= pdesc7 %><br />
							<br />
							<button class="btn btn-success text-light" " aria-hidden="true"
								type="submit" value="rentNow7" name="clicked">View Details</button>
							&nbsp;<br><br>

							<br /> <br />
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card">
						<img class="card-img-top img-fluid"
							src="data:image/jpeg;base64,${imgBase8}">
						<div class="card-title">
							<h4><%=pname8 %></h4>
						</div>
						<div class="card-text">
							<%= pdesc8 %><br />
							<br />
							<button class="btn btn-success text-light" " aria-hidden="true"
								type="submit" value="rentNow8" name="clicked">View Details</button>
							<br><br>

							<br /> <br />
						</div>
					</div>
				</div>
			</div>


		</div>









		<!-- Footer -->
		<section id="footer">
		<div class="container">
			<div class="row text-center text-xs-center text-sm-left text-md-left">
				<div class="col-xs-12 col-sm-4 col-md-4">
					<h5>Quick links</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="javascript:void();"><i
								class="fa fa-angle-double-right"></i>Home</a></li>
						<li><a href="javascript:void();"><i
								class="fa fa-angle-double-right"></i>About</a></li>
						<li><a href="javascript:void();"><i
								class="fa fa-angle-double-right"></i>FAQ</a></li>
						<li><a href="javascript:void();"><i
								class="fa fa-angle-double-right"></i>Get Started</a></li>
						<li><a href="javascript:void();"><i
								class="fa fa-angle-double-right"></i>Videos</a></li>
					</ul>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4">
					<h5>Quick links</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="javascript:void();"><i
								class="fa fa-angle-double-right"></i>Home</a></li>
						<li><a href="javascript:void();"><i
								class="fa fa-angle-double-right"></i>About</a></li>
						<li><a href="javascript:void();"><i
								class="fa fa-angle-double-right"></i>FAQ</a></li>
						<li><a href="javascript:void();"><i
								class="fa fa-angle-double-right"></i>Get Started</a></li>
						<li><a href="javascript:void();"><i
								class="fa fa-angle-double-right"></i>Videos</a></li>
					</ul>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4">
					<h5>Quick links</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="javascript:void();"><i
								class="fa fa-angle-double-right"></i>Home</a></li>
						<li><a href="javascript:void();"><i
								class="fa fa-angle-double-right"></i>About</a></li>
						<li><a href="javascript:void();"><i
								class="fa fa-angle-double-right"></i>FAQ</a></li>
						<li><a href="javascript:void();"><i
								class="fa fa-angle-double-right"></i>Get Started</a></li>
						<li><a href="https://wwwe.sunlimetech.com"
							title="Design and developed by"><i
								class="fa fa-angle-double-right"></i>Imprint</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
					<ul class="list-unstyled list-inline social text-center">
						<li class="list-inline-item"><a href="javascript:void();"><i
								class="fa fa-facebook"></i></a></li>
						<li class="list-inline-item"><a href="javascript:void();"><i
								class="fa fa-twitter"></i></a></li>
						<li class="list-inline-item"><a href="javascript:void();"><i
								class="fa fa-instagram"></i></a></li>
						<li class="list-inline-item"><a href="javascript:void();"><i
								class="fa fa-google-plus"></i></a></li>
						<li class="list-inline-item"><a href="javascript:void();"
							target="_blank"><i class="fa fa-envelope"></i></a></li>
					</ul>
				</div>
				</hr>
			</div>
			<div class="row">
				<div
					class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">
					<p>
						<u><a href="https://www.nationaltransaction.com/">National
								Transaction Corporation</a></u> is a Registered MSP/ISO of Elavon, Inc.
						Georgia [a wholly owned subsidiary of U.S. Bancorp, Minneapolis,
						MN]
					</p>
					<p class="h6">
						&copy All right Reversed.<a class="text-green ml-2"
							href="https://www.sunlimetech.com" target="_blank">Sunlimetech</a>
					</p>
				</div>
				</hr>
			</div>
		</div>
		</section>
		<!-- ./Footer -->




	</form>
</body>
</html>