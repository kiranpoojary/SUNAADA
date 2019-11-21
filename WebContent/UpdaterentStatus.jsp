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
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="StatusSave.jsp" method="post">





		<%
			String rentid = request.getParameter("rentid");
			session.setAttribute("rentid", rentid);
			int count = 0;

			try {

				String name = (String) request.getAttribute("username");

				String dbUrl = "jdbc:mysql://localhost/sunada";
				String driverName = "com.mysql.jdbc.Driver";
				Class.forName(driverName);
				Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");

				String logeduser = (String) session.getAttribute("currentSessionUser");
				String query = "Select * from rent where  RentalID=?";
				String instrument = null;
				java.sql.PreparedStatement pstmt = null;
				pstmt = connection.prepareStatement(query);
				pstmt.setString(1, rentid);
				ResultSet rs = pstmt.executeQuery();
				String encode;
				String fulname, aadhar, mob;
				

				if (rs.next()) {
					String userid = rs.getString(1);
					String instru = rs.getString(3);
					
					session.setAttribute("instru", instru);
					int qty = rs.getInt(4);
					session.setAttribute("qty", qty);
					double totalpay = rs.getDouble(7);

					String query2 = "Select * from users where  UserID=?";
					java.sql.PreparedStatement pstmt2 = null;
					pstmt2 = connection.prepareStatement(query2);
					pstmt2.setString(1, userid);
					ResultSet rs2 = pstmt2.executeQuery();
				
					rs2.next();
					fulname = rs2.getString(1);
					aadhar = rs2.getString(7);
					mob = rs2.getString(2);
		%>

		<a href="ActiveRents.jsp" class="btn btn-primary btn-lg"><span
			class="glyphicon glyphicon-home"></span> Take Me Back </a>
		</center>

		<center>
			<center>

				<h1 style="color: red;">
					<u>Update Rent Status</u>
				</h1>

				<br> <br>

				<h4 style="color: #1a1aFF">Customer Full Name</h4><%=fulname%><br>
				<br>
				<h4 style="color: #1a1aFF">Customer UserID</h4><%=userid%><br>
				<br>
				<h4 style="color: #1a1aFF">Customer Mobile</h4><%=mob %><br>
				<br>
				<h4 style="color: #1a1aFF">Customer Aadhar ID</h4><%= aadhar%><br>
				<br>
				<h4 style="color: #1a1aFF">Instrument Name</h4><%=instru%><br>
				<br>
				<h4 style="color: #1a1aFF">Rental ID</h4><%=rentid%><br> <br>
				<h4 style="color: #1a1aFF">Total Pay</h4><%=totalpay%><br> <br>
				<br> <br>
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-question"></i></span>
					</div>
					<div class="dropdown">
						<select id="mylist" name="status" class="list">
							<option value="Requested">Requested</option>
							<option value="On Rent">On Rent</option>
							<option value="Returned">Returned</option>
						</select>
					</div>
				</div>
<br>
				<center>
					<input type="submit" value="Update" class="btn reg_btn ">
				</center>
				<br>
				<br>
				<br>




				<%
					} else {
				%>

				<script type="text/javascript">
					alert('Entered Rent ID is Invalid');
					location = 'ActiveRents.jsp';
				</script>
				;



				<%
					}

					} catch (Exception e) {
						e.printStackTrace();

					}
				%>
			
	</form>

</body>
</html>