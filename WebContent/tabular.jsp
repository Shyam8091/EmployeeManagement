<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
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

Connection con=DBConnection.getCon();
PreparedStatement preparedStatement=con.prepareStatement("select d.name as Department,count(*) as Employee,sum(sal) as Salary from EMPLOYEE e,DEPARTMENT d where d.name = e.dept group by d.name order by d.name asc");
ResultSet resultSet=preparedStatement.executeQuery();
%>




 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
</script>
</head>
<body>
<div>
    <jsp:include page="header.jsp"/>
</div>
<br></br>
<div align="center" >
<table class="table table-striped table-bordered" style="width:40%">
<br></br>
<h3 >Department Wise Employee Salary</h3>
<br></br>
<tr><th>Department</th><th>Employee</th><th>Salary</th></tr>

<% while(resultSet.next()) 
{
 %>
	<tr>
	 <td><%=resultSet.getString(1)%></td>
	 <td><%=resultSet.getInt(2)%></td>
	 <td><%=resultSet.getInt(3)%></td>
	 </tr>            
                   
   <% 
 	
}
%></table>
</div>
</body>
</html>                       