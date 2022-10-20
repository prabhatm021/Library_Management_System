<

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <html>
    <head>
    <title>OLWA Admin</title>
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
            <a  href="adminDashboard.jsp" class="navbar-brand" >Dashboard</a>
        </div>
        <div id="navbarCollapse" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="viewBooks.jsp">View all Books</a></li>
                <li><a href="viewUsers.jsp">View all Users</a></li>
                <li><a href="publishBooks.jsp">Add Book</a></li>
                <!--<li><a href="updateBook.jsp">Update Book</a></li>-->
                <li><a href="deleteBook.jsp">Delete Book</a></li>
                <li><a href="deleteUser.jsp">Delete User</a></li>
                </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="index.html">Logout</a></li>
            </ul>
        </div>
    </nav>
<title>Deleted!</title>
</head>
<body>
<%
out.println("<br><br>The Book has been deleted successfully!");
out.println("<br><br><button onclick='history.back()'>Back</button>");
%>
</body>
</html>