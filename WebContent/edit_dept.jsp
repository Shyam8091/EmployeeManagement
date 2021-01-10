<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
 <%@page import="com.prohance.jamocha.db.DBConnection"  %>
 <%
    			   response.setHeader("cache-control ", "no-cache,no-store,must-revalidate");
    				if(session.getAttribute("username")==null)
    				{
    					response.sendRedirect("login.html");
    				}
  %>
  
  <%
  String name = request.getParameter("name").toUpperCase();
   String description = request.getParameter("description");
  String active = request.getParameter("active");
  %>
  <%Connection con=DBConnection.getCon();
	PreparedStatement preparedStatement1 = con.prepareStatement(" select d.name,e.eid from employee e ,department d where d.name=e.dept AND name='"+name+"' ");
	ResultSet resultSet=preparedStatement1.executeQuery();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width,initial-scale-1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
function fun(){
	if(<%=resultSet.next()%>) 
	{
		document.getElementById("new_name").setAttribute("readonly",true);
	}
	else
	{
	}
}
</script>
<title>Department Edit</title>
<style>
body {
    margin: 0;
    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: lightgoldenrodyellow;
    text-align: left;
    background-color:lightgoldenrodyellow ;
}
	div{
		text-align: center 100%;
		font-family: "Comic Sans MS", sans-serif;
		background-color:lightgoldenrodyellow;
	}

	label{
		text-align: center;
		color: black;
	}
	input{
		text-align: center;
		color: white;
		border-bottom-left-radius: 25px;
	}
	h4{
		font-size: 30px ;
		color: black;
		font-family: Arial, sans-serif;
		text-shadow: brown 2px 2px;
	}
	.alert-success {
		color: #155724;
		background-color: lightgoldenrodyellow;
		border-color: lightgoldenrodyellow;
	}

	</style>

</head>
<body onload="fun()">
<div align="center">
<form  action="departmentEditServlet" method="get" >

<h4>Edit Department Details</h4>
<input type="hidden" name="name"
			value='<%=name %>'/>
			<div class="col-md-6 mb-3">
				<label for="name">Name</label> <input type="text"
					class="form-control" id="new_name" name="new_name" 
					value="<%=name %>" required>
			</div>
			<div class="col-md-6 mb-3">
				<label for="description">Description</label>
				<textarea class="form-control"   value='<%=description%>' name="description"></textarea>
			</div>
			<div class="col-md-6 mb-3">
				<label for="active">Active</label> <input type="text"
					class="form-control" id="active" name="active" placeholder="yes or no"
					value="<%=active %>">
			</div>
			<div class="alert alert-success" role="alert">
				<button type="submit" 
					class="btn btn-success">Update</button>
				<button type="reset" class="btn btn-danger">Reset</button>
				<a href="department_data" class="btn btn-info">Back</a>
			</div>
		</form>
</div>
</body>
</html>