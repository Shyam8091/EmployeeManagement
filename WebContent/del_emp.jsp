<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.util.*"%>
    <%@page import="com.prohance.jamocha.db.DBConnection"%>
    <%
	Connection con = DBConnection.getCon();
    String fname=request.getParameter("fname");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/javascript">
		function fun(){
			alert(" <%=fname%> Employee Data Deleted succesfully");
			document.getElementById("fm1").submit();
			}
		</script>
<body onload="fun()">
<%
		response.setHeader("cache-control ", "no-cache,no-store,must-revalidate");
		if (session.getAttribute("username") == null) {
			response.sendRedirect("login.html");
		}
	%>
	<% 
	String eid = request.getParameter("eid");
			String dept = request.getParameter("dept");
			PreparedStatement preparedStatement=con.prepareStatement("delete from employee where eid=? and dept=?");
			preparedStatement.setString(1,eid);
			preparedStatement.setString(2,dept);
			int k=	preparedStatement.executeUpdate();
			if(k>=0){
				%>
				
				<form id="fm1" action="employee_data" >
				</form>
				
				
			<% }
			%>
</body>
</html>