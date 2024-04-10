<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<%@ page import="java.util.ArrayList, com.dao.jobDAO, com.entity.Job, com.db.DBConnect"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="all_components/allCss.jsp" %>
<title>User: viewJobs</title>

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

	<%
	
		response.setHeader("cache-control","no-cache, no-store, must-revalidate");
		if(session.getAttribute("userObj")== null){
			response.sendRedirect("login.jsp");
		}
	%>

<h4>All Jobs</h4>
<form id="job-form" action = "more_view.jsp" method = "get">
    
    <div class="row">
        <div class="form-group">
            <label for="location">Location:</label>
            <select id="location" name="location">
                <option value="lo" selected>Select Location:</option>
                <option value="Delhi">Delhi</option>
                <option value="Mumbai">Mumbai</option>
                <option value="Noida">Noida</option>
                <option value="Bangalore">Bangalore</option>
                <option value="Hyderabad">Hyderabad</option>
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
                <option value="ca" selected>Select Category:</option>
                <option value="Information Technology">Information Technology</option>
                <option value="Computer Science">Computer Science</option>
                <option value="Banking">Banking</option>
                <option value="Engineer">Engineer</option>
                <option value="Graphic Designer">Graphic Designer</option>
                <option value="Teacher">Teacher</option>
                <!-- Add more options as needed -->
            </select>
        </div>
        <button type="submit" class="submit-button">Submit</button>
    </div>
</form>

	<div class = "main3">
	
		<%
			jobDAO dao = new jobDAO(DBConnect.getCon());
			ArrayList<Job> list = dao.getAllJobsForUsers();
		
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
						 <button id="applyButton-<%=j.getId()%>" class="delete" onclick="applyForJob('<%=j.getId()%>')">Apply</button>
		   			</div>
				</div>
			<%}
		%>
	</div>

</body>
</html>
