<%@page import="com.org.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html>
	<head>
	<title>Report</title>
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
				<li class="active"><a href="generateReport.jsp">Generate Report</a></li>
				<li><a href="penalize.jsp">Penalize</a></li>
				<li><a href="viewUsers.jsp">View Users</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.html">Logout</a></li>
				</ul>
		</div>
	</nav>
<%
if(User.userList.size() == 0) {
	out.println("<h>Nothing to show!</h>");
}
else{
	out.println("<b><h1>The list of books available are:</h1></b>");
	out.println("<b>Book ID-Book Name-Author-Edition-Year-Published By-Availability</b><br><br>");
	Iterator<Entry<Integer,Book>> itr = Book.bookList.entrySet().iterator();
	while(itr.hasNext()){
		Entry<Integer,Book> entry = itr.next();
		Book b = entry.getValue();
		out.print(b.bookID+" --- "+b.bookName + " --- "+ b.author+" --- "+b.edition+" --- "+b.year+" --- "+b.publishedBy+" --- " + b.borrowedStatus);
		out.println("<br><br>");
	}
	
	Iterator<Entry<String,User>> itr2 = User.userList.entrySet().iterator();
	while(itr2.hasNext()){
		Entry<String,User> entry = itr2.next();
		User u = entry.getValue();
		HashMap<Integer,Book> hmap = u.borrowedBooks;
		Iterator<Entry<Integer,Book>> itr3 = hmap.entrySet().iterator();
		while(itr3.hasNext()){
			Entry<Integer,Book> newEntry = itr3.next();
			Book b = newEntry.getValue();
			out.print(b.bookID+" --- "+b.bookName + " --- "+ b.author+" --- "+b.edition+" --- "+b.year+" --- "+b.publishedBy+" --- " + b.borrowedStatus);
			out.println("<br><br>");
		}
	}
}
out.println("<br><br><button onclick='history.back()'>Back</button>");
out.println("<br><br><button><a href=index.html> log out </a></button>");
%>
</body>
</html>