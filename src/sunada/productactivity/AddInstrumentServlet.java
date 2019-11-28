package sunada.productactivity;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.lang.model.element.VariableElement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
@MultipartConfig(maxFileSize = 16177216) // 1.5MB
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			response.setContentType("text/html");
			String Instrument_Name = request.getParameter("iname");

			String Instrument_Category = request.getParameter("icat");
			String Instrument_Descr = request.getParameter("idesc");
			double Per_Day_Fare = Double.parseDouble((String) request.getParameter("pdf"));
			double Advance_Amount = Double.parseDouble(request.getParameter("advance"));
			int stock = Integer.parseInt(request.getParameter("stock"));
			int disc = Integer.parseInt(request.getParameter("discount"));
			Part Image1 = request.getPart("pic1");
			Part Image2 = request.getPart("pic2");

			InputStream img1 = null;
			InputStream img2 = null;
			if (Image1 != null) {
				img1 = Image1.getInputStream();
			}
			if (Image2 != null) {
				img2 = Image2.getInputStream();
			}

			OperationOnProduct operationOnProduct = new OperationOnProduct();
			boolean inserted = operationOnProduct.addInstrument(Instrument_Name, Instrument_Category, Instrument_Descr,
					Per_Day_Fare, Advance_Amount, stock, img1, img2, disc);

			// show that the new account has been created
			if (inserted) {
				PrintWriter out = response.getWriter();
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Instrument Successfuly added');");
				out.println("location='AddInstrument.jsp';");
				out.println("</script>");
			} else {
				PrintWriter out = response.getWriter();
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Something went Wrong(duplicate Instrument Name,No DB connection etc)');");
				out.println("location='AddInstrument.jsp';");
				out.println("</script>");

			}

			// pst.close();
		} catch (Exception e) {
			PrintWriter out = response.getWriter();
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Something went Wrong(duplicate Instrument Name,No DB connection etc)');");
			out.println("location='AddInstrument.jsp';");
			out.println("</script>");
		} finally {

		}
	}
}
