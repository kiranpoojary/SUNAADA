
<%@page import="java.util.Base64"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style type="text/css">
body {
	padding-top: 200px;
	padding-left: 150px
}

.glyphicon {
	margin-bottom: 10px;
	margin-right: 10px;
}

small {
	display: block;
	line-height: 1.428571429;
	color: #999;
}
</style>


</head>
<body>
	<%
		String user;
		String encode;
		if (session.getAttribute("currentSessionUser") != null) {

			user = (String) session.getAttribute("currentSessionUser");

		}

		String dbUrl = "jdbc:mysql://localhost/sunada";
		String driverName = "com.mysql.jdbc.Driver";
		Class.forName(driverName);
		Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");

		PreparedStatement getUser = (PreparedStatement) connection
				.prepareStatement("SELECT * FROM users where UserID=?");
		getUser.setString(1,(String) session.getAttribute("currentSessionUser"));
		ResultSet userInfo = getUser.executeQuery();
		userInfo.next();
		String fname=userInfo.getString(1);
		String  mob=userInfo.getString(2);
		String id=userInfo.getString(3);
		String  aadhar=userInfo.getString(7);
		double wallet=userInfo.getDouble(8);
		byte[] imgData = userInfo.getBytes(9); // blob field 
		encode = Base64.getEncoder().encodeToString(imgData);
		request.setAttribute("imgBase", encode);
	%>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="well well-sm">
					<div class="row">
						<div class="col-sm-6 col-md-4">
							<img src="data:image/jpeg;base64,${imgBase}" alt=""
								class="img-rounded img-responsive" />
						</div>
						<div class="col-sm-6 col-md-8">
							<h4><%= fname %></h4>
							<small><cite title="San Francisco, USA">Bangalore,India<i class="glyphicon glyphicon-map-marker"> </i>
							</cite></small>
							<p>
								<i class="glyphicon glyphicon-envelope"></i><%= id %><br />
								<i class="glyphicon glyphicon-earphone"></i><%= mob %> <br /><i class="fas fa-mobile-alt"></i>
								
								<i class="glyphicon glyphicon-transfer"></i><%= aadhar %> <br />
								
								<i class="glyphicon glyphicon-usd"></i><a
									href="http://www.jquery2dotnet.com"><%= wallet %></a> <br />
						
							</p>
							<!-- Split button -->
							<div class="btn-group">
								<button type="button" class="btn btn-primary">Change Password</button>
								
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Twitter</a></li>
									<li><a href="https://plus.google.com/+Jquery2dotnet/posts">Google
											+</a></li>
									<li><a href="https://www.facebook.com/jquery2dotnet">Facebook</a></li>
									<li class="divider"></li>
									<li><a href="#">Github</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>