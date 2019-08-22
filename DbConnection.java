package com.inventory.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
	 
 static Connection connection;
	
public static Connection getConnection()
{
	 
 
	//String url="jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=test1";
	String url="jdbc:sqlserver://localhost:1433;DatabaseName=inventory";
	String userid="sa";
	String password="server";
	  try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver" );
		 
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	try {
		connection= DriverManager.getConnection(url,userid,password);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return connection;
}

}
