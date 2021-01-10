package com.prohance.jamocha.register;
import java.sql.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.StringJoiner;

import com.prohance.jamocha.db.DBConnection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Employee_Data_Edit")
public class Employee_Data_Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	public Connection con;
	@Override
	public void init() throws ServletException
	{
	   
		con=DBConnection.getCon();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		StringJoiner sj1=new StringJoiner(",");
		String fname=request.getParameter("fname");
		String lname = request.getParameter("lname");
		
		if (lname == "") {
			lname = " ";
		}
		String eid = request.getParameter("eid");
		String new_eid=request.getParameter("new_eid");
		String email = request.getParameter("email");
		String dsg = request.getParameter("dsg");
		String[] skill_set=request.getParameterValues("skill_set");
		
		for(int i=0;i<skill_set.length;i++) 
		{
			if(skill_set[i]!="") {
				sj1.add(skill_set[i]);	
			}
		}
		String skill=sj1.toString();
			
		String gender = request.getParameter("gender");
		String pass = request.getParameter("pass");
		if (pass == "") {
			pass = " ";
		}

		Integer sal = Integer.parseInt(request.getParameter("sal"));
		String dept = request.getParameter("dept");
		String new_dept = request.getParameter("new_dept");
		PrintWriter printWriter=response.getWriter();
		printWriter.println(eid);
		printWriter.println(new_eid);
		printWriter.println(dept);
		printWriter.println(new_dept);
		try {
			
			PreparedStatement preparedStatement = con.prepareStatement(
					"UPDATE EMPLOYEE SET FNAME=?,LNAME=?,EID=?,EMAIL=?,DSG=?,SKILL_SET=?,GENDER=?,PASS=?,SAL=?,DEPT=? WHERE EID='"+eid+"' AND DEPT='"+dept+"' ");

			preparedStatement.setString(1, fname);
			preparedStatement.setString(2, lname);
			preparedStatement.setString(3, new_eid);
			preparedStatement.setString(4, email);
			preparedStatement.setString(5, dsg);
			preparedStatement.setString(6, skill);
			preparedStatement.setString(7, gender);
			preparedStatement.setString(8, pass);
			preparedStatement.setInt(9, sal);
			preparedStatement.setString(10, new_dept);
	int k=preparedStatement.executeUpdate();
	if(k>=0){
		
		response.sendRedirect("employee_data");
		RequestDispatcher dispatcher = request.getRequestDispatcher("employee_data");
	}
			
			
		} catch (Exception e) {
			
			printWriter.println("hi");
		}
	}

	

}
