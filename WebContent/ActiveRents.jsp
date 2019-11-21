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
<title>Rents</title>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

</head>
<body>
<form action="UpdaterentStatus.jsp" method="post">
	<%
		int count = 0;

		try {

			//String name = (String) request.getAttribute("username");

			String dbUrl = "jdbc:mysql://localhost/sunada";
			String driverName = "com.mysql.jdbc.Driver";
			Class.forName(driverName);
			Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");

			String logeduser = (String) session.getAttribute("currentSessionUser");
			String query = "Select * from rent where  Status=? or Status=? ORDER BY Status DESC";
			String instrument = null;
			java.sql.PreparedStatement pstmt = null;
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, "On Rent");
			pstmt.setString(2, "Requested");
			ResultSet rs = pstmt.executeQuery();
			String encode;
	%>
	<br>

	<br>


	<a href="AdminDashboard.jsp" class="btn btn-primary btn-lg"><span
		class="glyphicon glyphicon-home"></span> Take Me Home </a>
	</center>

	<center>
		<div class="input-group form-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fas fa-image"></i></span>
			</div>
			<input type="text" name="rentid" class="form-control"
				placeholder="Enter Rent ID" required>
		</div>
		<br>
		<div class="form-group ">

			<input type="submit" value="Update" class="btn reg_btn ">
			<br> <br>
			<center>



				<h1 style="color: red;">All Active Rentings</h1>
			</center>

			<hr>
			<div class="container">
				<div class="row">
					<div class="col-sm-12 col-md-10 col-md-offset-1">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Instruments</th>

									<th>Rental ID</th>
									<th class="text-center">Rented quantity</th>
									<th class="text-center">Hire Date</th>
									<th class="text-center">Return Date</th>
									<th class="text-center">Hire Status</th>
									<th> </th>
								</tr>
							</thead>
							<tbody>

								<%
									while (rs.next()) {
											count++;

											PreparedStatement getInstru = (PreparedStatement) connection
													.prepareStatement("SELECT * FROM instruments where Instrument_Name=?");
											getInstru.setString(1, rs.getString(3));
											ResultSet instruInfo = getInstru.executeQuery();
											instruInfo.next();

											byte[] imgData = instruInfo.getBytes(7); // blob field 
											encode = Base64.getEncoder().encodeToString(imgData);
											request.setAttribute("imgBase", encode);
								%>


								<tr>
									<td class="col-sm-8 col-md-6">
										<div class="media">
											<a class="thumbnail pull-left" href="#"> <img
												class="media-object" src="data:image/jpeg;base64,${imgBase}"
												style="width: 72px; height: 72px;">
											</a>
											<div class="media-body">
												<h4 class="media-heading">
													<a href="#"><%=rs.getString(3)%></a>
												</h4>
												<h5 class="media-heading">
													Category <a href="#"><%=instruInfo.getString(2)%></a>
												</h5>
												<span>Status: </span><span class="text-success"><strong><%=(instruInfo.getInt(6) != 0) ? "Available" : "No Stock"%></strong></span>
											</div>
										</div>
									</td>
									<td class="col-sm-1 col-md-1 text-center"><strong><%=rs.getInt(2)%></strong></td>

									<td class="col-sm-1 col-md-1" style="text-align: center"><input
										type="email" class="form-control" id="exampleInputEmail1"
										value="<%=rs.getInt(4)%>" disabled></td>
									<td class="col-sm-1 col-md-1 text-center"><strong><%=rs.getString(5)%></strong></td>
									<td class="col-sm-1 col-md-1 text-center"><strong><%=rs.getString(6)%></strong></td>
									<td class="col-sm-1 col-md-1">
										<button type="button" class="btn btn-danger">
											<span class="glyphicon "></span><%=rs.getString(11)%>
										</button>
									</td>
								</tr>



								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<%
				//out.println(instrument);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (count <= 0) {
			%>

			<center>
				<h1 style="color: #00FF00">Currently No Pending Rentals Available </h1>
				<br> <br>

				<%
					}

					}
				%>
				
			</form>
</body>
</html>