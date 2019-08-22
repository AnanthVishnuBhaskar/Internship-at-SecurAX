<%@page import="com.inventory.util.DbConnection"%>
<%@ page import="java.sql.*"%>

	<%
	String output=null;
	Connection con=DbConnection.getConnection();
	String s=request.getParameter("val");
	if(s==null || s.trim().equals(""))
	{
	
	
	}else
	{
	 
//	Integer id=Integer.parseInt(s);
	try
	{
		output=null;
	
		  String sql="select ITEM_ID from INVENTORY_ITEMS where ITEM_ID=?";
		  PreparedStatement stmt=con.prepareStatement(sql);
		  stmt.setString(1, s);
		  ResultSet res=stmt.executeQuery();
		  if(res.next())
		  {
			// output=res.getString("USER_ID");
			 
			%>
			 <h3 style="color: red;">Already Available</h3>
			  
		<%  }
		  
		  else
		  {
			 %> <h3 style="color: red;">Not</h3>
	<%	  }
		  
		  
		  
	}catch(Exception e)
	{
		  System.out.println(e);
	}
	}
%>