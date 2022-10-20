

import java.io.IOException;
import com.org.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BookPublish
 */
@WebServlet("/BookPublish")
public class BookPublish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookPublish() {
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
		
			Exception ex = null;
			HttpSession session=request.getSession();  
			String uname = session.getAttribute("uname").toString();
			User u = User.userList.get(uname);
			
			String bname = null,author = null,edition = null;
			int year = 0;
			try {
				bname = request.getParameter("bname");
				author = request.getParameter("author");
				edition = request.getParameter("edition");
				year = Integer.parseInt(request.getParameter("year"));
			}
			catch(Exception e) {
				System.out.println(e);
				ex = e;
			}
			
			if(ex == null) {
				Book b = new Book(bname,author,edition,year,uname);
				Book.bookList.put(b.bookID,b);
				u.numBooksPub = u.numBooksPub + 1;
				
				request.setAttribute("bname", bname);
				request.setAttribute("bookID", b.bookID);
				RequestDispatcher rd = request.getRequestDispatcher("afterPublishing.jsp");
				rd.forward(request, response);
			}
			else {
				response.sendRedirect("publishBooks.jsp");
			}
	}

}
