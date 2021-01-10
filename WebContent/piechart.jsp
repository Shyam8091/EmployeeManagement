<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
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
PreparedStatement ps=con.prepareStatement("SELECT DEPT,COUNT(*) AS COUNT FROM EMPLOYEE GROUP BY DEPT");
ResultSet rs=ps.executeQuery();


Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
while(rs.next()) 
{

map = new HashMap<Object,Object>();
map.put("label", rs.getString(1)); 
map.put("y", rs.getInt(2)); 
map.put("exploded", true);
list.add(map);
}
String dataPoints = gsonObj.toJson(list);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	animationEnabled: true,
	exportFileName: "New Year Resolutions",
	exportEnabled: true,
	title:{
		text: "Department wise employee"
	},
	data: [{
		type: "pie",
		showInLegend: true,
		legendText: "{label}",
		toolTipContent: "{label}: <strong>{y}%</strong>",
		indexLabel: "{label} {y}%",
		dataPoints : <%out.print(dataPoints);%>
	}]
});
 
chart.render();
 
}
</script>
</head>
<body>
<div>
    <jsp:include page="header.jsp"/>
</div>
<br><br><br>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>                              