<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.inventory.util.ConvertToUrlToString"%>
<%@page import="com.inventory.bean.Inventory_Outbound_New"%>
<%@page import="com.inventory.bean.Inventory_Inbound_New"%>
<%@page import="java.util.List"%>
<%@page import="com.inventory.util.SplitingStringValues"%>
<html>
<head>

  

<title>OB REQUEST PRINT</title>
<meta name="generator" content="Web Page Maker (unregistered version)">
<style type="text/css">
/*----------Text Styles----------*/
.ws6 {font-size: 8px;}
.ws7 {font-size: 9.3px;}
.ws8 {font-size: 11px;}
.ws9 {font-size: 12px;}
.ws10 {font-size: 13px;}
.ws11 {font-size: 15px;}
.ws12 {font-size: 16px;}
.ws14 {font-size: 19px;}
.ws16 {font-size: 21px;}
.ws18 {font-size: 24px;}
.ws20 {font-size: 27px;}
.ws22 {font-size: 29px;}
.ws24 {font-size: 32px;}
.ws26 {font-size: 35px;}
.ws28 {font-size: 37px;}
.ws36 {font-size: 48px;}
.ws48 {font-size: 64px;}
.ws72 {font-size: 96px;}
.wpmd {font-size: 13px;font-family: Arial,Helvetica,Sans-Serif;font-style: normal;font-weight: normal;}
/*----------Para Styles----------*/
DIV,UL,OL /* Left */
{
 margin-top: 0px;
 margin-bottom: 0px;
}

table { border-collapse: collapse; border: 1px solid #ccc;


 }
 
 table.fixed { table-layout:fixed; }
table.fixed td { overflow: hidden; } 
</style>

</head>
<body onload="window.print();">

<%!

String invoiceDate="";
String poNumber="";
String dcNumber="";
String companyName="";

%>

 <%
 

 List<Inventory_Outbound_New> list = (List)session.getAttribute("display_single_ob");
 System.out.println(list.size());
 

%>

  
<%
String itemDetails="";
for(Inventory_Outbound_New req:list)
{ 
		
	
	%>


 
     
     


 
 


  <%
  
  invoiceDate=req.getDelivery_date_string(); 
  dcNumber=req.getOutbound_invoice_number(); 
  poNumber=req.getOutbound_po(); 
  companyName=req.getCompanyName();
  
  
  %>

  
 
 
  
 


   
 
 

   
   
   
  <%itemDetails=req.getItem_details_added_to_Export(); %> 
 
 
 
  <%} %>


 

 











<div id="shape1" style="position:absolute; overflow:hidden; left:73px; top:30px; width:659px; height:106px; z-index:0"><img border=0 width="100%" height="100%" alt="" src="file:///C:/Users/pravin/AppData/Local/Temp/Web Page Maker/doc2R0RP/shapeAE724.gif"></div>

<div id="shape2" style="position:absolute; overflow:hidden; left:73px; top:135px; width:659px; height:180px; z-index:1"><img border=0 width="100%" height="100%" alt="" src="file:///C:/Users/pravin/AppData/Local/Temp/Web Page Maker/doc2R0RP/shapeB69TI.gif"></div>

<div id="text1" style="position:absolute; overflow:hidden; left:450px; top:43px; width:404px; height:90px; z-index:2">
<div class="wpmd">
<div><font color="#000000"><B>Securax Tech Solutions Indai Pvt.Ltd</B></font></div>
<div><font color="#000000">#35,1st and 2nd Floor, Vinayas Arcade</font></div>
<div><font color="#000000">11th main,5th Block, Jayanagar,</font></div>
<div><font color="#000000">Bangalore-560041</font></div>
<div><font color="#000000">Email:info@securax.in</font></div>
<div><font color="#000000">+91 80 41207000</font></div>
<div><font color="#000000"><B><BR></B></font></div>
</div></div>

<div id="text2" style="position:absolute; overflow:hidden; left:318px; top:143px; width:150px; height:23px; z-index:3">
<div class="wpmd">
<div><B>DELIVERY CHALLAN</B></div>
</div></div>

<div id="text3" style="position:absolute; overflow:hidden; left:491px; top:216px; width:254px; height:111px; z-index:4">
<div class="wpmd">
<div>DC NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : <%=dcNumber%></div>
<div>Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :<%=invoiceDate %> </div>
<div>PO NO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;<%=poNumber %></div>
<%-- <div>PO Date&nbsp;&nbsp;&nbsp; : <%=invoiceDate %></div> --%>
</div></div>

<div id="text4" style="position:absolute; overflow:hidden; left:93px; top:179px; width:254px; height:194px; z-index:5">
<div class="wpmd">
<div>To,</div>
<!-- <div><B><BR></B></div>
<div><B>PRAMA HIKVISION INDIA PVT,Ltd</B></div>
<div>#35,1st and 2nd Floor,</div>
<div>Vinayas Arcade,11 th main,</div>
<div>Bhasveswar nagar Bangalore-560041</div>
<div>9741568587/8105453205</div> -->

<br></br>
<%=companyName %>
</div></div>

