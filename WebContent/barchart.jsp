<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="java.sql.*" %>
 <%@page import="com.prohance.jamocha.db.DBConnection"  %>
 
 <%Integer java=0;%>
 <% Integer spring=0;%>
 <% Integer hibernate=0;%>
 <% Integer struts=0;%>
 <% Integer mybatis=0;%>
 <%
   
 Connection con=DBConnection.getCon();
 PreparedStatement ps1=con.prepareStatement("select skill_set as skill from employee  ");
 ResultSet rs1=ps1.executeQuery();
 
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
while(rs1.next()){
	String s=rs1.getString(1);
	if(s.contains("java")){java++;}
	if(s.contains("spring")){spring++;}
	if(s.contains("hibernet")){hibernate++;}
	if(s.contains("struts")){struts++;}
	if(s.contains("mybaits")){mybatis++;}
}
map = new HashMap<Object,Object>();
map.put("label", "java");
map.put("y", java); 
list.add(map);

map = new HashMap<Object,Object>();
map.put("label", "Spring");
map.put("y", spring); 
list.add(map);

map = new HashMap<Object,Object>();
map.put("label", "struts");
map.put("y",struts); 
list.add(map);

map = new HashMap<Object,Object>();
map.put("label", "Hibernate");
map.put("y", hibernate); 
list.add(map);

map = new HashMap<Object,Object>();
map.put("label", "mybatis");
map.put("y", mybatis); 
list.add(map);

String dataPoints = gsonObj.toJson(list);

%>
 
 
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	title: {
		text: "Skill Set View Bar Chart"
	},
	
	axisY: {
		title: "Number of Employee",
		labelFormatter: addSymbols
	},
	data: [{
		type: "bar",
		indexLabel: "{y}",
		indexLabelFontColor: "#444",
		indexLabelPlacement: "inside",
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();
function addSymbols(e) {
	var suffixes = ["", "K", "M", "B"];
 
	var order = Math.max(Math.floor(Math.log(e.value) / Math.log(1000)), 0);
	if(order > suffixes.length - 1)
	order = suffixes.length - 1;
 
	var suffix = suffixes[order];
	return CanvasJS.formatNumber(e.value / Math.pow(1000, order)) + suffix;
}
}
</script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
    <jsp:include page="header.jsp"/>
</div>
<br></br><br></br>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>