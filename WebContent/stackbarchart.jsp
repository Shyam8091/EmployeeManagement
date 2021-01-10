<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
PreparedStatement ps1=con.prepareStatement("select dept,skill_set as skill from employee order by dept asc;  ");
ResultSet rs1=ps1.executeQuery();



Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 while(rs1.next()){
map = new HashMap<Object,Object>();
map.put("label", rs1.getString(1));
map.put("y", 73884);
list.add(map);

 }
String dataPoints1 = gsonObj.toJson(list);
 
list = new ArrayList<Map<Object,Object>>();
map = new HashMap<Object,Object>();
map.put("label", "Nigeria");
map.put("y", 106676);
list.add(map);
String dataPoints2 = gsonObj.toJson(list);
 
list = new ArrayList<Map<Object,Object>>();
map = new HashMap<Object,Object>();
map.put("label", "Nigeria");
map.put("y", 226634);
list.add(map);
 
String dataPoints3 = gsonObj.toJson(list);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	title: {
		text: "GDP by Sectors - 2015"
	},
	subtitles: [{
		text: "in Million Dollars"
	}],
	toolTip: {
		shared: true
	},
	data: [{
		type: "stackedBar100",
		name: "Agricultural Sector",
		showInLegend: true,
		yValueFormatString: "$#,##0 mn",
		dataPoints: <%out.print(dataPoints1);%>
	},
	{
		type: "stackedBar100",
		name: "Industrial Sector",
		showInLegend: true,
		yValueFormatString: "$#,##0 mn",
		dataPoints: <%out.print(dataPoints2);%>
	},
	{
		type: "stackedBar100",
		name: "Service Sector",
		showInLegend: true,
		yValueFormatString: "$#,##0 mn",
		dataPoints: <%out.print(dataPoints3);%>
	}]
});
chart.render();
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 70%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>                       