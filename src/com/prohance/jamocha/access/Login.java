package com.prohance.jamocha.access;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {

       
	
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String uname=request.getParameter("uname");
		String pass=request.getParameter("pass");
		if(uname.equalsIgnoreCase("admin")&&pass.equalsIgnoreCase("admin"))
		{
			HttpSession session=request.getSession();
			session.setAttribute("username", uname);
			response.sendRedirect("Welcome.jsp")	;
		}
		else
		{
			
			PrintWriter  printWriter=response.getWriter();
		
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("LoginErr.html");
			requestDispatcher.include(request, response);
			
				
		}
	}//end of doPost method
}//end of class
