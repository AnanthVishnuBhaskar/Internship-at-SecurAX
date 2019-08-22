<%@page import="java.util.ArrayList"%>
<%@page import="com.inventory.bean.Inventory_Item_Names"%>
<%@page import="com.inventory.util.DbConnection"%>
<%@ page import="java.sql.*"%>

	<%
	String itemQuantity=null;
	String itemSerialNuber=null;
	String itemSerialNuberId=null;
	String itemName=null;
	String itemType=null;
	Connection con=DbConnection.getConnection();
	String s=request.getParameter("val");
	
	String replaceAndPlus=s.replaceAll("AND", "&");
	replaceAndPlus=replaceAndPlus.replaceAll("PLUS", "+");
	 System.out.println("replaceAndPlus : "+replaceAndPlus);
	if(s==null || s.equals(""))
	{
	
	
	}else
	{
	 
//	Integer id=Integer.parseInt(s);
	try
	{
		ArrayList<String> list=new ArrayList();
		String totalSerialNumber="";
		String totalSerialNumberId="";
		itemQuantity=null;
		 
		  String sql="select ITEM_QUANTITY,NEED_SERIAL_NUMBER from INVENTORY_ITEM_NAMES where ITEM_NAME=?";
		  PreparedStatement stmt=con.prepareStatement(sql);
		  stmt.setString(1, replaceAndPlus);
		  System.out.println("itemName : "+replaceAndPlus);
		  ResultSet res=stmt.executeQuery();
		  if(res.next())
		  {
			  itemQuantity=res.getString("ITEM_QUANTITY").trim();
			  itemName=res.getString("NEED_SERIAL_NUMBER").trim();
			  //itemType=res.getString("ITEM_TYPE"); 
			
			%>
			 <h3><%=itemQuantity%></h3>
			 <h4><%=itemName%></h4>
			 <%-- <p><%=itemType%></p> --%>
			  
			   
            
		<%  }
		  
		  else
		  {
			 %>  
	<%	  }
		  
		  int count=0;
		  String sql2="select ITEM_ID,ITEM_SERIAL_NUMBER from INVENTORY_ITEM_DETAILS where ITEM_NAME=?";
		  PreparedStatement stmt2=con.prepareStatement(sql2);
		  stmt2.setString(1, replaceAndPlus);
		  ResultSet res2=stmt2.executeQuery();
		  while(res2.next())
		  {
			  itemSerialNuber=res2.getString("ITEM_SERIAL_NUMBER");
			  itemSerialNuberId=res2.getString("ITEM_ID");
			 /*  itemName=res.getString("ITEM_NAME");
			  itemType=res.getString("ITEM_TYPE"); */
			  //itemSerialNuber="@@@"+itemSerialNuber;
			  list.add(itemSerialNuberId+":::"+itemSerialNuber);
			   
			%>
			 
			  
			  
			   
            
		<%  }
		  
		  int i=0;
	for(String serialNumber :list)
	{
		i++;
		if(i==1)
		{
			totalSerialNumber=totalSerialNumber.trim()+serialNumber;
		}
		else
		{
			totalSerialNumber=totalSerialNumber.trim()+"@@@"+serialNumber;
		}
		
	}
		  %>
		   
		   
		   
		  <p><%=totalSerialNumber%></p>
		  <%session.setAttribute("serialNuberAndQuantity", totalSerialNumber); %>
		 <% 
		  
	}catch(Exception e)
	{
		  System.out.println(e);
	}
	}
%>