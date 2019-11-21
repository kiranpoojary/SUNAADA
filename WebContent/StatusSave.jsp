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
</head>
<body>
	<%
		String dbUrl;
		String driverName;
		Connection connection;

		try {
			dbUrl = "jdbc:mysql://localhost/sunada";
			driverName = "com.mysql.jdbc.Driver";
			Class.forName(driverName);
		
		
		String sts=request.getParameter("status");

		int rentid =Integer.parseInt(session.getAttribute("rentid").toString());
		String instru=(String)session.getAttribute("instru");

		String updateBalanceQ = "UPDATE rent set Status=? where RentalID=?";
		connection = DriverManager.getConnection("jdbc:mysql://localhost/sunada", "root", "");
		
		System.out.println(sts);

		
		String updatestatusQ = "UPDATE rent set Status=? where RentalID=?";
		PreparedStatement updateStatus = (PreparedStatement) connection.prepareStatement(updatestatusQ);
		updateStatus.setString(1, sts);
		updateStatus.setInt(2, rentid);
		int c=updateStatus.executeUpdate();
		
		
		if(sts.equals("Returned"));
		{
			String query = "Select AvailQuantity from instruments where  Instrument_Name=?";
			String instrument = null;
			java.sql.PreparedStatement pstmt = null;
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1,instru);
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int oldqty=rs.getInt(1);
			int rentqty=Integer.parseInt(session.getAttribute("qty").toString());
			int newqty=oldqty+rentqty;
			
			String updateQuantityQ = "UPDATE instruments set AvailQuantity=? where Instrument_Name=?";
			PreparedStatement updateStock = (PreparedStatement) connection.prepareStatement(updateQuantityQ);
			updateStock.setInt(1, newqty);
			updateStock.setString(2, instru);
			updateStock.execute();
			
		}
		
		if(c>0)
		{
			%>
				<script type="text/javascript">
					alert('Rent Status Updated');
					location = 'ActiveRents.jsp';
				</script>
			
			<%
		}
		
		
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}
	%>

</body>
</html>