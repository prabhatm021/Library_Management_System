<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html>
	<head>
	<title>Publish Books</title>
	<meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	  <link href="css/style.css" rel='stylesheet' type='text/css' />
	</head>
	<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<a  href="userDashboard.jsp" class="navbar-brand" >Dashboard</a>
		</div>
		<div id="navbarCollapse" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="viewBooks.jsp">View all Books</a></li>
				<li class="active"><a href="publishBooks.jsp">Add Book</a></li>
				<li><a href="requestBooks.jsp">Request</a></li>
				<li><a href="deleteBook.jsp">Delete Book</a></li>

				</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="index.html">Logout</a></li>
			</ul>
		</div>
	</nav>
	<div class="login-form">
	<div class="well">
<b><h1>Enter Book Details</h1></b>
	<form method="post" action="BookPublish">
		<table>
			<tr>
				<td>Book Name</td>
				<td><input type="text" name="bname"></td>
			</tr>
			<tr>
				<td>Author</td>
				<td><input type="text" name="author"></td>
			</tr>
			<tr>
				<td>Edition</td>
				<td><input type="text" name="edition"></td>
			</tr>
			<tr>
				<td>Year</td>
				<td><input type="text" name="year"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="publish"></td>
			</tr>
			
		</table>
	</form>
<br>
<%
out.println("<br><br><button onclick='history.back()'>Back</button>");
	String uname = session.getAttribute("uname").toString();
	request.setAttribute("uname",uname);
%>
</body>
</html>