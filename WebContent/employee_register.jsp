<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@page import="com.prohance.jamocha.db.DBConnection"  %> 
<%

Connection con=DBConnection.getCon();
PreparedStatement ps=con.prepareStatement("SELECT NAME FROM DEPARTMENT ORDER BY NAME ASC");
ResultSet rs=ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale-1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script type="text/javascript">
		function val(){
			var java=document.getElementById('java').checked;

			var spring=document.getElementById('spring').checked;
			var struts=document.getElementById('struts').checked;
			var hibernet=document.getElementById('hibernet').checked;
			var mybaits=document.getElementById('mybaits').checked;
			if(java==false && spring==false && struts==false && hibernet==false && mybaits==false)
			{
			alert('plese select atleast one skill');
			return false;
			}
			else
			{
			return true;
			}
			}
</script>	
<title>Empolyee</title>
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
</head>
<body>
	<%
    			   response.setHeader("cache-control ", "no-cache,no-store,must-revalidate");
    				if(session.getAttribute("username")==null)
    				{
    					response.sendRedirect("login.html");
    				}
    			%>
 <% %>
 <div align="center">
  <form onsubmit="return val();" action="employeeRegServlet" method="post">
     	<div class="col-md-8 order-md-1">
      		<h4 class="mb-3">Employee Details</h4>
      		
   			     <div class="row">
          				<div class="col-md-6 mb-3">
            					<label for="firstName">First name *</label>
            					<input type="text" class="form-control" id="fname" name="fname" placeholder="First Name" required  >
            					<div class="invalid-feedback">
              					Valid first name is required.
            					</div>
          				</div>
          					<div class="col-md-6 mb-3">
            				<label for="lastName">Last name </label>
            				<input type="text" class="form-control" id="lname" name="lname" placeholder="Last Name"  >
            				</div>
        		</div>

        					<div class="mb-3">
            						<label for="employee id">Employee Id</label>
            						<input type="text" class="form-control" id="eid" name="eid" placeholder="Employee Id" required >
         					</div>
							<div class="mb-3">
          							<label for="email">Email Id *<span class="text-muted"></span></label>
          							<input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required >
          							<div class="invalid-feedback">
            						Please enter a valid email address 
          							</div>
          					</div>

        <div class="mb-3">
            <label for="employee id">Designation *</label>
            <input type="text" class="form-control" id="dsg" name="dsg" placeholder="Designation" required>
            <div class="invalid-feedback">
              Please enter Desgination.
            </div>
          </div>
          
        <hr class="mb-4" >
        	<h4 class="mb-3">Skill Set *</h4>
        	
        		<div class="custom-control custom-checkbox " >
          			<input type="checkbox" class="custom-control-input" id="java" value="java" name="skill_set" >
          			<label class="custom-control-label" for="java">Java</label>
        		</div>
        		
        		<div class="custom-control custom-checkbox">
          			<input type="checkbox" class="custom-control-input" id="spring"  value="spring" name="skill_set">
          			<label class="custom-control-label" for="spring">Spring</label>
        		</div>
        		
        		<div class="custom-control custom-checkbox">
            		<input type="checkbox" class="custom-control-input"  id="struts" value="struts" name="skill_set">
            		<label class="custom-control-label" for="struts">Struts</label>
          		</div>
          		
          		<div class="custom-control custom-checkbox">
              		<input type="checkbox" class="custom-control-input" id="hibernet" value="hibernet" name="skill_set">
              		<label class="custom-control-label" for="hibernet">HiberNet</label>
            	</div>
            	
            	<div class="custom-control custom-checkbox">
                	<input type="checkbox" class="custom-control-input" id="mybaits"  value="mybaits" name="skill_set">
                	<label class="custom-control-label" for="mybaits">MyBatis</label>
              	</div>
              	
        <hr class="mb-4">
			<h4 class="mb-3">Gender *</h4>

        
      
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
      
        	<div class="mb-3">
            		<label for="password">Password</label>
            		<input type="text" class="form-control" name="pass" id="pass" placeholder="Password" >
          	</div>
          	
          		<div class="mb-3">
             		 <label for="salary">Salary *</label>
              		<input type="number" class="form-control" id="sal" name="sal" placeholder="Salary" required >
              		
              		<div class="invalid-feedback">
                		Please enter Salary
              		</div>
            </div>

			
				<div class="col-md-5 mb-3">
					<label for="dept">Department</label> 
					<select class="custom-select d-block w-100" id="dept" name="dept" required>

						<%
							while (rs.next()) {
						%>
						<option value="<%=rs.getString("name")%>"><%=rs.getString("name")%></option>
						<%
							}
						%>
					</select></div></div>
					
					<button type="submit" 
						class="btn btn-primary">Submit</button>
					<button class="btn btn-outline-success my-2 my-sm-0" type="reset">Reset</button>
					<a href="employee_data" class="btn btn-danger">Back</a>
					</form>
					</div>
</body>
</html>