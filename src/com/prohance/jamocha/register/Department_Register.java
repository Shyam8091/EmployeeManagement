package com.prohance.jamocha.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.prohance.jamocha.db.DBConnection;


public class Department_Register extends HttpServlet 
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
		String name=request.getParameter("name").toUpperCase();
		String description=request.getParameter("description");
		
		if(description=="") {
			description=" ";
		}
		String active=request.getParameter("active");
		if(active=="") {
			active=" ";
		}
		
		try {
			PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO DEPARTMENT VALUES(?,?,?)");
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, description);
			preparedStatement.setString(3, active);
			int k = preparedStatement.executeUpdate();
			if (k >= 0) 
			{
				printWriter.println("<h2 align='center' style='color:green'>successfully Data Inserted </h2>");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("department_register.jsp");
				requestDispatcher.include(request, response);
			}
		}//end of try
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

	
}
