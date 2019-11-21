package sunada.productactivity;

import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class OperationOnProduct {
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

	
	public boolean addInstrument(String Instrument_Name, String Instrument_Category,String Instrument_Descr,double Per_Day_Fare,double Advance_Amount ,String Avail_Status,InputStream img1,InputStream img2) throws SQLException, ClassNotFoundException {
		
		Class.forName(driverName);
		connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
		// Add the data into the database
		String sql = "insert into instruments values (?,?,?,?,?,?,?,?)";
		PreparedStatement pst = (PreparedStatement) connection.prepareStatement(sql);
		pst.setString(1, Instrument_Name);
		pst.setString(2, Instrument_Category);
		pst.setString(3, Instrument_Descr);
		pst.setDouble(4, (double) Per_Day_Fare);
		pst.setDouble(5, (double) Advance_Amount);
		try {
			pst.setString(6, Avail_Status);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pst.setBlob(7,img1);
		pst.setBlob(8,img2);
		int numRowsChanged = pst.executeUpdate();
		return true;
	
	}
	
	public boolean addToWish(String uid,String instru)
	{
		try {

				connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
				String insertingQuery = "insert into favorite values(?,?)";
				PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertingQuery);
				
				insertStatement.setString(1, uid);
				insertStatement.setString(2, instru);
				
				int inserts = insertStatement.executeUpdate();
				return true;
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}
	
	public boolean addReview(String uid,String instru,String rv,int rate) throws SQLException
	{
		connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
		String insertingQuery = "insert into user_ratings values(?,?,?,?)";
		PreparedStatement insertStatement = (PreparedStatement) connection.prepareStatement(insertingQuery);
		
		insertStatement.setString(1, uid);
		insertStatement.setString(2, instru);
		insertStatement.setString(3, rv);
		insertStatement.setDouble(4, rate);
	
		
		int inserts = insertStatement.executeUpdate();
		return true;
	
	}
}