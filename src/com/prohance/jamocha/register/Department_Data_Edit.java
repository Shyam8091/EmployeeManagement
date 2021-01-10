package com.prohance.jamocha.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.prohance.jamocha.db.DBConnection;


@WebServlet("/Department_Data_Edit")
public class Department_Data_Edit extends HttpServlet {

       
	public Connection con;
	@Override
	public void init() throws ServletException
	{
		con=DBConnection.getCon();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String name = request.getParameter("name").toUpperCase();
		String new_name=request.getParameter("new_name").toUpperCase();
		String description = request.getParameter("description");
		if(description=="")
		{
			description=" ";
		}
		String active = request.getParameter("active");
		if(active=="")
		{
			active=" ";
		}
		try {
			   PreparedStatement preparedStatement = con.prepareStatement(
					"UPDATE DEPARTMENT SET NAME=?,DESCRIPTION=?,ACTIVE=? WHERE NAME='"+name+"' ");

			
			preparedStatement.setString(1, new_name);
			preparedStatement.setString(2, description);
			preparedStatement.setString(3, active);
			
			int k=	preparedStatement.executeUpdate();
			if(k>=0){
				response.sendRedirect("department_data");
			RequestDispatcher dispatcher = request.getRequestDispatcher("department_data");
			}
					
		   
				} catch (Exception e) {
					
					
				}
		
	}


	

}
