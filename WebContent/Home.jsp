<%@page import="java.util.Base64"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*" %>
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
@import url('https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css');
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
#footer h5{
	padding-left: 10px;
    border-left: 3px solid #eeeeee;
    padding-bottom: 6px;
    margin-bottom: 20px;
    color:#ffffff;
}
#footer a {
    color: #ffffff;
    text-decoration: none !important;
    background-color: transparent;
    -webkit-text-decoration-skip: objects;
}
#footer ul.social li{
	padding: 3px 0;
}
#footer ul.social li a i {
    margin-right: 5px;
	font-size:25px;
	-webkit-transition: .5s all ease;
	-moz-transition: .5s all ease;
	transition: .5s all ease;
}
#footer ul.social li:hover a i {
	font-size:30px;
	margin-top:-10px;
}
#footer ul.social li a,
#footer ul.quick-links li a{
	color:#ffffff;
}
#footer ul.social li a:hover{
	color:#eeeeee;
}
#footer ul.quick-links li{
	padding: 3px 0;
	-webkit-transition: .5s all ease;
	-moz-transition: .5s all ease;
	transition: .5s all ease;
}
#footer ul.quick-links li:hover{
	padding: 3px 0;
	margin-left:5px;
	font-weight:700;
}
#footer ul.quick-links li a i{
	margin-right: 5px;
}
#footer ul.quick-links li:hover a i {
    font-weight: 700;
}

