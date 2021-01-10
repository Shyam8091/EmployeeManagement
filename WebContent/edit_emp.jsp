<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.prohance.jamocha.db.DBConnection"%>
<%@page import="com.prohance.jamocha.details.*"%>
<%
	Connection con = DBConnection.getCon();
%>
<%


PreparedStatement ps=con.prepareStatement("SELECT NAME FROM DEPARTMENT ORDER BY NAME ASC");
ResultSet rs=ps.executeQuery();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
		
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<title>Edit Details</title>
</head>
<style>
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
		font-family: Arial, sans-serif;
		text-shadow: rosybrown 2px 2px;
	}

	</style>
<body>
	<%
		response.setHeader("cache-control ", "no-cache,no-store,must-revalidate");
		if (session.getAttribute("username") == null) {
			response.sendRedirect("login.html");
		}
	%>
	
     <div align="center">
	
	
		
		
	
	
	
	
	<form  id="fm" onsubmit="fun()"method="get"  action="employeeEditServlet" >
		<%
		PrintWriter pw = response.getWriter();
			Statement stm = con.createStatement();
			String eid = request.getParameter("eid");
			String fname=request.getParameter("fname");
			String dept = request.getParameter("dept");
			ResultSet resultSet = stm.executeQuery("SELECT * FROM EMPLOYEE WHERE EID='" + eid + "' AND DEPT='" + dept + "' ");
			
			while (resultSet.next()) {
		%>
		<input type="hidden" name="eid"
			value='<%=resultSet.getString("eid")%>' />
		<input type="hidden" name="dept"
			value='<%=resultSet.getString("dept")%>' />	
		<div class="form-group">
		<div>
		<h4>Edit Employee Details</h4>
		</div>
			<div class="col-md-6 mb-3">
				<label>First Name</label> <input type="text" class="form-control"
					name="fname" value='<%=resultSet.getString("fname")%>' required/>
					
			</div>
		</div>
		<div class="col-md-6 mb-3">
			<label>Last Name</label> <input type="text" class="form-control"
				name="lname" value='<%=resultSet.getString("lname")%>' />
		</div>

		<div class="col-md-6 mb-3">
			<label>Employee ID</label> <input type="text" class="form-control"
				name="new_eid" value='<%=resultSet.getString("eid")%>' required/>
		</div>

		<div class="col-md-6 mb-3">
			<label>Email</label> <input type="text" class="form-control"
				name="email" value='<%=resultSet.getString("email")%>' required/>
		</div>

		<div class="col-md-6 mb-3">
			<label>Designation</label> <input type="text" class="form-control"
				name="dsg" value='<%=resultSet.getString("dsg")%>' />
		</div>

		<div class="col-md-6 mb-3">
			<label>Skill Set</label> <input type="text" class="form-control"
				name="skill_set" value=' <%=resultSet.getString("skill_set")%>' />
				</div>
				<div class="custom-control custom-checkbox " >
          			<input type="checkbox" class="custom-control-input" id="java" value="java" name="skill_set" >
          			<label class="custom-control-label" for="java"  >Java</label>
        		</div>
        		
        		<div class="custom-control custom-checkbox">
          			<input type="checkbox" class="custom-control-input" id="spring"  value="spring" name="skill_set" >
          			<label class="custom-control-label" for="spring" >Spring</label>
        		</div>
        		
        		<div class="custom-control custom-checkbox">
            		<input type="checkbox" class="custom-control-input"  id="struts" value="struts" name="skill_set" >
            		<label class="custom-control-label" for="struts">Struts</label>
          		</div>
          		
          		<div class="custom-control custom-checkbox">
              		<input type="checkbox" class="custom-control-input" id="hibernet" value="hibernet" name="skill_set" >
              		<label class="custom-control-label" for="hibernet" >HiberNet</label>
            	</div>
            	
            	<div class="custom-control custom-checkbox">
                	<input type="checkbox" class="custom-control-input" id="mybaits"  value="mybaits" name="skill_set" >
                	<label class="custom-control-label" for="mybaits" >MyBatis</label>
              	</div>
		

		<div class="col-md-6 mb-3">
			<label>Gender</label> <input type="text" class="form-control"
				name="gender" value='<%=resultSet.getString("gender")%>' />
				<div class="col-md-6">
          		<label class="radio">Male   
  					<input type="radio" checked="checked" name="gender" value="male">
  					<span class="checkround"></span>
				</label>
				<label class="radio">Female   
  					<input type="radio" name="gender" value="female">
  					<span class="checkround"></span>
				</label>
          </div>
		</div>

		<div class="col-md-6 mb-3">
				<label>Password</label> <input type="text" class="form-control"
											   name="pass" value='<%=resultSet.getString("pass")%>' />

		</div>

		<div class="col-md-6 mb-3">
			<label>Salary</label> <input type="text" class="form-control"
				name="sal" value='<%=resultSet.getInt("sal")%>' required/>
		</div>

		
				<div class="col-md-6 mb-3">
					<label for="dept">Department</label> <select
						class="custom-select d-block w-100" id="dept"  name="new_dept" required>
						<option value='<%=resultSet.getString("dept")%>'><%=resultSet.getString("dept")%></option>
						<%
							while (rs.next()) {
						%>
						
						<option value="<%=rs.getString("name")%>"><%=rs.getString("name")%></option>
						<%
							}
						%>
					</select>
					</div>
					
					
		
					
		<%
			}
		%>
		
		
		
		<button type="submit" class="btn btn-success">Update</button>
		<a href="employee_data" class="btn btn-danger">Back</a>
	</form>
	 </div>
	<script type="text/javascript">
		function fun(){
			alert(" <%=fname%> Employee  Data Changed succesfully");
			
			}
		</script>
</body>
</html>



