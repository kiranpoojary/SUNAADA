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

import sunada.productactivity.OperationOnProduct;

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

		HttpSession session = request.getSession();
		String user = ((String) session.getAttribute("currentSessionUser"));

		OperationOnProduct op = new OperationOnProduct();

		if (button.equals("search")) {
			selectedInstru = request.getParameter("instrument");

			request.setAttribute("selectedInstrument", selectedInstru);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("Instrument.jsp");
			requestDispatcher.include(request, response);

		} else

		if (button.equals("wishlistAll")) {
			if (user.equals("Login")) {

				response.sendRedirect("LoginRequired.html");

			} else {
				response.sendRedirect("MyWishList.jsp");

			}

		} else

		if (button.equals("rentNow1")) {

			selectedInstru = (String) session.getAttribute("selectedInstrument1");
			session.setAttribute("selectedInstrument", selectedInstru);
			response.sendRedirect("Instrument.jsp");

		} else if (button.equals("rentNow2")) {
			selectedInstru = (String) session.getAttribute("selectedInstrument2");
			session.setAttribute("selectedInstrument", selectedInstru);
			response.sendRedirect("Instrument.jsp");
		} else if (button.equals("rentNow3")) {
			selectedInstru = (String) session.getAttribute("selectedInstrument3");
			session.setAttribute("selectedInstrument", selectedInstru);
			response.sendRedirect("Instrument.jsp");
		} else if (button.equals("rentNow4")) {
			selectedInstru = (String) session.getAttribute("selectedInstrument4");
			session.setAttribute("selectedInstrument", selectedInstru);
			response.sendRedirect("Instrument.jsp");
		} else if (button.equals("rentNow5")) {
			selectedInstru = (String) session.getAttribute("selectedInstrument5");
			session.setAttribute("selectedInstrument", selectedInstru);
			response.sendRedirect("Instrument.jsp");
		} else if (button.equals("rentNow6")) {
			selectedInstru = (String) session.getAttribute("selectedInstrument6");
			session.setAttribute("selectedInstrument", selectedInstru);
			response.sendRedirect("Instrument.jsp");
		} else if (button.equals("rentNow7")) {
			selectedInstru = (String) session.getAttribute("selectedInstrument7");
			session.setAttribute("selectedInstrument", selectedInstru);
			response.sendRedirect("Instrument.jsp");
		} else if (button.equals("rentNow8")) {
			selectedInstru = (String) session.getAttribute("selectedInstrument8");
			session.setAttribute("selectedInstrument", selectedInstru);
			response.sendRedirect("Instrument.jsp");
		} else if (button.equals("wishlist1")) {
			selectedInstru = (String) session.getAttribute("selectedInstrument1");
			if (user.equals("Login")) {

				response.sendRedirect("LoginRequired.html");

			} else {

				boolean inserted = op.addToWish(user, selectedInstru);
				if (inserted) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Instrument Added To wish List');");
					out.println("location='Home.jsp';");
					out.println("</script>");

				} else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Instrument Already In Wish List');");
					out.println("location='Home.jsp';");
					out.println("</script>");
				}
			}

		} else if (button.equals("wishlist2")) {
			selectedInstru = (String) session.getAttribute("selectedInstrument2");
			if (user.equals("Login")) {

				response.sendRedirect("LoginRequired.html");

			} else {

				boolean inserted = op.addToWish(user, selectedInstru);
				if (inserted) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Instrument Added To wish List');");
					out.println("location='Home.jsp';");
					out.println("</script>");

				} else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Instrument Already In Wish List');");
					out.println("location='Home.jsp';");
					out.println("</script>");
				}
			}
		} else if (button.equals("wishlist3")) {
			selectedInstru = (String) session.getAttribute("selectedInstrument3");
			if (user.equals("Login")) {

				response.sendRedirect("LoginRequired.html");

			} else {

				boolean inserted = op.addToWish(user, selectedInstru);
				if (inserted) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Instrument Added To wish List');");
					out.println("location='Home.jsp';");
					out.println("</script>");

				} else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Instrument Already In Wish List');");
					out.println("location='Home.jsp';");
					out.println("</script>");
				}
			}
		} else if (button.equals("wishlist4")) {

			selectedInstru = (String) session.getAttribute("selectedInstrument4");
			if (user.equals("Login")) {

				response.sendRedirect("LoginRequired.html");

			} else {

				boolean inserted = op.addToWish(user, selectedInstru);
				if (inserted) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Instrument Added To wish List');");
					out.println("location='Home.jsp';");
					out.println("</script>");

				} else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Instrument Already In Wish List');");
					out.println("location='Home.jsp';");
					out.println("</script>");
				}
			}
		} else if (button.equals("wishlist5")) {
			selectedInstru = (String) session.getAttribute("selectedInstrument5");
			if (user.equals("Login")) {

				response.sendRedirect("LoginRequired.html");

			} else {

				boolean inserted = op.addToWish(user, selectedInstru);
				if (inserted) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Instrument Added To wish List');");
					out.println("location='Home.jsp';");
					out.println("</script>");

				} else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Instrument Already In Wish List');");
					out.println("location='Home.jsp';");
					out.println("</script>");
				}
			}
		} else if (button.equals("wishlist6")) {
			selectedInstru = (String) session.getAttribute("selectedInstrument6");
			if (user.equals("Login")) {

				response.sendRedirect("LoginRequired.html");

			} else {

				boolean inserted = op.addToWish(user, selectedInstru);
				if (inserted) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Instrument Added To wish List');");
					out.println("location='Home.jsp';");
					out.println("</script>");

				} else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Instrument Already In Wish List');");
					out.println("location='Home.jsp';");
					out.println("</script>");
				}
			}
		} else if (button.equals("wishlist7")) {
			selectedInstru = (String) session.getAttribute("selectedInstrument7");
			if (user.equals("Login")) {

				response.sendRedirect("LoginRequired.html");

			} else {

				boolean inserted = op.addToWish(user, selectedInstru);
				if (inserted) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Instrument Added To wish List');");
					out.println("location='Home.jsp';");
					out.println("</script>");

				} else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Instrument Already In Wish List');");
					out.println("location='Home.jsp';");
					out.println("</script>");
				}
			}
		} else if (button.equals("wishlist8")) {
			selectedInstru = (String) session.getAttribute("selectedInstrument8");
			if (user.equals("Login")) {

				response.sendRedirect("LoginRequired.html");

			} else {

				boolean inserted = op.addToWish(user, selectedInstru);
				if (inserted) {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Instrument Added To wish List');");
					out.println("location='Home.jsp';");
					out.println("</script>");

				} else {
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Instrument Already In Wish List');");
					out.println("location='Home.jsp';");
					out.println("</script>");
				}
			}
		}

	}

}
