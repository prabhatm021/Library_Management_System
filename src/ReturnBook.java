

import java.io.IOException;
import com.org.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.User;

/**
 * Servlet implementation class ReturnBook
 */
@WebServlet("/ReturnBook")
public class ReturnBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookID = 0;
		HttpSession session=request.getSession();  
		String uname = session.getAttribute("uname").toString();
		Exception ex = null;
		try {
			bookID = Integer.parseInt(request.getParameter("bID"));
		}
		catch(Exception e) {
			System.out.println(e);
			ex = null;
		}
		if(ex == null) {
			User u = User.userList.get(uname);
			if(!u.borrowedBooks.containsKey(bookID)) {
				response.sendRedirect("viewBorrowedBooks.java");
			}
			else {
				Book b = u.borrowedBooks.get(bookID);
				b.borrowedStatus = "Available";
				u.borrowedBooks.remove(bookID);
				Book.bookList.put(bookID,b);
				u.borrowLimit++;
				RequestDispatcher rd = request.getRequestDispatcher("successfullyReturned.jsp");
				rd.forward(request, response);
			}
		}
	}

}
