<%@page import="com.inventory.util.DbConnection"%>
<%@ page import="java.sql.*"%>

	<%
	 
	String invoiceNumber=null;
 
	Connection con=DbConnection.getConnection();
	String s=request.getParameter("val");
	if(s==null || s.trim().equals(""))
	{
	
	
	}else
	{
	 
//	Integer id=Integer.parseInt(s);
	try
	{
		 
	
		  String sql="select INDOUND_INVOICE_NUMBER from INVENTORY_NEW_INBOUND_REQUEST where INDOUND_INVOICE_NUMBER=?";
		  PreparedStatement stmt=con.prepareStatement(sql);
		  stmt.setString(1, s);
		  ResultSet res=stmt.executeQuery();
		  if(res.next())
		  {
			  invoiceNumber=res.getString("INDOUND_INVOICE_NUMBER");
			   
			 
			%>
			 <h3><%=invoiceNumber%></h3>
			  
			  
		<%  }
		  
		  else
		  {
			  
			 %> 
			 
			  
	<%	  }
		  
		  
		  
	}catch(Exception e)
	{
		  System.out.println(e);
	}
	}
%>