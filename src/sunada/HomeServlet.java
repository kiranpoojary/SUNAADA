package sunada;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomeServlet() {
		super();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String button = request.getParameter("clicked");
		String selectedInstru;
		if (button.equals("search")) {
			selectedInstru=request.getParameter("instrument");
			
			
			request.setAttribute("selectedInstrument", selectedInstru);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("Instrument.jsp");
			requestDispatcher.include(request, response);
        	
			

		} else if (button.equals("wishlistAll")) {
			out.print(button + " clicked");
		} 
		else if (button.equals("rentNow1")) {
			out.print(button + " clickInstrumented1");
		} 
		else if (button.equals("rentNow2")) {
			out.print(button + " clicked2");
		} 
		else if (button.equals("rentNow3")) {
			out.print(button + " clicked3");
		} 
		else if (button.equals("rentNow4")) {
			out.print(button + " clicked4");
		} 
		else if (button.equals("rentNow5")) {
			out.print(button + " clicked5");
		} 
		else if (button.equals("rentNow6")) {
			out.print(button + " clicked6");
		} 
		else if (button.equals("rentNow7")) {
			out.print(button + " clicked7");
		} 
		else if (button.equals("rentNow8")) {
			out.print(button + " clicked8");
		} 
		else if (button.equals("wishlist1")) {
			out.print(button + " clicke1");
		} 
		else if (button.equals("wishlist2")) {
			out.print(button + " clicked2");
		} 
		else if (button.equals("wishlist3")) {
			out.print(button + " clicked3");
		} 
		else if (button.equals("wishlist4")) {
			out.print(button + " clicke4");
		} 
		else if (button.equals("wishlist5")) {
			out.print(button + " clicked5");
		} 
		else if (button.equals("wishlist6")) {
			out.print(button + " clicked6");
		} 
		else if (button.equals("wishlist7")) {
			out.print(button + " clicked7");
		} 
		else if (button.equals("wishlist8")) {
			out.print(button + " clicked8");
		} 
		

	}

}
