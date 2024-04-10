<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList, com.dao.jobDAO, com.entity.Job, com.db.DBConnect"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%@ include file="all_components/allCss.jsp" %>
<body>

	<c:if test="${userObj.role ne 'admin' }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@ include file = "all_components/navbar.jsp" %>
	
	<%
	
		response.setHeader("cache-control","no-cache, no-store, must-revalidate");
	
		if(session.getAttribute("userObj") == null){
			response.sendRedirect("login.jsp");
		}
	%>
	
	<div class = "main3">
	
		<h3>All Jobs</h3>
	
		<%
			jobDAO dao = new jobDAO(DBConnect.getCon());
			ArrayList<Job> list = dao.getAllJobs();
		
			for(Job j: list)
			{%>
			
				<c:if test="${not empty alertMsg}">
						<div class="alert alert-success" role="success">${ alertMsg}</div>
						<c:remove var="alertMsg"/>
					</c:if>
				
					<div class="card">
					
				    <h4><%= j.getTitle() %></h4>
				    <p><%= j.getDescription() %></p>
				    <div class="input-row">
				        <input type="text" value="Location: <%= j.getLocation() %>" readonly>
				        <input type="text" value="Category: <%= j.getCategory() %>" readonly>
				        <input type="text" value="Status: <%= j.getStatus() %>" readonly>
		    		</div>
				    <h6>Date Published</h6>
				    <p><%= j.getPdate() %></p>
				    <div class="buttons">
				        <button class="edit" onclick="window.location.href='edit_job.jsp?id=<%=j.getId()%>'">Edit</button>
						<button class="delete" onclick="window.location.href='delete?id=<%=j.getId()%>'">Delete</button>

		   			</div>
				</div>
			<%}
		%>
		
		
	</div>
		

</body>
</html>