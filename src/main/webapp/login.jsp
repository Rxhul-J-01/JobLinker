<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="all_components/allCss.jsp" %>
<title>Login</title>

<style type = "text/css">
	#back-img{
		background: url("images/img2.jpg");
		width:100%;
		height:92.4vh;
		background-repeat: no-repeat;
		background-size:cover;
		
	}
</style>
</head>
<body>

<%
    String errorMsg = (String) request.getAttribute("errorMsg");
    if (errorMsg != null && !errorMsg.isEmpty()) {
%>
    <script>
        alert("<%= errorMsg %>");
    </script>
<%
    }
%>


<%
	String msg = (String) request.getAttribute("succMsg");
	if(msg != null && !msg.isBlank()){
		
%>

<script>
        alert("<%= msg %>");
    </script>
<%
    }
%>

<%
    String logoutMsg = (String) session.getAttribute("logoutMsg");
    if (logoutMsg != null && !logoutMsg.isEmpty()) {
%>
    <script>
        alert("<%= logoutMsg %>");
    </script>
<%
    session.removeAttribute("logoutMsg");
    }
%>

<%@ include file = "all_components/navbar.jsp" %>

		
		<div class = "main" id = "back-img">
			<div class = "box">
				
				<i class="fa-solid fa-user-plus"></i>
				<h1>Login</h1>	
				
				<form action = "login" method = "post">
				
					<p>Enter email</p>
					<input type = "email" name = "email">
					
					<p>Enter password</p>
					<input type = "password" name = "pass">
					<button>Login</button>
					
				</form>
			</div>
		</div>
		

</body>
</html>