<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin Login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="css/style.css" rel='stylesheet' type='text/css' />
</head>
<body>
	<div class="login-form">
		<div class="well">
			<h3>Admin Login</h3>
			<form action="AdminLoginCheck" name="adminLoginForm" method="post">
				<input type="text" name="adminName" placeholder="Admin Name"
					class="ggg"><br> <input type="password"
					name="password" placeholder="Password" class="ggg"><br>
				<button type="submit" value="Login">Login</button>
				<br>
				<h6>
					<a href="forgotPassword.jsp">Forgot Password?</a>
				</h6>
			</form>
			<button onclick='history.back()'>Back</button>
		</div>
	</div>
</body>
</html>