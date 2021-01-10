<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<title>DepartmentDetails</title>
</head>



<body>
<div>
    <jsp:include page="header.jsp"/>
</div>
<%
    			   response.setHeader("cache-control ", "no-cache,no-store,must-revalidate");
    				if(session.getAttribute("username")==null)
    				{
    					response.sendRedirect("login.html");
    				}
 %>
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.Iterator"%>
<%@page import="com.prohance.jamocha.details.Department_Bean"%> 
<% ArrayList<Department_Bean> departmentList = (ArrayList) request.getAttribute("departmentlist"); %>
<br></br><br></br>
<div align="right">
<a href='department_register.jsp'  class="btn btn-info">Add Department</a>
</div><br>
<div  align="center" class="container mb-3 mt-3" >
<table   class="table table-striped table-bordered" >
<tr><th>Department Name</th><th>Description</th><th>Active</th><th>Edit</th><th>Delete</th></tr>
<%
if(request.getAttribute("departmentlist") != null)
{
	Iterator<Department_Bean> iterator = departmentList.iterator(); 

while(iterator.hasNext())
	{
	 Department_Bean ob = iterator.next();
	 %>
	 <tr>
	 <td><%=ob.getName()%></td>
	 <td><%=ob.getDescription()%></td>
	 <td><%=ob.getActive()%></td>
	 <td><a href='edit_dept.jsp?name=<%=ob.getName()%>&description=<%=ob.getDescription()%>&active=<%=ob.getActive()%>' class="btn btn-warning">Edit</a></td>
	  <td><a href='del_dept.jsp?name=<%=ob.getName()%>' class="btn btn-warning">Delete</a></td>
	<%
	 }
}%>
</table>
</div>
</body>
</html>