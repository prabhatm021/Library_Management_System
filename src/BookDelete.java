
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.Book;
import com.org.User;

/**
 * Servlet implementation class BookDelete
 */
@WebServlet("/BookDelete")
public class BookDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookDelete() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Exception exc = null;
		HttpSession session = request.getSession();
		String uname = session.getAttribute("uname").toString();
		System.out.println("loggined in with: " + uname);
		String usernameEntered = null;
		int bID = 0;
		try {
			bID = Integer.parseInt(request.getParameter("bookID"));
			usernameEntered = request.getParameter("username");
			System.out.println(bID);
			System.out.println(usernameEntered);
		} catch (Exception e) {
			System.out.println(e);
			exc = e;
		}

		if (exc == null) {
			if (Book.bookList.containsKey(bID)) {
				if (uname.equals(usernameEntered) && Book.bookList.get(bID).publishedBy.equals(uname)) {
					Book.bookList.remove(bID);
					System.out.println("OK");
					RequestDispatcher rd = request.getRequestDispatcher("afterDeleting.jsp");
					rd.forward(request, response);
				} else {
					response.sendRedirect("deleteBook.jsp");
				}
			} else {
				response.sendRedirect("deleteBook.jsp");
			}

		} else {
			response.sendRedirect("deleteBook.jsp");
		}
	}

}
