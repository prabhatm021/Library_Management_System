<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html>
	<head>
	<title>Request Books</title>
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
			<a  href="member.jsp" class="navbar-brand" >Dashboard</a>
		</div>
		<div id="navbarCollapse" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="viewBooks.jsp">View all Books</a></li>
				<li><a href="publishBooks.jsp">Add Book</a></li>
				<li class="active"><a href="request.jsp">Request</a></li>
				<li><a href="deleteBook.jsp">Delete Book</a></li>
				</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="index.html">Logout</a></li>
			</ul>
		</div>
	</nav>
	<div class="login-form">
	<div class="well">
<form method="post" action="sendRequest">
		<table>
			<tr>
				<td>Book ID</td>
				<td><input type="text" name="bID"></td>
			</tr>
			<tr>
				<td>Borrow From</td>
				<td><input type="text" name="lender"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="request"></td>
			</tr>
		</table>
	</form>
	<%
		String uname = session.getAttribute("uname").toString();
		session.setAttribute("uname",uname);
		out.println("<br><br><button onclick='history.back()'>Back</button>");
	%>
</body>
</html>
