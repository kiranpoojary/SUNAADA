package sunada.productactivity;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String button = request.getParameter("clicked");
		System.out.print(button);
		out.print(request.getAttributeNames());
		/*
		String selectedInstru;
		if (button.equals("search")) {
			//selectedInstru=request.getParameter("instrument");
			selectedInstru="Violin";
			
			request.setAttribute("selectedInstrument", selectedInstru);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("Instrument.jsp");
			requestDispatcher.include(request, response);
        	
			

		}
		else if (button.equals("wishlistAll")) {
			out.print(button + " clicked");
		} 
		else if (button.equals("rentNow1")) {
			out.print(button + " clickInstrumented1");
		} 
		else if (button.equals("rentNow2")) {
			out.print(button + " clicked2");
		} */
	}

}
