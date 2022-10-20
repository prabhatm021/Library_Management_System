

import java.io.IOException;
import com.org.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.org.Book;
import java.util.*;
import java.util.Map.Entry;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUser() {
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
		String uname = null;
		Exception ex = null;
		try {
			uname = request.getParameter("uname");
		}
		catch(Exception e) {
			System.out.println(e);
			ex = e;
		}
		
		if(ex == null) {
			if(User.userList.containsKey(uname)) {
				User.userList.remove(uname);
				User.map.remove(uname);
				ArrayList<Integer> list = new ArrayList<>();
				Iterator<Entry<Integer,Book>> itr = Book.bookList.entrySet().iterator();
				while(itr.hasNext()){
					Entry<Integer,Book> entry = itr.next();
					Book b = entry.getValue();
					if(b.publishedBy.equals(uname)) 
						list.add(b.bookID);
				}
				for(int i : list)
					Book.bookList.remove(i);
				RequestDispatcher rd = request.getRequestDispatcher("afterDeletingUser.jsp");
				rd.forward(request, response);
			}
			else {
				response.sendRedirect("deleteUser.jsp");
			}
		}
		else {
			response.sendRedirect("deleteUser.jsp");
		}
	}

}
