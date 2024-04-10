<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file = "all_components/allCss.jsp" %>
<title>Admin</title>

<style type = "text/css">
	.back-img{
		background: url("images/adminnn.jpg");
		background-repeat: no-repeat;
		width: 100%;
		height:92.4vh;
		background-size: 210vh 100vh;
	}
</style>
</head>
<body>

	<c:if test="${userObj.role ne 'admin' }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	

<%@include file = "all_components/navbar.jsp" %>

	<%
	
		response.setHeader("cache-control","no-cache, no-store, must-revalidate");
	
		if(session.getAttribute("userObj") == null){
			response.sendRedirect("login.jsp");
		}
	%>

	<div class = "container-fluid back-img">
		<div class = "text-center">	
			<h1 class = "text-white p-4">Welcome Admin </h1>
		</div>
	</div>

</body>
</html>