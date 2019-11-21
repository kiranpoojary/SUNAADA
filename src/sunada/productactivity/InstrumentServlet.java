package sunada.productactivity;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class InstrumentServlet
 */
@WebServlet("/InstrumentServlet")
public class InstrumentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InstrumentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String button = request.getParameter("clicked");
		String log = "";
		String logeduser = "";
		OperationOnProduct operationOnProduct= new OperationOnProduct();
		
		
		HttpSession session=request.getSession();		
		logeduser = (String) session.getAttribute("currentSessionUser");
		
		if (button.equals("rentNow")) {
			System.out.println(request.getParameter("datefrom"));
			System.out.println(request.getParameter("dateto"));
			
			
			session.setAttribute("from", request.getParameter("datefrom"));
			session.setAttribute("to", request.getParameter("dateto"));
			session.setAttribute("reqQ",Integer.parseInt(request.getParameter("reqQty")));
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("PaymentPage.jsp");
			requestDispatcher.include(request, response);
			
		} else
			if (button.equals("addwishlist")){
				if(logeduser.equals("Login"))
				{
					response.sendRedirect("LoginRequired.html");
				}
				else
				{
					String selectedInstrument=((String) request.getAttribute("selectedInstrument")!=null)?(String) request.getAttribute("selectedInstrument"):(String)session.getAttribute("selectedInstrument");
					
					if(operationOnProduct.addToWish(logeduser, selectedInstrument))
					{
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Instrument Added To wish List');");
						out.println("location='Instrument.jsp';");
						out.println("</script>");
						
					}
					else {
						
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Instrument Already In wish List');");
						out.println("location='Instrument.jsp';");
						out.println("</script>");
						
					}
					
				}
				
		}
			else 
			if(button.equals("review"))
			{
				try {
					logeduser = (String) session.getAttribute("currentSessionUser");
					String review=request.getParameter("review");
					String selectedInstrument=((String) request.getAttribute("selectedInstrument")!=null)?(String) request.getAttribute("selectedInstrument"):(String)session.getAttribute("selectedInstrument");
					int rate=Integer.parseInt(request.getParameter("rate"));
					boolean addStatus;
					
					
					addStatus=operationOnProduct.addReview(logeduser,selectedInstrument, review, rate);
					
					if(addStatus)
					{
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Your Review Submitted Successfuly');");
						out.println("location='Instrument.jsp';");
						out.println("</script>");
						
					}
					else {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('oops!!Your Review Not Submitted');");
						out.println("location='Instrument.jsp';");
						out.println("</script>");
						
					}
				}
				catch(Exception e){
					e.printStackTrace();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('oops!!Your Review already recorded');");
					out.println("location='Instrument.jsp';");
					out.println("</script>");
					
				}
				
				
			}
		
		
		
		
	}

}
