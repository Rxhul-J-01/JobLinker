<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#">JobLinker</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link mr-2" href="index.jsp"><i class="fa-solid fa-house mr-2"></i>Home <span class="sr-only">(current)</span></a>
      </li>
      
      <c:if test="${userObj.role eq 'admin' }">
      	
	      <li class="nav-item">
	        <a class="nav-link mr-2" href="postjob.jsp" ><i class="fa-solid fa-square-plus mr-2"></i>Post Job</a>
	      </li>
	      
	      <li class="nav-item">
	        <a class="nav-link mr-2" href="viewjob.jsp"><i class="fa-solid fa-eye mr-2"></i>View Job</a>
	      </li>
      	
      </c:if>
    	
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
    
    	
    	
    	<c:if test="${userObj.role eq 'admin'}">
    		<a href = "admin.jsp" class = "btn btn-light "><i class="fa-solid fa-user mr-1"></i>Admin</a>
    		<a href = "logout" class = "btn btn-light ml-3"><i class="fa-solid fa-right-to-bracket mr-1"></i>Logout</a>
    	</c:if>
    	
    	
    	<c:if test="${userObj.role eq 'user'}">
    		<a href = "#" class = "btn btn-light " data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-user mr-1"></i>${userObj.name}</a>
    		<a href = "logout" class = "btn btn-light ml-3"><i class="fa-solid fa-right-to-bracket mr-1"></i>Logout</a>
    	</c:if>
    	
    	
    		<c:if test="${empty userObj}">
    		
    		<a href = "login.jsp" class = "btn btn-light "><i class="fa-solid fa-right-to-bracket mr-1"></i>Login</a>
      		<a href = "register.jsp" class = "btn btn-light ml-3"><i class="fa-solid fa-user mr-1"></i>Signup</a>
    		
    	</c:if>
    
    </form>
  </div>
</nav>

<!--  Modal -->
<div class="modal fade" tabindex="-1" role = "dialog" id = "exampleModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Profile</h5>
        <button type="button" data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-xmark"></i></i></button>
      </div>
      <div class="modal-body">
        <div class = "text-center mr-3px" text-primary">
        	<i class="fas fa-user-circle fa-3x" style="margin-bottom: 3px;"></i>
        </div>
        <table class = "table">
        	<tbody>
        		<tr>
        			<th scope = "row">Name</th>
        			<th>${userObj.name }</th>
        		</tr>
        		<tr>
        			<th scope = "row">Qualification</th>
        			<th>${userObj.qualification }</th>
        		</tr>
        		<tr>
        			<th scope = "row">Email</th>
        			<th>${userObj.email }</th>
        		</tr>
        	</tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <a href="updateUser.jsp" class="btn btn-primary">Edit</a>
      </div>
    </div>
  </div>
</div>