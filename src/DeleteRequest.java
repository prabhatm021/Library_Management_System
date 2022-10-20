

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
 * Servlet implementation class DeleteRequest
 */
@WebServlet("/DeleteRequest")
public class DeleteRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteRequest() {
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
		int reqID = 0;
		HttpSession session=request.getSession();  
		String uname = session.getAttribute("uname").toString();
		Exception ex = null;
		try {
			reqID = Integer.parseInt(request.getParameter("reqID"));
		}
		catch (Exception e) {
			System.out.println(e);
			ex = e;
		}
		if(ex != null) {
			response.sendRedirect("viewRequests.jsp");
		}
		else {
			User u1 = User.userList.get(uname);
			if(!u1.requestList.containsKey(reqID)) {
				response.sendRedirect("viewRequests.jsp");
			}
			else {
				String requester = u1.requestList.get(reqID).requestingUserName;
				User u2 = User.userList.get(requester);
				Request r = u2.sentRequests.get(reqID);
				r.approvalStatus = "denied";
				u1.requestList.remove(reqID);
				RequestDispatcher rd = request.getRequestDispatcher("successfullyDeleted.jsp");
				rd.forward(request, response);
				
			}
		}
	}

}
