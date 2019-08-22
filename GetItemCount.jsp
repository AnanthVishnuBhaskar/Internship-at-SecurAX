<%@page import="com.inventory.util.DbConnection"%>
<%@ page import="java.sql.*"%>

	<%
	String itemQuantity=null;
	String itemName=null;
	String itemType=null;
	Connection con=DbConnection.getConnection();
	String s=request.getParameter("val");
	if(s==null || s.trim().equals(""))
	{
	
	
	}else
	{
	 
//	Integer id=Integer.parseInt(s);
	try
	{
		itemQuantity=null;
	
		  String sql="select ITEM_QUANTITY,ITEM_NAME,ITEM_TYPE from INVENTORY_ITEMS where ITEM_ID=?";
		  PreparedStatement stmt=con.prepareStatement(sql);
		  stmt.setString(1, s);
		  ResultSet res=stmt.executeQuery();
		  if(res.next())
		  {
			  itemQuantity=res.getString("ITEM_QUANTITY");
			  itemName=res.getString("ITEM_NAME");
			  itemType=res.getString("ITEM_TYPE");
			 
			%>
			 <h3><%=itemQuantity%></h3>
			 <h4><%=itemName%></h4>
			 <p><%=itemType%></p>
			  
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