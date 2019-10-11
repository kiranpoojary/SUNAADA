/**
 * 
 */
package sunada.profileactivity;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import com.mysql.jdbc.PreparedStatement;
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

	static {

		try {
			dbUrl = "jdbc:mysql://localhost/sunada";
			driverName = "com.mysql.jdbc.Driver";
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}

	}

	public boolean login(String uid, String psw) {

		return true;

	}

	public boolean registerMe(String emailid,String mobile,String userid,String password,String secq,String seca,String utype,InputStream pic) {

		try {
			connection = DriverManager.getConnection(dbUrl, "root", "");
			System.out.print("jhghe");
			/*
			String query = "select count(*) as tot from users where UserID=?";			
			PreparedStatement statement = (PreparedStatement) connection.prepareStatement(query);
            statement.setString(1, emailid);
			System.out.print(dbUrl);
			ResultSet count = statement.executeQuery(query);
				System.out.print(count.getInt("tot"));
*/
		} catch (Exception e) {
			e.printStackTrace();
		}

		return true;

	}

}
