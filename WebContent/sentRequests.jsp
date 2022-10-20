<%@page import="com.org.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
	<html>
	<head>
	<title>Sent Requests</title>
	<meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	  <link href="css/style.css" rel='stylesheet' type='text/css' />
	</head>
	<body>
<%
	String uname = session.getAttribute("uname").toString();
	User u = User.userList.get(uname);
	if (u.sentRequests.size() == 0)
		out.println("<h>You have not sent any requests yet!</h>");
	else {
		out.println("<b><h1>Requests Sent: </h1></b>");
		out.println("<b>Request ID-Requested to-Book ID-Approval status</b><br><br>");
		Iterator<Entry<Integer, Request>> itr = u.sentRequests.entrySet().iterator();
		while (itr.hasNext()) {
			Entry<Integer, Request> entry = itr.next();
			Request r = entry.getValue();
			
			out.print(r.requestID + " ----- " + r.recievingUserName + " ----- " + r.requestedBookID + " ----- "+r.approvalStatus);
			out.println("<br><br>");
		}
		out.println("<br><br><button onclick='history.back()'>Back</button>");
		out.println("<br><br><button><a href=index.html> log out </a></button>");
	}
	%>
</body>
</html>