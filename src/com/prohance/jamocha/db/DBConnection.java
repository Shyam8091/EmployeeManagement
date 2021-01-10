package com.prohance.jamocha.db;
import java.sql.Connection;
import java.sql.DriverManager;
public class DBConnection 
	{
		private static Connection con;
		private DBConnection() 
		{
		}
		static
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","SCOTT","TIGER");
			}
			catch(Exception e) 
			{
				e.printStackTrace();
			}
		}//end of block
		public static Connection getCon() 
		{
			return con;
		}
}//end of class


