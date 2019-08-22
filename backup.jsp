 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.inventory.dao.InventoryDao"%>
<%@page import="com.inventory.bean.Inventory_Item"%>
<%@page import="java.util.List"%>
<html>
<head>
<style type="text/css">

.username
{
position: absolute;
left: 1150px;
top: 12px;
font-size: 20px;


}
.userImage
{
position: absolute;
left: 1100px;
top: 12px;

}
.navigationTable
{
position: absolute;
left: 3px;
top: 12px;
border:2px;
font-size: 20px;
background:#2C373C;
color: #FFFFFF;

}
.columnProperties
{

/* height: 40px;
width: 150px; */
}

.addItem
{

position: absolute;
height:1000px;
width: 1080px;
border: 1px;
border-style: solid;
border-color:#E4E4E4;
background: #F0F5F7;
top: 60px;
left: 252px;

}
a:visited 
{
   color: #FFFFFF;
   text-decoration: none;

}
a:link { color: #FFFFFF; 
text-decoration: none;
} 



</style>




<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
$(document).ready(function()
    
{
	   var a= 12;
	if(a==12)
	{
	        $("#a").slideDown('1000');
	
	}
});
</script>


















<script type="text/javascript">

function blockSpecialChar(e) 
{
    var k = e.keyCode;
    return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8   || (k >= 48 && k <= 57));
}

</script>


</head>
<body>

 <%
 String userid=session.getAttribute("userId").toString();
 
 %>

<div style="background: #F8F7F7;position: absolute;top: 0px;height: 60px;width: 100%;left: 0px;font-size: 26px" >
<br>
<div style="color:#54CAB0">SecurAX Inventory</div> 
<div class="username">Anand</div>
<div class="userImage"><img alt="" src="img/usericon.png" height="30px" width="30px">   </div>
</div>


<div style="position: absolute;height: 1000px;width: 250px;border: 1px;border-style: solid;background: #2C373C;top: 60px;left: 0px">
<div class="navigationTable">
<table cellpadding="10px"  >
<tr  >
<td><img alt="" src="img/hom.png" height="30px"> <a href="Home.jsp">Dashboard</a></td>

</tr>
<tr  >
<td><img alt="" src="img/hom.png" height="30px"><a href="user.jsp">Manage users</a></td>

</tr>

<tr >
<td><img alt="" src="img/hom.png" height="30px"> <a href="ManageItems.jsp">Manage item</a></td>

</tr>
<tr >
<td><img alt="" src="img/hom.png" height="30px"> <a href="AddItemType.jsp">Manage item type</a></td>

</tr>


</table>


</div>
</div>


<%
InventoryDao dao=new InventoryDao();
List<Inventory_Item> list=dao.getItemType();


%>


<!--Add item Process -->
<form action="Controller" method="post">
<div class="addItem">


<table cellpadding="20px" cellspacing="10px">

<tr>
		<td>
		Item ID : 
		</td>
		<td>
		<input type="text" name="item_id" onkeypress="return blockSpecialChar(event)"/>
		<input type="button" value="valdate">
		</td>
</tr>

<tr>
		<td>
		Item Name : 
		</td>
		<td>
		<input type="text" name="item_name">
		</td>
</tr>

<tr>
		<td>
		Item Type : 
		</td>
		<td>
		<select name="item_type">
		
		<% 
		
		for(Inventory_Item type:list)
		{
			%>
			
			
			<option value="<%=type.getITEM_TYPE()%>"><%=type.getITEM_TYPE()%></option>
			
			
		<% }
		%>
		
			  
			   
		</select>
		</td>
</tr>

<tr>
		<td>
		Item Quantity : 
		</td>
		<td>
		<input type="text" name="item_quantity">
		</td>
</tr>
<tr>
		<td>
		Item Price : 
		</td>
		<td>
		<input type="text" name="item_price">
		</td>
</tr>
<tr>
		<td>
		Item Description : 
		</td>
		<td>
		 <textarea rows="5" cols="20" name="item_description"></textarea>
		</td>
</tr>
<tr>
<td>

<input type="submit" value="ADD ITEM">
</td>
<td>

<input type="hidden" name="item_added_by" value="<%=userid%>">
<input type="hidden" name="request" value="addItem">
</td>
</tr>
</table>
</div>
 
  </form>
 
 
 



</body>
</html>