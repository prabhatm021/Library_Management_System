

import java.io.IOException;
import com.org.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		try {
			String uname = request.getParameter("uname");
			String ID = request.getParameter("ID");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			long phNum = Long.parseLong(request.getParameter("phoneNumber"));
			String address = request.getParameter("address");
			
			if(!User.map.containsKey(uname)) {
				User u = new User(uname,ID,email,phNum,address,password);
				u.addToMap();
				User.userList.put(uname,u);
				RequestDispatcher rd = request.getRequestDispatcher("afterRegistration.jsp");
				rd.forward(request, response);
			}
			else {
				response.sendRedirect("alreadyExists.jsp");
			}

		}
		catch(Exception e) {
			response.sendRedirect("newUser.jsp");
		}
		
	}

}
