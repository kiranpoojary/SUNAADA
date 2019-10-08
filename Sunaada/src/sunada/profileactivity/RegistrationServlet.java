package sunada.profileactivity;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    
    /**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name,email,mob,password,secq,seca;
		name=request.getParameter("fname");
		email=request.getParameter("emailid");
		mob=request.getParameter("mob");
		password=request.getParameter("passw");
		secq=request.getParameter("secq");
		seca=request.getParameter("seca");
		PrintWriter printWriter=response.getWriter();
		printWriter.println(name);
		printWriter.println(email);
		printWriter.println(mob);
		printWriter.println(password);
		printWriter.println(secq);
		printWriter.println(seca);
		
	}

}
