/**
 * 
 */
package sunada.profileactivity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import com.mysql.jdbc.Statement;

/**
 * @author KIRAN
 *
 */

public class AccountDBActivity {
	static String dbUrl;
	static String driverName;
	static Connection connection;

	public AccountDBActivity() throws ClassNotFoundException {
		
	}
	
	static  {
		
		 try {
			 dbUrl = "jdbc:mysql://localhost/sunada";
			 driverName= "com.mysql.jdbc.Driver";
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
	 

	}

	public boolean login(String uid, String psw) {

		return true;

	}

	public boolean checkRegistered(String emailid) {
		
		try
		{
		connection = DriverManager.getConnection(dbUrl, "root", "");
		String query="select * from users";
		System.out.print(dbUrl);
		Statement statement=(Statement) connection.createStatement();
		ResultSet rs=statement.executeQuery(query);
		while(rs.next())
		{
			System.out.print(rs.getString(1));
		}
		
		}
		catch (Exception e) {
			e.printStackTrace();	
		}

		return true;
		
		
	}

}
