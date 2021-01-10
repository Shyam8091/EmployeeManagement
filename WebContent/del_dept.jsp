<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
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
    
    Connection con=DBConnection.getCon();
	PreparedStatement preparedStatement1 = con.prepareStatement(" select d.name,e.eid from employee e ,department d where d.name=e.dept AND name='"+name+"' ");
	ResultSet resultSet=preparedStatement1.executeQuery();
	if(resultSet.next()) 
	{
		%>
		<html>
		<script type="text/javascript">
		function fun(){
			alert("Can Not Delete Department! Employee Data Found");
			document.getElementById("fm").submit();
			}
		</script>
		<body onload= "fun()">
		<form id="fm" action="department_data" >
		</form>
		</body >
		</html>
	<% 	
	}
	else
	{
		PreparedStatement preparedStatement=con.prepareStatement("delete from department where name='"+name+"' ");
		
		int k=preparedStatement.executeUpdate();
		 
		if(k>=0){%>
			<html>
		<script type="text/javascript">
		function fun1(){
			alert("<%=name%> Department Deleted Succesfully");
			document.getElementById("fm1").submit();
			}
		</script>
		<body onload= "fun1()">
		<form id="fm1" action="department_data" >
		</form>
		</body >
		</html>
		<% }
	}
%>
	

