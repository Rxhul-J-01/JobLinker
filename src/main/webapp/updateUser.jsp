<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="all_components/allCss.jsp" %>
<title>Edit Profile</title>
</head>
<body>



<%@ include file = "all_components/navbar.jsp" %>

	<div class = "main"  id = "back-img">
	
	
			<div class = "box2">
				<i class="fa-solid fa-address-card"></i>
				<h1>Edit: Profile</h1>	
				
				<c:if test="${not empty succMsg }">
					<h4 class = "text-center text-success">${succMsg }</h4>
					<c:remove var="succMsg"/>
				</c:if>
				
				<form action = "updateUserServlet" method = "post">
					<input type = "hidden" name = "id" value = "${userObj.id }">
					<p>Enter full name</p>
					<input type = "text" name = "name" value = "${userObj.name }">
					<p>Enter qualification</p>
					<input type = "text" name = "qualification" value = "${userObj.qualification }">
					<p>Enter email</p>
					<input type = "email" name = "email" value = "${userObj.email}">
					<p>Enter password</p>
					<input type = "password" name = "pass" value = "${userObj.password }">
					
					<button>Update</button>
				</form>
			</div>
		</div>


</body>
</html>