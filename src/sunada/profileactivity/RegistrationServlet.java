package sunada.profileactivity;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
@MultipartConfig(maxFileSize = 16177216) // 1.5MB
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void init(ServletConfig config) throws ServletException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {
			AccountDBActivity activity = new AccountDBActivity();
			String name, email, mob, password, secq, seca, secid;
			name = request.getParameter("fname");
			email = request.getParameter("emailid");
			mob = request.getParameter("mob");
			password = request.getParameter("passw");
			secq = request.getParameter("secq");
			seca = request.getParameter("seca");
			secid = request.getParameter("secid");
			Part filePart = request.getPart("pic");
			InputStream inputStream = null;
			if (filePart != null) {
				inputStream = filePart.getInputStream();

			}

			boolean complete = activity.registerMe(name, email, mob, password, secq, seca, secid, 0.00, inputStream);
			PrintWriter out = response.getWriter();
			System.out.print(complete);
			HttpSession session = request.getSession(true);
			if (complete) {

				session.setAttribute("currentSessionUser", email);
				session.setAttribute("loged", "true");

				out.println("<script type=\"text/javascript\">");
				out.println("alert('You are Successfuly Registred With Sunada');");
				out.println("location='Login.jsp';");
				out.println("</script>");

			} else {
				out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println(
						"<script> $(document).ready(function(){ var em=document.getElementById('eid').text; swal('Warning!','Your Email ID Already Registered', 'warning'); }); </script>");

				RequestDispatcher requestDispatcher = request.getRequestDispatcher("Registration.jsp");
				requestDispatcher.include(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
