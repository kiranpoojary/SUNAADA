<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	
	<script type="text/javascript">
	function subform() {
		document.getElementById("myform").submit();
		
	}
	</script>

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
</style>
</head>
<%
	String log = "";
	String logeduser = "";
	if (session.getAttribute("currentSessionUser") != null && session.getAttribute("loged").equals("true")) {

		logeduser = (String) session.getAttribute("currentSessionUser");

	} else {
		logeduser = "Login";

	}
%>
<body>

	<%
		String dbUrl = "jdbc:mysql://localhost/sunada";
		String driverName = "com.mysql.jdbc.Driver";
		Class.forName(driverName);
		Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
		//String selectedInstrument="Ghatam";
		String selectedInstrument = (String) request.getAttribute("selectedInstrument");
		PreparedStatement ps = (PreparedStatement) connection
				.prepareStatement("SELECT * FROM instruments where Instrument_Name=?");
		ps.setString(1, selectedInstrument);
		ResultSet getInstrument = ps.executeQuery();
		String encode;

		getInstrument.next();
		String pname = getInstrument.getString(1);
		String pdesc = getInstrument.getString(3);
		Double fare = getInstrument.getDouble(4);

		byte[] imgData1 = getInstrument.getBytes(8); // blob field 
		encode = Base64.getEncoder().encodeToString(imgData1);
		request.setAttribute("imgBase1", encode);

		byte[] imgData2 = getInstrument.getBytes(9); // blob field 
		encode = Base64.getEncoder().encodeToString(imgData2);
		request.setAttribute("imgBase2", encode);

		PreparedStatement getStock = (PreparedStatement) connection
				.prepareStatement("SELECT * FROM stock where Instrument_Name=?");
		getStock.setString(1, selectedInstrument);
		ResultSet getStockResult = getStock.executeQuery();

		getStockResult.next();
		Integer stock = (Integer) getStockResult.getInt(2);

		String status = getStockResult.getString(3);
		String minDate = java.time.LocalDate.now().toString();
	%>


	<form action="InstrumentServlet" method="post" id="myform">
		<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
			class="navbar-brand" href="Home.jsp">Sunada</a>
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
				<li class="nav-item"><a class="nav-link" href="#">MyInstruments</a></li>

				<li class="nav-item"><a class="nav-link disabled" href="#">Latest</a>
				</li>
			</ul>

			<input class="form-control mr-sm-2" type="text"
				placeholder="Search Instruments" aria-label="Search"
				name="instrument"> <input type="button"
				class="btn btn-outline-success my-2 my-sm-0 " name="clicked"
				value="search" onclick = "subform();"> &nbsp; &nbsp;
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <%=logeduser%>
			</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#"><%=(logeduser.equals("Login")) ? "Login Required" : "View Profile"%></a>
					<a class="dropdown-item" href="#"><%=(logeduser.equals("Login")) ? "Login Required" : "Change Password"%></a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="Login.jsp"><%=(logeduser.equals("Login")) ? "Login" : "Logout"%></a>
				</div></li>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"></li>
				<li class="nav-item">
				
						
					<button class="btn btn-danger text-light fa fa-heart"
						aria-hidden="true" type="button" value="wishlistAll"
						name="clicked" onclick="subform()">Wish List</button>
				</li>
			</ul>
		</div>
		</nav>
		<div class="container"></div>
		<div class="container mt-5"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div id="carouselExampleControls" class="carousel slide"
						data-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img style="height: 520px; width: 110px" class="d-block w-100"
									src="data:image/jpeg;base64,${imgBase1}" alt="First slide">
							</div>
							<div class="carousel-item">
								<img style="height: 520px; width: 110px" class="d-block w-100"
									src="data:image/jpeg;base64,${imgBase2}" alt="Second slide">
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
				<div class="col-md-6">
					<div class="row">
						<h2><%=pname%></h2>
					</div>
					<div class="row">
						<h1>
							<i class="fa fa-inr" aria-hidden="true"></i><%=fare%>/day
						</h1>
						&nbsp; &nbsp;
						<h3>
							<del>799</del>
						</h3>
						&nbsp; &nbsp;
						<h2 class="text-success">30% off</h2>
					</div>
					<div class="row">

						&nbsp; &nbsp; <label style="color: red">Service Rating :</label>
						<h5 style="color: green">
							<b>3.5/5</b></b>
						</h5>
					</div>
					<div class="row">
						<%=pdesc%>

						<p>
							<br> <br> <br> <br> <i
								class="text-success fa fa-check-square-o" aria-hidden="true"></i>
							<strong>Wallet Offer :</strong>5% Instant Discount on pay with <i
								class="fa fa-google-wallet" aria-hidden="true"></i> Sunada
							wallet
						</p>
					</div>
					<div class="row mt-4">

						<p style="font-size: 20px">
							&nbsp; Stock Status| &nbsp; <span class="text-success"><%=status%></span>
						</p>
					</div>


					<div class="row mt-4">
						<h4>Required Instrument: &nbsp; &nbsp;</h4>
						<p style="font-size: 21px">
							<input class="form-control" max=6 min=1 value="1" type="number">
						</p>
					</div>
					<div class="row mt-4">
						<input type="date" class="form-control" min="<%=minDate%>"
							style="height: 40px; width: 180px" name="date" required>
						&nbsp; &nbsp; &nbsp; &nbsp;
							<button class="btn btn-success text-light" " aria-hidden="true"
								type="submit" value="rentNow" name="clicked">Rent Now</button>
								&nbsp; &nbsp; &nbsp; &nbsp;
						<button class="btn btn-danger text-light fa fa-heart"
						aria-hidden="true" type="button" value="wishlistAll"
						name="clicked" onclick="subform()">Wish List</button>
						<p style="font-size: 21px">	
						</p>
					</div>
				</div>
			</div>
		</div>

		<%
			PreparedStatement getReviews = (PreparedStatement) connection
					.prepareStatement("SELECT * FROM user_ratings where Instrument_Name=?");
			getReviews.setString(1, selectedInstrument);
			ResultSet reviewResult = getReviews.executeQuery();

			PreparedStatement getProfile = (PreparedStatement) connection
					.prepareStatement("SELECT * FROM users u,user_ratings rr WHERE u.UserID=rr.UserID");

			ResultSet profileResult = getProfile.executeQuery();
		%>

		<div class="container mt-5 mb-5">
			<div class="row">
				<h2>Ratings & Reviews</h2>
			</div>
			<%
				byte[] imgData;

				while (reviewResult.next() && profileResult.next()) {

					imgData = profileResult.getBytes(8);
					encode = Base64.getEncoder().encodeToString(imgData);
					request.setAttribute("imgBase", encode);
					out.print("<div class='row mb-2'>");
					out.print("<div class='media'>");
			%>

			<img style="height: 50px; width: 30px" class="d-block w-100"
				src="data:image/jpeg;base64,${imgBase}" alt="Profile Image">

			<%
				out.print("</div>");
					out.print("<div class='media-body'>");
					out.print("<h5 class='mt-0'>");
					out.print(profileResult.getString(1));
					out.print("<span class='text-warning'>");
					out.print("<i class='fa fa-star aria-hidden=true'>");
					out.print("</i>");
					out.print("<i class='fa fa-star aria-hidden='true'>");
					out.print("</i>");
					out.print("<i class='fa fa-star aria-hidden=true'>");
					out.print("</i>");
					out.print("<i class='fa fa-star aria-hidden=true'>");
					out.print("</i>");
					out.print("<i class='fa fa-star' aria-hidden='true'>");
					out.print("</i>");
					out.print("</span>");
					out.print("</h5>");

					out.print(reviewResult.getString(3));

					out.print("</div>");
					out.print("</div>");
					out.print("</br><hr>");
				}
			%>



			<div class="row mb-5">
				<h2>Post Your Own Reviews</h2>
			</div>


			<form>
				<div class="form-group">
					<label for="exampleInputEmail1">Email address</label> <input
						type="email" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="Enter email"> <small
						id="emailHelp" class="form-text text-muted">We'll never
						share your email with anyone else.</small>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label>
					<textarea type="text" class="form-control"
						id="exampleInputtextarea" placeholder="write your own reviews"
						rows="3"></textarea>
				</div>
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="exampleCheck1">
					<label class="form-check-label" for="exampleCheck1">Check
						me out</label>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>

		</div>




	</form>
</body>
</html>