<!--[if IE]><div id="table1" style="position:absolute; overflow:hidden; left:70px; top:313px; width:661px; height:463px; z-index:6; border:#000000 1px solid"><![endif]-->
<!--[if !IE]>--><div id="table1" style="position:absolute; overflow:hidden; left:70px; top:313px; width:659px; height:461px; z-index:6; border:#000000 1px solid"><!--<![endif]-->

<div class="wpmd">
<div >
<TABLE style="width:659px;position: absolute;border: 0px;" class="search-table">
 
<TR style="border-bottom: 1px;border-bottom-style: solid;height: 30px;font-weight: bold;">
<TD  ><div class="wpmd">
<div>SL NO</div>
</div>
</TD>
<TD  height="auto" style="position: relative;left: 80px;width: 496px" ><div class="wpmd">
<div>DESCRIPTION</div>
</div>
</TD>
<TD ><div class="wpmd">
<div>Units</div>
</div>
</TD>
<TD width=55><div class="wpmd">
<div>Quantity</div>
</div>
</TD>
</TR>
</TABLE>
<TABLE  style="width:659px;position: relative;border: 0px;top:40px;" class="search-table" >
 


<%

 

SplitingStringValues s1=new SplitingStringValues();
List<String> itemList=s1.getItemNameSerialNamesAndQuantity(itemDetails);
Integer totalQuantity=0;

%>

 

    
<%
int count=0;

for(String item_details_of_ob:itemList)
{
	count++;
	 
		String SingleItemValues[]=item_details_of_ob.split(":");
		String itemName=SingleItemValues[0];
		String itemQuantity=SingleItemValues[1];
		String itemSerialNumbers=SingleItemValues[2];
		if(itemSerialNumbers.contains("NO"))
		{
			itemSerialNumbers="";
		}
		
	
	%>



 <tr height="auto" >
     
     
  <td width="50px" align="center">
  
 <%=count %>
  </td>
  

   <td width="496px" height="auto" style="font-weight: bold;">
  
  &nbsp;<%=itemName%>
 
  <br>
  <span style="font-weight:normal;">
 &nbsp;<%=itemSerialNumbers.trim()%>  
  </span>
  </td>
  
<td >
  
  PCS
  </td>
 

  <td  >
  <%=itemQuantity %>
  <%
  totalQuantity=totalQuantity+Integer.parseInt(itemQuantity);
 // System.out.println("totalQuantity : "+totalQuantity);
  %>
  </td>
  
 
 


 
   
 
 
 

 </tr>
  
 <tr><td>&nbsp;</td></tr>  
 
   
   
   
   
 
 
 
  <%} %>
 
</TABLE>
</div>
</div></div>

<div id="shape3" style="position:absolute; overflow:hidden; left:69px; top:779px; width:663px; height:161px; z-index:7"><img border=0 width="100%" height="100%" alt="" src="file:///C:/Users/pravin/AppData/Local/Temp/Web Page Maker/doc2R0RP/shapeLEMR2.gif"></div>

<div id="text5" style="position:absolute; overflow:hidden; left:75px; top:789px; width:509px; height:144px; z-index:8">
<div class="wpmd">
<div><font class="ws8">1. Goods once sold will not be taken back or exchanged</font></div>
<div><font class="ws8">2. Kindly note that any complaints regarding physical condition of goods must be notify at our admin</font></div>
<div><font class="ws8">&nbsp; office exactly at the time of delivery itself via phone call or Email</font></div>
<div><font class="ws8">3. Please recive above items in good order and condition and return duplicate copy duly signed thereafter</font></div>
</div></div>

<div id="shape4" style="position:absolute; overflow:hidden; left:585px; top:780px; width:146px; height:160px; z-index:9"><img border=0 width="100%" height="100%" alt="" src="file:///C:/Users/pravin/AppData/Local/Temp/Web Page Maker/doc2R0RP/shape04OJQ.gif"></div>

<div id="text6" style="position:absolute; overflow:hidden; left:621px; top:870px; width:76px; height:29px; z-index:10">
<div class="wpmd">
<div><font class="ws8"><I>Received By</I></font></div>
</div></div>
<div id="slline" style="position:absolute; left:120px; top:320px; width:0px; height:455px;border-color: red;border:1px;border-style: solid;"></div>
<div id="descriptionline" style="position:absolute; left:617px; top:314px; width:0px; height:402px;border-color: red;border:1px;border-style: solid;"></div>
<div id="unitline" style="position:absolute; left:666px; top:314px; width:0px; height:402px;border-color: red;border:1px;border-style: solid;"></div>
<div id="TotalLine" style="position:absolute; left:120px; top:716px; width:610px; height:0px;border-color: red;border:1px;border-style: solid;"></div>
<div id="TotalText" style="position:absolute; left:560px; top:730px; width:110px; height:44px;">Total</div>
<div id="TotalQuantity" style="position:absolute; left:690px; top:730px; width:66px; height:44px;"><%=totalQuantity %></div>

<div id="Logo" style="position:absolute; left:84px; top:44px; width:192px; height:84px;">
<img alt="" src="img/securax.png">
</div>
 
 
</body>
</html>
