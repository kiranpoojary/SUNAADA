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
		        if(activity.login(email, pass))
		        {
		            RequestDispatcher rs = request.getRequestDispatcher("Home.jsp");
		            rs.forward(request, response);
		        }
		        else
		        {
		           out.println("Username or Password incorrect");
		           RequestDispatcher rs = request.getRequestDispatcher("Login.jsp");
		           rs.include(request, response);
		        }
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	        
	    }  
		
}
