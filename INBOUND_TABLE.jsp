<%@page import="com.inventory.dao.InboundNewDao"%>
<%@page import="com.inventory.bean.Inventory_Inbound_New"%>
<%@page import="com.inventory.util.SplitingStringValues"%>
<%@page import="com.inventory.dao.OutboundNewDao"%>
<%@page import="com.inventory.bean.Inventory_Outbound_New"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="jquery/jtable.css">
<link rel="stylesheet" href="jquery/jtable.css">
<link rel="stylesheet" href="jquery/jtable2.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body onload="tableToExcel('dataTable', 'OUTBOND_REQUEST')" >

<script type="text/javascript">
 
var tableToExcel = (function() {
  var uri = 'data:application/vnd.ms-excel;base64,'
    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
    , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
    , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
  return function(table, name) {
    if (!table.nodeType) table = document.getElementById(table)
    var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
    window.location.href = uri + base64(format(template, ctx))
  }
})()
</script>


 

<%
InboundNewDao inboundNewDao=new InboundNewDao();
 


List<Inventory_Inbound_New> list = inboundNewDao.getAllIBRequest();

 


%>
<%!
String itemName="";
String itemQuantity="";
String itemSerialNumbers="";
    
    
    %>
<!-- <input type="button" onclick="tableToExcel('dataTable', 'OUTBOND_REQUEST')" value="Export to Excel"> -->
 <table id="dataTable"   class="table table-striped table-bordered" id="example">
    
 <thead>
            <tr style="font-weight: bold;">
   
      <td>SL NUMBER
    </td>
      <td>INVOICE NUMBER
    </td>
    <td>INVOICE DATE
    </td>
    <td>RECIEVED DATE
    </td>
    
     <td>PO
    </td>
     <td>COMPANY NAME
    </td>
     
     <td>INVOICE AMOUNT
    </td>
     
      <td>ITEM NAME
    </td>
      <td>QUANTITY
    </td>
       <td>DESCRIPTION
    </td>
    
       <td>REMARK
    </td>
     <td>TRANSPORTER
    </td>
    
    </tr></thead>
     
    <tbody> 
    
    
 <%
 
 int countSl=0;
 
 for(Inventory_Inbound_New req:list)
 {
	 
	 countSl++;
	%> 
 
    
    <tr style="font-weight: bold;">
   
      <td width="200px">
 
<%=countSl %>
 
	 
	 

 </td>
  <td width="200px">
   
 
  
  
  <%=req.getInbound_invoice_number() %>
  
  </td>
   <td width="200px"> 
    <%=req.getInvoice_date_string() %>

   
   </td>
   <td width="200px"> 
    <%=req.getRecieve_date_string() %>

   
   </td>
  <td width="200px"> 
    <%=req.getInbound_po() %>
 </td>
  <td width="200px"> 
    <%=req.getIncharge() %>
 </td>
  <td width="200px"> 
    <%=req.getInvoice_amount() %>
 </td>
   
 <%
 
 int countItems=0;
 List<String> itemList=SplitingStringValues.getItemNameQuantityAndSerialName(req.getItem_details_added_to_inventory());
 for(String dataList:itemList)
 {
	 	String SingleItemValues[]=dataList.split(":");
		  		String itemName=SingleItemValues[0];
		  		String itemQuantity=SingleItemValues[1];
		  		String itemSerialNumbers=SingleItemValues[2];
		  		countItems++;
		  		
 
 %>
 
  
  
  <% if(countItems>1){
	  
	  %>
	<tr>   
	<td width="200px"> </td>
<td width="200px">
   
 
  
  
  <%=req.getInbound_invoice_number() %>
  
  </td>
   <td width="200px"> 
    <%=req.getInvoice_date_string() %>

   
   </td>
   <td width="200px"> 
    <%=req.getRecieve_date_string() %>

   
   </td>
  <td width="200px"> 
    <%=req.getInbound_po() %>
 </td>
  <td width="200px"> 
    <%=req.getIncharge() %>
 </td>
  <td width="200px"> 
    <%=req.getInvoice_amount() %>
 </td>
	
	<td width="200px"> 
  <%=itemName %></td>
  <td width="200px">
  <%=itemQuantity %> </td>
  <td width="200px"> 
  <%=itemSerialNumbers %></td>
 <td width="200px"> 
 </td>
   
 <td width="200px"> 
  <%=req.getVendor_or_transporter() %>
 </td>
	  </tr>
	  
	  <%
	  }
  else
  {
	%>  
	  <td width="200px"> 
	  <%=itemName %></td>
	  <td width="200px">
	  <%=itemQuantity %> </td>
	  <td width="200px"> 
	  <%=itemSerialNumbers %></td>
	  <td width="200px"> 
  <%=req.getRemark() %></td>
   <td width="200px"> 
  <%=req.getVendor_or_transporter() %>
 </td>
    </tr>
	  
	<%} %>  
	   
	  
	  
	  
 
  
  <%
 }
  
  %>
  
   
   
  <% }
 %> 
    </tbody>
    </table>
    <script type="text/javascript" src="jquery/jquery2.js"></script>
<script type="text/javascript" src="jquery/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="jquery/dataTables.bootstrap.min.js"></script>

</body>
</html>