package com.prohance.jamocha.register;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.StringJoiner;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.prohance.jamocha.db.DBConnection;

public class Employee_Register extends  HttpServlet 
	{
		public Connection con;
		@Override
		public void init() throws ServletException
		{
			con=DBConnection.getCon();
		}
	   @Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{
		response.setContentType("text/html");
		PrintWriter printWriter=response.getWriter();
		StringJoiner sj1=new StringJoiner(",");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		if(lname=="") {
			lname=" ";
		}
		String eid=request.getParameter("eid");
		String email=request.getParameter("email");
		String dsg=request.getParameter("dsg");
		String gender=request.getParameter("gender");
		String pass=request.getParameter("pass");
		if(pass=="") {
			pass=" ";
		}
		Integer sal=Integer.parseInt(request.getParameter("sal"));
		String dept=request.getParameter("dept").toUpperCase();
		String[] skill_set=request.getParameterValues("skill_set"); 
		for(int i=0;i<skill_set.length;i++) 
		{
			sj1.add(skill_set[i]);
		}
		
	try {
			PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO EMPLOYEE VALUES(?,?,?,?,?,?,?,?,?,?)");
			preparedStatement.setString(1, fname);
			
			preparedStatement.setString(2, lname);
			preparedStatement.setString(3, eid);
			preparedStatement.setString(4, email);
			preparedStatement.setString(5, dsg);
			preparedStatement.setString(6, sj1.toString());
			preparedStatement.setString(7, gender);
			preparedStatement.setString(8, pass);
			preparedStatement.setInt(9, sal);
			preparedStatement.setString(10, dept);
			PreparedStatement preparedStatement2=con.prepareStatement("SELECT * FROM DEPARTMENT WHERE NAME=?");
			preparedStatement2.setString(1,dept);
			ResultSet  resultSet=preparedStatement2.executeQuery();
			PreparedStatement preparedStatement3=con.prepareStatement("SELECT * FROM EMPLOYEE WHERE DEPT=? AND EID=?");
			preparedStatement3.setString(1,dept);
			preparedStatement3.setString(2,eid);
			ResultSet  resultSet2=preparedStatement3.executeQuery();
			if(resultSet.next())
			{
					if (resultSet2.next())
					{
						printWriter.println("<h2 align='center' style='color:red'>Duplicate EID Please Register Again</h2>");
						RequestDispatcher requestDispatcher = request.getRequestDispatcher("employee_register.jsp");
						requestDispatcher.include(request, response);
					}
					else 
					{
						int k = preparedStatement.executeUpdate();
						if (k >= 0) 
						{
							printWriter.println("<h2 align='center' style='color:green'>successfully Data Inserted </h2>");
							RequestDispatcher requestDispatcher = request.getRequestDispatcher("employee_register.jsp");
							requestDispatcher.include(request, response);
						}
					}//end of inner if
			}	
			else 
			{
				printWriter.println("<h2 align='center' style='color:red'>'Department not found'</h2>");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("employee_register.jsp");
				requestDispatcher.include(request, response);
			}
		}//end of try
		
		catch (Exception e) 
		{
			e.printStackTrace();
		}//end of catch
		
		}//end of doPost method
	}//end of class
