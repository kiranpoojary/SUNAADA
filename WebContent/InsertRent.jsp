<%@page import="java.sql.Connection"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Base64"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
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
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}

		//HttpSession session=request.getSession();

		float walbalance = (float) session.getAttribute("balance");
		String user = (String) session.getAttribute("currentSessionUser");

		String startdate = session.getAttribute("sFrom").toString();
		String enddate = session.getAttribute("sTo").toString();

		String custName = request.getParameter("fname");
		String city = request.getParameter("city");
		String region = request.getParameter("region");
		String post = request.getParameter("post");
		String mob = request.getParameter("mobile");
		String address = "Name:" + custName + " City:" + city + " Region:" + region + " ZIP:" + post + " Phone: "
				+ mob;

		String selectedInstrument = (String) session.getAttribute("selectedInstrument");
		int qty = Integer.parseInt(session.getAttribute("qty").toString());

		//***Stock 
		connection = DriverManager.getConnection("jdbc:mysql://localhost/sunada", "root", "");
		PreparedStatement getStockStatement = (PreparedStatement) connection
				.prepareStatement("SELECT AvailQuantity FROM instruments where Instrument_Name=?");
		getStockStatement.setString(1, selectedInstrument);

		ResultSet qtyRS = getStockStatement.executeQuery();

		qtyRS.next();
		int oldqty = qtyRS.getInt(1);
		int newqty = oldqty - qty;
		
		double totalpay = (double) session.getAttribute("totpay");

		String insertingQuery = "insert into rent(UserID,Instrument_Name,Quantity,Hire_Date,Due_Date,Total_Pay,Advance_Pay,Due_Pay,DeliveryAddress,Status ) values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertingQuery);

		insertStatement.setString(1, user);
		insertStatement.setString(2, selectedInstrument);
		insertStatement.setInt(3, qty);
		insertStatement.setString(4, startdate.toString());
		insertStatement.setString(5, enddate.toString());
		insertStatement.setDouble(6, totalpay);
		insertStatement.setDouble(7, 0.0);
		insertStatement.setDouble(8, 0.0);
		insertStatement.setString(9, address);
		insertStatement.setString(10, "Requested");
		int inserts = 0;
		inserts = insertStatement.executeUpdate();
		if (inserts > 0) {

			//***Wallet Balance Update
			PreparedStatement getBalStatement = (PreparedStatement) connection
					.prepareStatement("SELECT WalletBalance FROM users where UserID=?");
			getBalStatement.setString(1, (String) session.getAttribute("currentSessionUser"));
			ResultSet rs = getBalStatement.executeQuery();
			rs.next();
			float bal = rs.getFloat(1);
			double finalpay = Double.parseDouble(session.getAttribute("finalpay").toString());
			double newbal = bal - finalpay;
			String updateBalanceQ = "UPDATE users set WalletBalance=? where UserID=?";
			PreparedStatement updateBalance = (PreparedStatement) connection.prepareStatement(updateBalanceQ);
			updateBalance.setDouble(1, newbal);
			updateBalance.setString(2, user);
			updateBalance.execute();

			
			
			
			String updateQuantityQ = "UPDATE instruments set AvailQuantity=? where Instrument_Name=?";
			PreparedStatement updateStock = (PreparedStatement) connection.prepareStatement(updateQuantityQ);
			updateStock.setInt(1, newqty);
			updateStock.setString(2, selectedInstrument);
			updateStock.execute();
	%>


	<script type="text/javascript">
		alert('Your rent request Successfuly placed');
		location = 'Instrument.jsp';
	</script>
	;

	<%
		} else {
	%>
	<script type="text/javascript">
		alert('Something Went Wrong');
		location = 'Instrument.jsp';
	</script>
	;



	<%
		}
		
	%>

</body>
</html>