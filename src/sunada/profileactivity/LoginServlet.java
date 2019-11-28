package sunada.profileactivity;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sunada.SendMail;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	
	 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		  response.setContentType("text/html;charset=UTF-8");
		  try {
			  PrintWriter out = response.getWriter();
		        
		        AccountDBActivity activity=new AccountDBActivity();
		        String email = request.getParameter("email");
		        String pass = request.getParameter("password"); 
		        HttpSession session = request.getSession(true);	
		        session.setAttribute("loged","false");
		        //SendMail sendMail=new SendMail();
		        if(activity.login(email, pass))
		        {
		        	  
		             session.setAttribute("currentSessionUser",email); 
		             session.setAttribute("loged","true");
		             
		            
		             if(email.equals("adminsunada@gmail.com"))
		             {
		            	// sendMail.SendEmail();
		            	 response.sendRedirect("AdminDashboard.jsp");
				            
		            	 
		             }
		              else
		             {
		            	 response.sendRedirect("Home.jsp");  
		             }
		             
		        	
		        }
		        else
		        {
		        	out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
					out.println(
							"<script> $(document).ready(function(){ var em=document.getElementById('eid').value; swal('Login Unsuccessful','Invalid Email ID or Password', 'warning'); }); </script>");
					session.setAttribute("loged","false");
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("Registration.jsp");
					requestDispatcher.include(request, response);
		        	
		        }
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	        
	    }  
		
}
