package sunada.profileactivity;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class Fetcher {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		String dbUrl = "jdbc:mysql://localhost/sunada";
		String driverName = "com.mysql.jdbc.Driver";
		Class.forName(driverName);
		Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
		String CheckingQuery = "select * from users";
		Statement statement=connection.createStatement();
		//PreparedStatement chekingStatement = (PreparedStatement) connection.prepareStatement(CheckingQuery);
		//chekingStatement.setString(1, userid);
		ResultSet checkedResult = statement.executeQuery(CheckingQuery);
		while(checkedResult.next())
		{
			System.out.println(checkedResult.getString(1));
			System.out.println(checkedResult.getString(2));
			System.out.println(checkedResult.getString(3));
			System.out.println(checkedResult.getBlob(8));

			
			
		}
		
		

	}

}
