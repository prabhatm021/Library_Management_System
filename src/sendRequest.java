

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.Request;
import com.org.User;

/**
 * Servlet implementation class sendRequest
 */
@WebServlet("/sendRequest")
public class sendRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sendRequest() {
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
		String lender = null;
		HttpSession session=request.getSession();  
		String uname = session.getAttribute("uname").toString();
		Exception ex = null;
		try {
			bookID = Integer.parseInt(request.getParameter("bID"));
			lender = request.getParameter("lender");
		}
		catch (Exception e) {
			System.out.println(e);
			ex = e;
		}
		
		if(ex != null) {
			response.sendRedirect("requestBooks.jsp");
		}
		else {
			if(!User.userList.containsKey(lender)) {
				RequestDispatcher rd = request.getRequestDispatcher("requestUnsuccessful.jsp");
				rd.forward(request, response);
			}
			else {
				if(uname.equals(lender)) {
					RequestDispatcher rd = request.getRequestDispatcher("requestUnsuccessful.jsp");
					rd.forward(request, response);
				}
				else {
					//System.out.println(lender);
					User u1 = User.userList.get(uname);
					User u2 = User.userList.get(lender);
					Request.count++;
					Request r = new Request(Request.count,uname,lender,bookID);
					u1.sentRequests.put(Request.count, r);
					u2.requestList.put(Request.count, r);
					
					RequestDispatcher rd = request.getRequestDispatcher("requestSent.jsp");
					rd.forward(request, response);
				}
			}	
		}
	}

}
