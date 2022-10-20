<%@page import="com.org.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html>
	<head>
	<title>Student Home Page</title>
	<meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <script type="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	  <link href="css/style.css" rel='stylesheet' type='text/css' />
	</head>

	<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<a href="studentDashboard.jsp" class="navbar-brand">Dashboard</a>
		</div>
		<div id="navbarCollapse" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="viewBooks.jsp">View all Books</a></li>
				<li><a href="publishBooks.jsp">Add Book</a></li>
				<li><a href="requestBooks.jsp">Request</a></li>
				<li><a href="deleteBook.jsp">Delete Book</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.html">Logout</a></li>
				</ul>
		</div>
	</nav>
	<%
try{
	String name = request.getAttribute("username").toString();
	session.setAttribute("uname", name);
	User u = User.userList.get(name);
	out.println("<b>Welcome " + name + "</b>");
	out.println("<br><br>Currently your wallet contains: <b>" + u.wallet + "</b> points");
	if (u.wallet > 0) {
		if (u.borrowLimit > 0) {
			out.println("<br><br>Currently Database contains <b>" + Book.bookList.size() + "</b> books");
			out.println("<br><br>You can borrow <b>" + u.borrowLimit + "</b> more books ");
			if (u.borrowLimit > 0) {
				if (Book.bookList.size() != 0)
					out.println("<button><a href=requestBooks.jsp>Request</a></button>");
			}
		} 
		else
			out.println("<br><br>You have reached your borrow limit, cannot borrow more books.");

		if (u.requestList.size() == 0)
			out.println("<br><br>You dont have any new borrow requests at the moment!");
		else
			out.println("<br><br>You have new Requests: ");
		out.println("<button><a href=viewRequests.jsp>View Recieved Requests</a></button>");

		if (u.sentRequests.size() == 0)
			out.println("<br><br>You have not sent any borrow requests");
		out.println("<button><a href=sentRequests.jsp>View Sent Requests</a></button>"); //not created	

		if (u.borrowedBooks.size() == 0)
			out.println("<br><br>You have not borrowed any book yet.");
		else
			out.println("<button><a href=viewBorrowedBooks.jsp>View Borrowed Books</a></button>");

		out.println("<br><br><button><a href=publishBooks.jsp>Publish Books</a></button>");
		out.println("<br><br><button><a href=viewBooks.jsp>View Books</a></button>");

		if (u.numBooksPub > 0)
			out.println("<br><br><button><a href=deleteBook.jsp>delete Books</a></button>");
		
		out.println("<br><br><button onclick='history.back()'>Back</button>");
		out.println("<br><br><button><a href=index.html> log out </a></button>");

	} else {
		out.println("<br><br>wallet too low! cant access the portal.");
		out.println("<br><br><button onclick='history.back()'>Back</button>");
	}
}
	catch(Exception e){
		System.out.println(e);
	}
	%>
</body>
</html>