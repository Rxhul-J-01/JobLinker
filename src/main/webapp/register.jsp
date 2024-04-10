<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored ="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>

<%@ include file="all_components/allCss.jsp" %>
<style type = "text/css">
	#back-img{
		background: url("images/img3.jpg");
		width:100%;
		height:92.4vh;
		background-repeat: no-repeat;
		background-size:cover;
		
	}
</style>
</head>
<body>

<%@ include file = "all_components/navbar.jsp" %>

	<div class = "main1"  id = "back-img">
	
	
			<div class = "box2">
				<i class="fa-solid fa-address-card"></i>
				<h1>Signup</h1>	
				
				<c:if test="${not empty succMsg }">
					<h4 class = "text-center text-success">${succMsg }</h4>
					<c:remove var="succMsg"/>
				</c:if>
				
				<form action = "register" method = "post">
					<p>Enter full name</p>
					<input type = "text" name = "name">
					<p>Enter qualification</p>
					<input type = "text" name = "qualification">
					<p>Enter email</p>
					<input type = "email" name = "email">
					<p>Create password</p>
					<input type = "password" name = "pass">
					
					<button>Register</button>
				</form>
			</div>
		</div>

</body>
</html>