<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<%@ page import="java.util.ArrayList, com.dao.jobDAO, com.entity.Job, com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="all_components/allCss.jsp" %>
<title>Edit Job</title>
</head>

<style type = "text/css">
	.back-img{
		background: url("images/im.jpg");
		background-repeat: no-repeat;
		width: 100%;
		height:92.4vh;
		background-size: 210vh 100vh;
	}
</style>
<body>

	<c:if test="${userObj.role ne 'admin' }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

<%@include file = "all_components/navbar.jsp" %>

	<div class = "main1 back-img">
		
		<div class="container">
		
		<%
		
			int id = Integer.parseInt(request.getParameter("id"));
			jobDAO dao = new jobDAO(DBConnect.getCon());
			Job j = dao.getJob(id);
			
		%>
        <h2>Edit Job</h2>
        
        <form action="update" method="post">
        	
        	<input type = "hidden" value = "<%=j.getId()%>" name = "id">
            <div class="form-group">
                <label for="title">Enter Title:</label>
                <input type="text" id="title" name="title" value = "<%=j.getTitle() %>">
            </div>
            <div class="row">
                <div class="form-group">
                    <label for="location">Location:</label>
                    <select id="location" name="location">
                    	<option value="<%=j.getLocation()%>" selected><%= j.getLocation() %></option>
                        <option value="Delhi">Delhi</option>
                        <option value="Mumbai">Mumbai</option>
                        <option value="Noida">Noida</option>
                        <option value="Banglore">Banglore</option>
                        <option value="Hydrabad">Hydrabad</option>
                        <option value="Jaipur">Jaipur</option>
                        <option value="Pune">Pune</option>
                        <option value="Chennai">Chennai</option>
                        <option value="Ahmedabad">Ahmedabad</option>
                        <!-- Add more options as needed -->
                    </select>
                </div>
                <div class="form-group">
                    <label for="category">Category:</label>
                    <select id="category" name="category">
                    	<option value="<%= j.getCategory() %>"  selected><%= j.getCategory() %></option>
                        <option value="IT">Information Technology</option>
                        <option value="Computer Science">Computer Science</option>
                        <option value="Banking">Banking</option>
                        <option value="Engineer">Engineer</option>
                        <option value="Graphic Designer">Graphic Designer</option>
                        <option value="Teacher">Teacher</option>
                        <!-- Add more options as needed -->
                    </select>
                </div>
                <div class="form-group">
                    <label for="status">Status:</label>
                    <select id="status" name="status">
                    	<option value="<%= j.getStatus() %>"  selected><%= j.getStatus() %></option>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                        <!-- Add more options as needed -->
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="description">Enter Description:</label>
                <textarea id="description" name="description" rows="4" cols="50"><%=j.getDescription() %></textarea>
            </div>
            <div class="form-group">
                <button type="submit">Update Job</button>
            </div>
        </form>
    </div>
	</div>

	

</body>
</html>