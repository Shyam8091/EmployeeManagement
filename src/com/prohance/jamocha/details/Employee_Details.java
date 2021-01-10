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
@WebServlet("/Employee_Data")
public class Employee_Details extends HttpServlet {
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
			PreparedStatement ps=con.prepareStatement("SELECT * FROM EMPLOYEE ORDER BY DEPT ASC");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) 
			{
				Employee_Bean eb=new Employee_Bean();
				eb.setFname(rs.getString(1));
				eb.setLname(rs.getString(2));
				eb.setEid(rs.getString(3));
				eb.setEmail(rs.getString(4));
				eb.setDsg(rs.getString(5));
				eb.setSkill(rs.getString(6));
				eb.setGender(rs.getString(7));
				eb.setPass(rs.getString(8));
				eb.setSal(rs.getInt(9));
				eb.setDept(rs.getString(10));
				arraylist.add(eb);
			}//end of while
			request.setAttribute("emplist",arraylist);
			RequestDispatcher rd = request.getRequestDispatcher("employee_result.jsp");
			rd.forward(request, response);
			
		}//end of try
		catch(Exception e) 
		{
		e.printStackTrace();
		}//end of catch
	}//end of doGet
}//end of class
