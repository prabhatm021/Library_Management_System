<%@page import="com.org.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html>
	<head>
	<title>Penalize</title>
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
				<li><a href="generateReport.jsp">Generate Report</a></li>
				<li class="active"><a href="penalize.jsp">Penalize</a></li>
				<li><a href="viewUsers.jsp">View Users</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.html">Logout</a></li>
				</ul>
		</div>
	</nav>
<b>User Name - Penalty - Wallet</b>
<%
	Iterator<Entry<String,User>> itr = User.userList.entrySet().iterator();
	Date now = new Date();
	while(itr.hasNext()){
		long penalty = 0;
		Entry<String,User> entry = itr.next();
		User u = entry.getValue();
		Iterator<Entry<Integer,Book>> bookItr = u.borrowedBooks.entrySet().iterator();
		while(bookItr.hasNext()){
			Entry<Integer,Book> bookEntry = bookItr.next();
			Book b = bookEntry.getValue();
			long daysLeft = 14-(now.getTime()-b.date.getTime())/30000;		//30sec
			if(daysLeft<0){
				penalty = penalty + daysLeft*20;
			}
		}
		if(penalty<0){
			u.wallet = u.wallet + penalty;
			out.println("<br><br>"+u.uname+" ----- "+penalty+" ----- "+u.wallet);
		}
			
	}
%>
<br><br><button onclick='history.back()'>Back</button>
<br><br><button><a href=index.html> log out </a></button>
</body>
</html>