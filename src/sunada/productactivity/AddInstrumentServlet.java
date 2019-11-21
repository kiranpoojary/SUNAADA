package sunada.productactivity;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mysql.jdbc.Blob;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class AddInstrumentServlet
 */
@WebServlet("/AddInstrumentServlet")
public class AddInstrumentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final double Advanvce_Amount = 0.0;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddInstrumentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String Instrument_Name = request.getParameter("iname");
		
		System.out.print(Instrument_Name);
		
		String Instrument_Category = request.getParameter("icategory");
		String Instrument_Descr = request.getParameter("idesc");
		double Per_Day_Fare =Double.parseDouble((String)request.getParameter("fare"));
		double Advance_Amount =Double.parseDouble(request.getParameter("advance"));
		String Avail_Status = "Available";
		//Integer stock=Integer.parseInt(request.getParameter("stock"));
		Part Image1 = request.getPart("myFile1");
		Part Image2 = request.getPart("myFile2");
		
		InputStream img1 = null;
		InputStream img2 = null;
		if (Image1 != null) {
			img1 = Image1.getInputStream();
		}
		if (Image2 != null) {
			img2 = Image2.getInputStream();
		}
		try {

			System.out.print(Per_Day_Fare);
			System.out.print(Advance_Amount);
			System.out.print(Instrument_Descr);
			System.out.print(Per_Day_Fare);
			System.out.print(Advance_Amount);
			System.out.print(Instrument_Descr);
			System.out.print(Per_Day_Fare);
			System.out.print(Advance_Amount);
			System.out.print(Instrument_Descr);
			
			
			//OperationOnProduct operationOnProduct=new OperationOnProduct();
			//boolean inserted=operationOnProduct.addInstrument(Instrument_Name, Instrument_Category, Instrument_Descr, Per_Day_Fare, Advance_Amount, Avail_Status, img1, img2);
			/* show that the new account has been created
			if(inserted)
			{
				out.println(" Successfully Inserted : ");
			}
			else {
				out.println(" NotInserted : ");
				
			}
			*/
			
			//pst.close();
		} catch (Exception e) {
			out.println("Couldn't load database driver: " + e.getMessage());
		} finally {

			
			}
		}
	}

