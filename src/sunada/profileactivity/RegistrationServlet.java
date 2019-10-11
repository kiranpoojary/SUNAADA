package sunada.profileactivity;

import java.io.IOException;
import java.io.PrintWriter;

import javax.lang.model.element.VariableElement;
import javax.servlet.RequestDispatcher;
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			AccountDBActivity activity = new AccountDBActivity();
			
			String name, email, mob, password, secq, seca;
			name = request.getParameter("fname");
			email = request.getParameter("emailid");
			mob = request.getParameter("mob");
			password = request.getParameter("passw");
			secq = request.getParameter("secq");
			seca = request.getParameter("seca");
			boolean d = activity.checkRegistered(email);
			PrintWriter out = response.getWriter();
			
			
			if (d) {
				
				out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script> $(document).ready(function(){ var em=document.getElementById('eid').value; swal('Warning!',em, 'warning'); }); </script>");
				
				
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("Registration.jsp");
				requestDispatcher.include(request, response);
				
			}
			else {
				out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script> $(document).ready(function(){ var em=document.getElementById('eid').text; swal('Warning!','email Not Registered', 'warning'); }); </script>");
				
				
				RequestDispatcher requestDispatcher=request.getRequestDispatcher("Registration.jsp");
				requestDispatcher.include(request, response);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
