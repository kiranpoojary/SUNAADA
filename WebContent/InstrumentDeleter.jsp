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

		String dbUrl = "jdbc:mysql://localhost/sunada";
		String driverName = "com.mysql.jdbc.Driver";
		Class.forName(driverName);
		Connection connection = DriverManager.getConnection(dbUrl, "root", "");

		String instru = (String) request.getParameter("iname");
		
		
try{
		String CheckingQuery = "select * from instruments where Instrument_Name=?";
		PreparedStatement chekingStatement = (PreparedStatement) connection.prepareStatement(CheckingQuery);
		chekingStatement.setString(1, instru);
		ResultSet checkedResult = chekingStatement.executeQuery();
		
		if (checkedResult.next()) {
			String deleteQuery = "DELETE from instruments where Instrument_Name=?";
			PreparedStatement deleteStatement = (PreparedStatement) connection.prepareStatement(deleteQuery);
			deleteStatement.setString(1, instru);
			int deleted = deleteStatement.executeUpdate();
			if (deleted > 0) {
	%>
	<script type="text/javascript">
		alert('Instrument successfuly deleted');
		location = 'DeleteInstrument.jsp';
	</script>
	



	<%
		} else {
	%>

	<script type="text/javascript">
		alert('Instrument Not Found');
		location = 'DeleteInstrument.jsp';
	</script>
	
	<%
		}

		}
		else{
			%>

			<script type="text/javascript">
				alert('Instrument Not Found');
				location = 'DeleteInstrument.jsp';
			</script>
			<%
		}
}
catch(Exception e)
{
	%>

	<script type="text/javascript">
		alert('Something went wrong!!(check db Connection')');
		location = 'DeleteInstrument.jsp';
	</script>
	
	<%
	
	
}
	%>

</body>
</html>