<%@page import="com.org.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html>
	<head>
	<title>View Requests</title>
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
	if (u.requestList.size() == 0)
		out.println("<h>No new requests at the moment!</h>");
	else {
		out.println("<b><h1>Requests recieved: </h1></b>");
		out.println("<b>Request ID-Requested by-Book ID-Book Name</b><br><br>");
		Iterator<Entry<Integer, Request>> itr = u.requestList.entrySet().iterator();
		while (itr.hasNext()) {
			Entry<Integer, Request> entry = itr.next();
			Request r = entry.getValue();
			out.print(r.requestID + " ----- " + r.requestingUserName + " ----- " + r.requestedBookID + " ----- "
			+ Book.bookList.get(r.requestedBookID).bookName);
			out.println("<br><br>");
		}
		out.println("<br><br><button onclick='history.back()'>Back</button>");
		out.println("<br><br><button><a href=index.html> log out </a></button>");
	}
	%>
	<br><br><h1>Accept Request:</h1><br>
	<form method="post" action="AcceptRequests">
		<table>
			<tr>
				<td>Request ID</td>
				<td><input type="text" name="reqID"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Accept"></td>
			</tr>
		</table>
	</form>
	<br><br>
	<h1>Delete Request:</h1>
	<form method="post" action="DeleteRequest">
		<table>
			<tr>
				<td>Request ID</td>
				<td><input type="text" name="reqID"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Delete"></td>
			</tr>
		</table>
	</form>
</body>
</html>