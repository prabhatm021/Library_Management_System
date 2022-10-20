<%@page import="com.org.Book"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html>
	<head>
	<title>View Books</title>
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
if(Book.bookList.size() == 0) {
	out.println("<h>No Books have been published yet!</h>");
}
else{
	out.println("<b><h1>The list of books available are:</h1></b>");
	out.println("<b>Book ID-Book Name-Author-Edition-Year-Published By</b><br><br>");
	Iterator<Entry<Integer,Book>> itr = Book.bookList.entrySet().iterator();
	while(itr.hasNext()){
		Entry<Integer,Book> entry = itr.next();
		Book b = entry.getValue();
		out.print(b.bookID+" ----- "+b.bookName + " ----- "+ b.author+" ----- "+b.edition+" ----- "+b.year+" ----- "+b.publishedBy);
		out.println("<br><br>");
	}
}
out.println("<br><br><button><a href=publishBooks.jsp>Publish Books</a></button>");
out.println("<br><br><button><a href=requestBooks.jsp>Request Books</a></button>");
out.println("<br><br><button><a href=deleteBook.jsp>Delete Books</a></button>");
out.println("<br><br><button onclick='history.back()'>Back</button>");
out.println("<br><br><button><a href=index.html> log out </a></button>");
%>
</body>
</html>