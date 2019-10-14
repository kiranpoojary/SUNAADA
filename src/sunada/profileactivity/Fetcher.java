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
		ResultSet r1=null;
		ResultSet r2=null;

		r1=(checkedResult.absolute(1))?checkedResult:null;		
		System.out.println(r1.getString(1));
		
		
		r2=(checkedResult.absolute(2))?checkedResult:null;
		System.out.println(r2.getString(1));
		

	}

}
