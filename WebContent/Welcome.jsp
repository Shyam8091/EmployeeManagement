<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
PreparedStatement ps1=con.prepareStatement("SELECT DEPT,COUNT(*) AS COUNT FROM EMPLOYEE GROUP BY DEPT");
ResultSet rs1=ps1.executeQuery();


Gson gsonObj1 = new Gson();
Map<Object,Object> map1 = null;
List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();
while(rs1.next()) 
{

map1 = new HashMap<Object,Object>();
map1.put("label", rs1.getString(1)); 
map1.put("y", rs1.getInt(2)); 
map1.put("exploded", true);
list1.add(map1);
}
String dataPoints1 = gsonObj1.toJson(list1);
%>

<%//second barchart%>
 <%Integer java=0;%>
 <% Integer spring=0;%>
 <% Integer hibernate=0;%>
 <% Integer struts=0;%>
 <% Integer mybatis=0;%>
 <% PreparedStatement ps2=con.prepareStatement("select skill_set as skill from employee  ");
 ResultSet rs2=ps2.executeQuery();
 
Gson gsonObj2 = new Gson();
Map<Object,Object> map2 = null;
List<Map<Object,Object>> list2 = new ArrayList<Map<Object,Object>>();
while(rs2.next()){
	String s=rs2.getString(1);
	if(s.contains("java")){java++;}
	if(s.contains("spring")){spring++;}
	if(s.contains("hibernet")){hibernate++;}
	if(s.contains("struts")){struts++;}
	if(s.contains("mybaits")){mybatis++;}
}
map2 = new HashMap<Object,Object>();
map2.put("label", "java");
map2.put("y", java); 
list2.add(map2);

map2 = new HashMap<Object,Object>();
map2.put("label", "Spring");
map2.put("y", spring); 
list2.add(map2);

map2 = new HashMap<Object,Object>();
map2.put("label", "struts");
map2.put("y",struts); 
list2.add(map2);

map2 = new HashMap<Object,Object>();
map2.put("label", "Hibernate");
map2.put("y", hibernate); 
list2.add(map2);

map2 = new HashMap<Object,Object>();
map2.put("label", "mybatis");
map2.put("y", mybatis); 
list2.add(map2);

String dataPoints2 = gsonObj2.toJson(list2);

%>

<%//third tabular %>
<% PreparedStatement preparedStatement=con.prepareStatement("select d.name as Department,count(*) as Employee,sum(sal) as Salary from EMPLOYEE e,DEPARTMENT d where d.name = e.dept group by d.name order by d.name asc");
ResultSet resultSet=preparedStatement.executeQuery();%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript">
window.onload = function() { 
 
var chart1 = new CanvasJS.Chart("chartContainer1", {
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
		dataPoints : <%out.print(dataPoints1);%>
	}]
});
 
chart1.render();

var chart2 = new CanvasJS.Chart("chartContainer2", {
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
		dataPoints: <%out.print(dataPoints2);%>
	}]
});
chart2.render();
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<title>Insert title here</title>

</head>
<body>
<div>
    <jsp:include page="header.jsp"/>
</div>
<br><br><br><div id="wrap">
<div   class="first" id="chartContainer1" style="height: 270px; width: 50%; float:left;"></div>
<div   class="second" id="chartContainer2" style="height: 270px; width: 50%;float:right"></div>
</div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<div  align="center" id="table" style="bold;">

<table class="table table-striped table-bordered" style="width:50%">
<br></br><br></br><br></br>

<h3 >Department Wise Employee Salary</h3>
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