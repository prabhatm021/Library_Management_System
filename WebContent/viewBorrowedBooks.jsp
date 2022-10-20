<%@page import="com.org.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html>
	<head>
	<title>View Borrowed Books</title>
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
String uname = session.getAttribute("uname").toString();
session.setAttribute("uname", uname);
User u = User.userList.get(uname);
if(u.borrowedBooks.size() == 0) {
	out.println("<h>You have not borrowed any books yet!</h>");
}
else{
	out.println("<b><h1>The list of books you have borrowed are:</h1></b>");
	out.println("<b>Book ID-Book Name-Author-Edition-Year-Days Remaining</b><br><br>");
	Iterator<Entry<Integer,Book>> itr = u.borrowedBooks.entrySet().iterator();
	Date now = new Date();
	while(itr.hasNext()){
		Entry<Integer,Book> entry = itr.next();
		Book b = entry.getValue();
		Long daysLeft = 14-(now.getTime()-b.date.getTime())/10000;		//10sec
		daysLeft = Math.max(0,daysLeft);
		out.print(b.bookID+" ----- "+b.bookName + " ----- "+ b.author+" ----- "+b.edition+" ----- "+b.year+" ----- "+daysLeft);
		out.println("<br><br>");
	}
	out.println("<br><br>To return a book: ");
}
%>
<form method="post" action="ReturnBook">
		<table>
			<tr>
				<td>Book ID</td>
				<td><input type="text" name="bID"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="return"></td>
			</tr>
		</table>
	</form>
<%
out.println("<br><br><button><a href=publishBooks.jsp>Publish Book</a></button>");
out.println("<br><br><button><a href=requestBooks.jsp>Request Book</a></button>");
out.println("<br><br><button onclick='history.back()'>Back</button>");
out.println("<br><br><button><a href=index.html> log out </a></button>");
%>
</body>
</html>