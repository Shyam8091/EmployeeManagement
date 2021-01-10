package com.prohance.jamocha.details;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.prohance.jamocha.db.DBConnection;

@WebServlet("/Department_Data")
public class Department_Details extends HttpServlet 
	{
		public ArrayList arraylist;
		public Connection con;
			@Override
			public void init() throws ServletException
			{
				con=DBConnection.getCon();
			}
			
			@Override
			protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				try
					{
					arraylist =new ArrayList();
						PreparedStatement ps=con.prepareStatement("SELECT * FROM DEPARTMENT");
						ResultSet rs=ps.executeQuery();
						while(rs.next()) 
						{
								Department_Bean eb=new Department_Bean();
								eb.setName(rs.getString(1));
								eb.setDescription(rs.getString(2));
								eb.setActive(rs.getString(3));
								arraylist.add(eb);
						}//end of while
					
					request.setAttribute("departmentlist",arraylist);
					RequestDispatcher rd = request.getRequestDispatcher("department_result.jsp");
					rd.forward(request, response);
				}	//end of try
				catch(Exception e) 
				{
				e.printStackTrace();
				}
				
			}//end of doGet method
}//end of class



