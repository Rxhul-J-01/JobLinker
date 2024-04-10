<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.ArrayList, com.dao.jobDAO, com.entity.Job, com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="all_components/allCss.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user: Search_Jobs</title>
	<script src="javaScript.js"></script>
<style>
    body {
        margin: 0;
        padding: 0;
        background-color: #F8F8F8;
        text-align: center; /* Center align the content */
    }
    
    h4 {
        margin-top: 20px; /* Adjust the top margin */
    }
    
    form#job-form {
        width: 90%;
        margin: 20px auto 0 auto; /* Adjust top margin to avoid overlapping with the navbar */
        border: 1px solid 	#A9A9A9;
        padding: 20px;
        text-align:left;
        box-sizing: border-box;
        background-color:white;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    form#job-form .row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    form#job-form .form-group {
        flex: 0 0 45%;
    }

    form#job-form .form-group label {
        display: block;
        margin-bottom: 5px;
    }

    form#job-form .form-group select {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    form#job-form .submit-button {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #007bff;
        color: #fff;
        margin-top:1.3vw;
        cursor: pointer;
    }
    
    .main3{
    	padding-top:1vw;
    	text-align:left;
    }
    
    .card{
    	background-color:white;
    	border-radius:0;
    	border: 1px solid 	#A9A9A9;
    	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    
    .main3 .buttons button{
    	text-transform:none;
        background-color: #007bff;
    }
    
    
    
</style>
</head>
<body>

<%@include file = "all_components/navbar.jsp" %>

<c:if test="${empty userObj}">
	<c:redirect url = "login.jsp"/>
</c:if>

	
	<h4>All Jobs</h4>
	
		<div class = "main3">
	
		<%
			String loc = request.getParameter("location");
			String cat = request.getParameter("category");
			String msg = "";
			
			jobDAO dao = new jobDAO(DBConnect.getCon());
			ArrayList<Job> list = null;
			
			if("lo".equals(loc) && "ca".equals(cat)){
				list = new ArrayList<>();
				msg = "Job Not Available";
			}else if("lo".equals(loc) || "ca".equals(cat)){
				list = dao.getORJobs(cat, loc);
			}else{
				list = dao.getANDJobs(cat, loc);
			}
			if(list.isEmpty()){
				
			%>
			<h4 class = "text-center text-danger">Job Not Available</h4>
			<%
			}
			if(list != null){
					
				for(Job j : list){
			%>	
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
						 <button id="applyButton-<%=j.getId()%>" class="delete" onclick="applyForJob('<%=j.getId()%>')">Apply</button>
		   			</div>
				</div>
				
			<%
				}
			}else{	
			%>
			<h4 class = "text-center text-danger"><%=msg%></h4>
			<%
			}
		%>
	</div>

</body>
</html>