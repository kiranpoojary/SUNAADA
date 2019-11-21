/**
 * 
 */
package sunada.profileactivity;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.PreparedStatement;

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

	@SuppressWarnings("finally")
	public boolean login(String uid, String psw) {
		Boolean authorized = false;
		try {
			connection = DriverManager.getConnection(dbUrl, "root", "");
			PreparedStatement ps = (PreparedStatement) connection
					.prepareStatement("SELECT * FROM users where UserID=? and password=?");
			ps.setString(1, uid);
			ps.setString(2, psw);
			ResultSet rs = ps.executeQuery();
			authorized = rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return authorized;
			
		}
	}
	

	

	public boolean registerMe(String name, String userid, String mob, String password, String secq, String seca,
			String aadhar,double amt, InputStream pic) {

		try {

			connection = DriverManager.getConnection(dbUrl, "root", "");
			String CheckingQuery = "select * from users where UserID=?";
			PreparedStatement chekingStatement = (PreparedStatement) connection.prepareStatement(CheckingQuery);
			chekingStatement.setString(1, userid);
			ResultSet checkedResult = chekingStatement.executeQuery();
			if (!checkedResult.next()) {
				String insertingQuery = "insert into users values(?,?,?,?,?,?,?,?,?)";
				PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertingQuery);
				
				insertStatement.setString(1, name);
				insertStatement.setString(2, mob);
				insertStatement.setString(3, userid);
				insertStatement.setString(4, password);
				insertStatement.setString(5, secq);
				insertStatement.setString(6, seca);
				insertStatement.setString(7, aadhar);
				insertStatement.setDouble(8, amt);
				insertStatement.setBlob(9, pic);
				int inserts = insertStatement.executeUpdate();
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

}
