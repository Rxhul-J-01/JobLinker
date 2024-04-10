<%@page import ="com.db.DBConnect"  %>
<%@page import = "java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JobLinker</title>

<%@ include file="all_components/allCss.jsp" %>
<style type = "text/css">
		
		.back-img{
				background: url("images/img1.jpg");
				width:100%;
				height:83.7vh;
				background-repeat: no-repeat;
				background-size:cover;
		}
</style>
</head>
<body>

	<%@ include file= "all_components/navbar.jsp" %>
	
	
	
	<div class = "back-img">
	</div>
	
	<%@ include file="all_components/footer.jsp" %>

</body>
</html>