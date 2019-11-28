package sunada.paymentactivity;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PaymentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		float walbalance = (float) session.getAttribute("balance");
		String user = (String) session.getAttribute("currentSessionUser");
		String button = request.getParameter("clicked");
		PrintWriter out=response.getWriter();
		
		Date startdate=(Date)session.getAttribute("sFrom");
		Date enddate=(Date)session.getAttribute("sTo");

		String custName=request.getParameter("fname");
		String city=request.getParameter("city");
		
		String region=request.getParameter("region");
		String post=request.getParameter("post");
		String mob=request.getParameter("mobile");
		String address="Name:"+custName+" City:"+city+" Region:"+region+" ZIP:"+post+" Phone: "+mob;
		
		WalletOperation wallet = new WalletOperation();


		if (button.equals("addmoney")) {
			float shortage = Float.parseFloat(request.getParameter("Amount"));
			float newbal = walbalance + shortage;
			

			if (wallet.addMoney(user, newbal)) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Amount Successfuly added to Wallet');");
				out.println("location='PaymentPage.jsp';");
				out.println("</script>");
				
				out.println("<h1>hello</h1>");
			} else {
				System.out.println("not added");
			}

		} else {
			
			if (button.equals("finalSubmit")) {

				String selectedInstrument=(String)session.getAttribute("selectedInstrument");
				int qty=Integer.parseInt( request.getParameter("reqQty"));
				
				System.out.println("ID"+user);
				try {
					double totalpay=(double)session.getAttribute("totpay");
	
					//wallet.payBilll(user,selectedInstrument,qty,startdate,enddate,totalpay,0.00,0.00,address,"InRent");
					
					if (wallet.payBill(user,selectedInstrument,qty,startdate,enddate,totalpay,0.00,0.00,address,"InRent")) {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Your rent request Successfuly placed..');");
						out.println("location='Instrument.jsp';");
						out.println("</script>");
					} else {
					
					
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Something went wrong!!');");
						out.println("location='Instrument.jsp';");
						out.println("</script>");
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					
					
				}
				

			} else {
				

			}
			

		}

	}

}
