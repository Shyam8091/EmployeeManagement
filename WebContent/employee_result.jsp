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
<title>EmployeeResult</title>
</head>
<body>
<div>
    <jsp:include page="header.jsp"/>
</div>
<br></br>
<%
    			   response.setHeader("cache-control ", "no-cache,no-store,must-revalidate");
    				if(session.getAttribute("username")==null)
    				{
    					response.sendRedirect("login.html");
    				}
    			%>
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.Iterator"%>
<%@page import="com.prohance.jamocha.details.Employee_Bean"%> 
<% ArrayList<Employee_Bean> employeeList = (ArrayList) request.getAttribute("emplist"); %>
<br></br>
<div align='right'>
<a href='employee_register.jsp'  class="btn btn-info">Add Employee</a>
</div><br>
<div >

<table class="table table-striped table-bordered" style="width:100%">

<tr><th>First Name</th><th>Last Name</th><th>Employee Id</th><th>Email</th><th>Designation</th><th>Skill Set</th><th>Gender</th><th>Password</th><th>Salary</th><th>Department</th><th>Edit</th><th>Delete</th></tr>
<%
if(request.getAttribute("emplist") != null)
{
	Iterator<Employee_Bean> iterator = employeeList.iterator(); 

while(iterator.hasNext())
	{
	 Employee_Bean ob = iterator.next();
	 %>
	 <tr>
	 <td><%=ob.getFname()%></td>
	 <td><%=ob.getLname()%></td>
	 <td><%=ob.getEid()%></td>
	 <td><%=ob.getEmail()%></td>
	 <td><%=ob.getDsg()%></td>
	 <td><%=ob.getSkill()%></td>
	 <td><%=ob.getGender()%></td>
	 <td><%=ob.getPass()%></td>
	 <td><%=ob.getSal()%></td>
	<td><%=ob.getDept()%></td>
	
	  <td><a href='edit_emp.jsp?eid=<%=ob.getEid()%>&dept=<%=ob.getDept()%>&fname=<%=ob.getFname() %>' class="btn btn-warning">Edit</td>
	  <td><a href='del_emp.jsp?eid=<%=ob.getEid()%>&dept=<%=ob.getDept()%>&fname=<%=ob.getFname()%>' class="btn btn-warning">Delete</td>
    
               
    </tr>            
                    
                 
	
	<%
	 }
}%></table>
 </form>
</body>
</html>