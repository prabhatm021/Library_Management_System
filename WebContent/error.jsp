<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Invalid</title>
</head>
<body>
<%@ page import = "com.org.*" %>
<%
out.println("Invalid username or password ");
out.println("<br><br> ");
out.println("<br><button onclick='history.back()'>Back</button>");
%>
</body>
</html>