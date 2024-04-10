<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="all_components/allCss.jsp" %>
<title>Insert title here</title>
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

	<%
	
		response.setHeader("cache-control","no-cache, no-store, must-revalidate");
	
		if(session.getAttribute("userObj") == null){
			response.sendRedirect("login.jsp");
		}
	%>

	<div class = "main1 back-img">
		
		<div class="container">
        <h2>Job Posting Form</h2>
        
        <c:if test="${not empty alertMsg}">
			<div class="alert alert-warning" role="alert">${ alertMsg}</div>
			<c:remove var="alertMsg"/>
		</c:if>
        
        <form action="add_job" method="post">
            <div class="form-group">
                <label for="title">Enter Title:</label>
                <input type="text" id="title" name="title">
            </div>
            <div class="row">
                <div class="form-group">
                    <label for="location">Location:</label>
                    <select id="location" name="location">
                    	<option value="" disabled selected>Select Location</option>
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
                    	<option value="" disabled selected>Select Category</option>
                        <option value="IT">Information Technology</option>
                        <option value="Cs">Computer Science</option>
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
                    	<option value="" disabled selected>Choose Status</option>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                        <!-- Add more options as needed -->
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="description">Enter Description:</label>
                <textarea id="description" name="description" rows="4" cols="50"></textarea>
            </div>
            <div class="form-group">
                <button type="submit">Post Job</button>
            </div>
        </form>
    </div>
	</div>

	

</body>
</html>