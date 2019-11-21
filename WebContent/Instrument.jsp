<%@page import="java.text.ParseException"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="javax.swing.text.DateFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
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
	pageEncoding="ISO-8859-1" errorPage="NotFound.html"%>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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


<script type="text/javascript">
	function IsEmpty() {
		if (document.forms['frm'].review.value === "") {
			swal("Warning!", "Review Should Not Be Empty", "warning");
			return false;
		}
		return true;
	}
</script>


</head>
<%
	String log = "";
	String logeduser = "";

	if (session.getAttribute("currentSessionUser") != null && session.getAttribute("loged").equals("true")) {
		logeduser = (String) session.getAttribute("currentSessionUser");
		session.setAttribute("currentSessionUser", logeduser);

	} else {
		logeduser = "Login";
		session.setAttribute("currentSessionUser", "Login");

	}
%>
<body>

	<%
		String dbUrl = "jdbc:mysql://localhost/sunada";
		String driverName = "com.mysql.jdbc.Driver";
		Class.forName(driverName);
		Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
		String selectedInstrument = ((String) request.getAttribute("selectedInstrument") != null)
				? (String) request.getAttribute("selectedInstrument")
				: (String) session.getAttribute("selectedInstrument");
		session.setAttribute("selectedInstrument", selectedInstrument);

		PreparedStatement ps = (PreparedStatement) connection
				.prepareStatement("SELECT * FROM instruments where Instrument_Name=?");
		ps.setString(1, selectedInstrument);
		ResultSet getInstrument = ps.executeQuery();
		String encode;

		getInstrument.next();
		String pname = getInstrument.getString(1);
		String pdesc = getInstrument.getString(3);
		Double fare = getInstrument.getDouble(4);
		Integer qty = getInstrument.getInt(6);
		Integer off = getInstrument.getInt(9);
		session.setAttribute("fare", ((fare - ((fare * off) / 100))));
		session.setAttribute("discount", ((fare * off) / 100));
		
		String status;

		if (qty > 0) {

			status = "Available";

		} else {
			status = "UnAvailable";
		}

		byte[] imgData1 = getInstrument.getBytes(7); // blob field 
		encode = Base64.getEncoder().encodeToString(imgData1);
		request.setAttribute("imgBase1", encode);

		byte[] imgData2 = getInstrument.getBytes(8); // blob field 
		encode = Base64.getEncoder().encodeToString(imgData2);
		request.setAttribute("imgBase2", encode);

		PreparedStatement getRate = (PreparedStatement) connection
				.prepareStatement("SELECT AVG(rate) FROM user_ratings where Instrument_Name=?");
		getRate.setString(1, selectedInstrument);
		ResultSet rateResult = getRate.executeQuery();
		rateResult.next();
		float avgRate = rateResult.getFloat(1);
		int intAvg = (int) avgRate / 1;
		float floatAvg = (float) avgRate % 1;
	%>


	<form action="InstrumentServlet" name="frm" method="post" id="myform"
		onsubmit="return validateForm()">
		<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
			class="navbar-brand" href="Home.jsp">Sunada</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>


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
							<i class="fa fa-inr" aria-hidden="true"></i><%=fare - ((fare * off) / 100)%>/day
						</h1>
						&nbsp; &nbsp;
						<h3>
							<del><%=fare%></del>
						</h3>
						&nbsp; &nbsp;
						<h2 class="text-success"><%=off%>% off
						</h2>
					</div>
					<div class="row">

						&nbsp; &nbsp; <label style="color: red">Service Rating :</label> <b>
							<%
								int i, j;
								if (intAvg > 0) {
									for (i = 1; i <= intAvg; i++) {
										out.print("<i class='fa fa-star aria-hidden=true' style='font-size:20px;color:#FCDF03'>");
										out.print("</i>");
									}
									if (floatAvg > 0) {
										out.print("<i class='fa fa-star-half-o' style='font-size:20px;color:#FCDF03'>");
										out.print("</i>");
									} else
										i--;
									for (j = i; j < 5; j++) {
										out.print("<i class='fa fa-star'  style='font-size:20px;color:#D3D3D3'>");
										out.print("</i>");

									}
								}

								else {
									out.print("No Ratings Available");

								}
							%>
						</b></b>

					</div>
					<div class="row">
						<%=pdesc%>

						<p>
							<br> <br> <i class="text-success fa fa-check-square-o"
								aria-hidden="true"></i> <strong>Wallet Offer :</strong> Use
							Sunada Wallet To Avail Future Rental Benefits <i
								class="fa fa-google-wallet" aria-hidden="true"></i>
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
							<input class="form-control" max=6 min=1 value="1" type="number" name="reqQty">
						</p>
					</div>
					<div class="row mt-4">
						&nbsp; &nbsp; &nbsp; &nbsp;
						<%
							if (status.equals("Available")) {
						%>
						From&nbsp; &nbsp; &nbsp;<input type="date" class="form-control"
							min="<%=java.time.LocalDate.now().toString()%>"
							style="height: 40px; width: 180px" name="datefrom"
							value="<%=java.time.LocalDate.now().toString()%>" required>
						&nbsp; &nbsp; &nbsp; &nbsp; To&nbsp; &nbsp; &nbsp; <input
							type="date" class="form-control"
							min="<%=java.time.LocalDate.now().plusDays(1).toString()%>"
							style="height: 40px; width: 180px" name="dateto"
							value="<%=java.time.LocalDate.now().plusDays(1).toString()%>"
							required> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
						&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
</div >
						
						<%
						
							out.print("<button class='btn btn-success text-light'  aria-hidden='true' type='submit' value='rentNow' name='clicked'>Rent Now</button>");
							} else {

								out.print(
										"<button class='btn btn-success text-light'  aria-hidden='true' type='submit' value='rentNow' name='clicked' disabled>Rent Now</button>");

							}
						%>

						&nbsp; &nbsp; &nbsp; &nbsp;
						<button class="btn btn-danger text-light fa fa-heart"
							aria-hidden="true" type="submit" value="addwishlist"
							name="clicked">Add To Wish List</button>
						<p style="font-size: 21px"></p>
					</div>
				</div>
			</div>
		</div>

		<%
			int rate;
			PreparedStatement getReviews = (PreparedStatement) connection
					.prepareStatement("SELECT * FROM user_ratings ur WHERE  ur.Instrument_Name=?");
			getReviews.setString(1, selectedInstrument);
			ResultSet reviewResult = getReviews.executeQuery();

			PreparedStatement getProfile = (PreparedStatement) connection.prepareStatement(
					"SELECT * FROM users u,user_ratings ur WHERE ur.UserID=u.UserID  AND ur.Instrument_Name=?");
			getProfile.setString(1, selectedInstrument);
			ResultSet profileResult = getProfile.executeQuery();
		%>

		<div class="container mt-5 mb-5">
			<div class="row">
				<h2>Reviews & Ratings</h2>

			</div>
			<%
				byte[] imgData;

				while (reviewResult.next() && profileResult.next()) {

					rate = Integer.parseInt(reviewResult.getString(4));
					imgData = profileResult.getBytes(9);
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

					for (i = 1; i <= 5; i++) {
						if (rate >= i) {
							out.print("<i class='fa fa-star aria-hidden=true'>");
							out.print("</i>");

						} else {
							out.print("<i class='fa fa-star'  style='font-size:20px;color:#D3D3D3'>");
							out.print("</i>");
						}

					}

					out.print("</span>");
					out.print("</h5>");

					out.print(reviewResult.getString(3));

					out.print("</div>");
					out.print("</div>");
					out.print("</br><hr>");
				}
			%>


			<%
				if (logeduser.equals("Login")) {
			%>
			<h1>Login to Add Review</h1>

			<%
				} else {
			%>
			<div class="row mb-5">
				<h2>Post Your Own Reviews</h2>
			</div>




			<div class="form-group">
				<label for="exampleInputPassword1">Add Your Reviews Bellow</label>
				<textarea type="text" class="form-control" id="exampleInputtextarea"
					name="review" placeholder="write your own reviews" rows="3"></textarea>
			</div>
			Select Rating <input class="list" type="number" name="rate" value=1
				min=1 max=5>
			<div class="form-check"></div>
			<br>
			<button type="submit" onclick="return IsEmpty();" name="clicked"
				value="review" class="btn btn-primary">Submit Review</button>

		</div>


	<%
				}
	%>

	</form>
</body>
</html>