@media (max-width:767px){
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

String dbUrl = "jdbc:mysql://localhost/sunada";
String driverName = "com.mysql.jdbc.Driver";
Class.forName(driverName);
Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
String CheckingQuery = "select * from instruments";
Statement statement=connection.createStatement();

//PreparedStatement chekingStatement = (PreparedStatement) connection.prepareStatement(CheckingQuery);
//chekingStatement.setString(1, userid);
ResultSet checkedResult = statement.executeQuery(CheckingQuery);
ResultSet r1=null;
ResultSet r2=null;

r1=(checkedResult.next())?checkedResult:null;


byte[] imgData1 = r1.getBytes("Image1"); // blob field 
request.setAttribute("rvi", "Ravinath");
r1.getString(2);
String encode=Base64.getEncoder().encodeToString(imgData1);
request.setAttribute("imgBase1", encode);

r2=(checkedResult.next())?checkedResult:null;

byte[] imgData2 = r2.getBytes("Image1"); // blob field 
request.setAttribute("rvi2", "Ravinath2");
r2.getString(2);
String encod2=Base64.getEncoder().encodeToString(imgData1);
request.setAttribute("imgBase2", encode);


%>

	<div class="">
		<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
			class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Dropdown </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a
					class="btn btn-md btn-danger ml-4 text-light"><i
						class="fa fa-shopping-cart" aria-hidden="true"></i> CART</a></li>
			</ul>
		</div>
		</nav>
	</div>


	<div class="row">
		<div class="col-md-12">
			<div id="carouselExampleControls" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img style="height: 500px; width: 700px" class="d-block w-100"
							src="http://localhost:8080/Sunaada/Images/ConfigImages/background1.jpg"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img style="height: 500px; width: 700px" class="d-block w-100"
							src="http://localhost:8080/Sunaada/Images/ConfigImages/background2.jpg"
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
			<h2>Similar Products</h2>
		</div>

		<div class="row mt-5">
			<div class="col-md-3">
				<div class="card">
					<img class="card-img-top img-fluid" src="data:image/jpeg;base64,${imgBase1}">
					<div class="card-title">
						<h4>GYM Tops</h4>
					</div>
					<div class="card-text">
						Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Repudiandae fugiat et voluptate sunt officia vero molestias.<br />
						<br /> <a class="btn btn-success text-light"> Buy Now</a> &nbsp;
						<a class="btn btn-danger text-light"><i
							class="fa fa-cart-plus" aria-hidden="true"></i> Add To Cart</a> <br />
						<br />
					</div>
				</div>
			</div>


			<div class="col-md-3">
				<div class="card">
					<img class="card-img-top img-fluid" src="data:image/jpeg;base64,${imgBase2}">
					<div class="card-title">
						<h4>GYM Tops</h4>
					</div>
					<div class="card-text">
						Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Repudiandae fugiat et voluptate sunt officia vero molestias.<br />
						<br /> <a class="btn btn-success text-light"> Buy Now</a> &nbsp;
						<a class="btn btn-danger text-light"><i
							class="fa fa-cart-plus" aria-hidden="true"></i> Add To Cart</a> <br />
						<br />
					</div>
				</div>
			</div>


			<div class="col-md-3">
				<div class="card">
					<img class="card-img-top img-fluid" src="c132.jpg">
					<div class="card-title">
						<h4>GYM Tops</h4>
					</div>
					<div class="card-text">
						Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Repudiandae fugiat et voluptate sunt officia vero molestias.<br />
						<br /> <a class="btn btn-success text-light"> Buy Now</a> &nbsp;
						<a class="btn btn-danger text-light"><i
							class="fa fa-cart-plus" aria-hidden="true"></i> Add To Cart</a> <br />
						<br />
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<img class="card-img-top img-fluid" src="c172.jpg">
					<div class="card-title">
						<h4>GYM Tops</h4>
					</div>
					<div class="card-text">
						Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Repudiandae fugiat et voluptate sunt officia vero molestias.<br />
						<br /> <a class="btn btn-success text-light"> Buy Now</a> &nbsp;
						<a class="btn btn-danger text-light"><i
							class="fa fa-cart-plus" aria-hidden="true"></i> Add To Cart</a> <br />
						<br />
					</div>
				</div>
			</div>
		</div>


	</div>

<div class="container">
		

		<div class="row mt-5">
			<div class="col-md-3">
				<div class="card">
					<img class="card-img-top img-fluid" src="c61.jpg">
					<div class="card-title">
						<h4>GYM Tops</h4>
					</div>
					<div class="card-text">
						Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Repudiandae fugiat et voluptate sunt officia vero molestias.<br />
						<br /> <a class="btn btn-success text-light"> Buy Now</a> &nbsp;
						<a class="btn btn-danger text-light"><i
							class="fa fa-cart-plus" aria-hidden="true"></i> Add To Cart</a> <br />
						<br />
					</div>
				</div>
			</div>


			<div class="col-md-3">
				<div class="card">
					<img class="card-img-top img-fluid" src="c94.jpg">
					<div class="card-title">
						<h4>GYM Tops</h4>
					</div>
					<div class="card-text">
						Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Repudiandae fugiat et voluptate sunt officia vero molestias.<br />
						<br /> <a class="btn btn-success text-light"> Buy Now</a> &nbsp;
						<a class="btn btn-danger text-light"><i
							class="fa fa-cart-plus" aria-hidden="true"></i> Add To Cart</a> <br />
						<br />
					</div>
				</div>
			</div>


			<div class="col-md-3">
				<div class="card">
					<img class="card-img-top img-fluid" src="c132.jpg">
					<div class="card-title">
						<h4>GYM Tops</h4>
					</div>
					<div class="card-text">
						Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Repudiandae fugiat et voluptate sunt officia vero molestias.<br />
						<br /> <a class="btn btn-success text-light"> Buy Now</a> &nbsp;
						<a class="btn btn-danger text-light"><i
							class="fa fa-cart-plus" aria-hidden="true"></i> Add To Cart</a> <br />
						<br />
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card">
					<img class="card-img-top img-fluid" src="c172.jpg">
					<div class="card-title">
						<h4>GYM Tops</h4>
					</div>
					<div class="card-text">
						Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Repudiandae fugiat et voluptate sunt officia vero molestias.<br />
						<br /> <a class="btn btn-success text-light"> Buy Now</a> &nbsp;
						<a class="btn btn-danger text-light"><i
							class="fa fa-cart-plus" aria-hidden="true"></i> Add To Cart</a> <br />
						<br />
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
						<li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Home</a></li>
						<li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>About</a></li>
						<li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>FAQ</a></li>
						<li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Get Started</a></li>
						<li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Videos</a></li>
					</ul>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4">
					<h5>Quick links</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Home</a></li>
						<li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>About</a></li>
						<li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>FAQ</a></li>
						<li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Get Started</a></li>
						<li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Videos</a></li>
					</ul>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4">
					<h5>Quick links</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Home</a></li>
						<li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>About</a></li>
						<li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>FAQ</a></li>
						<li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Get Started</a></li>
						<li><a href="https://wwwe.sunlimetech.com" title="Design and developed by"><i class="fa fa-angle-double-right"></i>Imprint</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
					<ul class="list-unstyled list-inline social text-center">
						<li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-facebook"></i></a></li>
						<li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-twitter"></i></a></li>
						<li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-instagram"></i></a></li>
						<li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-google-plus"></i></a></li>
						<li class="list-inline-item"><a href="javascript:void();" target="_blank"><i class="fa fa-envelope"></i></a></li>
					</ul>
				</div>
				</hr>
			</div>	
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">
					<p><u><a href="https://www.nationaltransaction.com/">National Transaction Corporation</a></u> is a Registered MSP/ISO of Elavon, Inc. Georgia [a wholly owned subsidiary of U.S. Bancorp, Minneapolis, MN]</p>
					<p class="h6">&copy All right Reversed.<a class="text-green ml-2" href="https://www.sunlimetech.com" target="_blank">Sunlimetech</a></p>
				</div>
				</hr>
			</div>	
		</div>
	</section>
	<!-- ./Footer -->





</body>
</html>