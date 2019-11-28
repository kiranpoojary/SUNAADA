/**
 * 
 */
package sunada.paymentactivity;

import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.PreparedStatement;

/**
 * @author KIRAN
 *
 */
public class WalletOperation {
	
	static String dbUrl;
	static String driverName;
	static Connection connection;
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
	public boolean addMoney(String uid, double amt) {
		Boolean added = false;
		try {
			connection = DriverManager.getConnection(dbUrl, "root", "");
			PreparedStatement updateBal = (PreparedStatement) connection
					.prepareStatement("UPDATE users set WalletBalance=? where UserID=?");
			updateBal.setDouble(1, amt);
			updateBal.setString(2, uid);
			
			int count = updateBal.executeUpdate();
			if(count>0)
			{
				added=true;
			}
			else {
				added=false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return added;
			
		}
	}
	
	
	public boolean payBill(String name,String instru,int qty, Date hire,Date due,double totpay,double advpay,double duepay,String delAddr,String sts) throws SQLException{
		
		
		connection = DriverManager.getConnection(dbUrl, "root", "");
			String insertingQuery = "insert into rent(UserID,Instrument_Name,Quantity,Hire_Date,Due_Date,Total_Pay,Advance_Pay,Due_Pay,DeliveryAddress,Status ) values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertingQuery);
			
			insertStatement.setString(1, name);
			insertStatement.setString(2, instru);
			insertStatement.setInt(3, qty);
			insertStatement.setString(4,  hire.toString());
			insertStatement.setString(5,due.toString());
			insertStatement.setDouble(6, totpay);
			insertStatement.setDouble(7, advpay);
			insertStatement.setDouble(8, duepay);
			insertStatement.setString(9, delAddr);
			insertStatement.setString(10, instru);
			int inserts = insertStatement.executeUpdate();
			if(inserts>0)
			{
				return true;
			}
			else {
				return false;
			}
			
		
	
		
	}
	

}
