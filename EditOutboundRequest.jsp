<!DOCTYPE html>
<%@page import="com.inventory.dao.InventoryStatusDao"%>
<%@page import="com.inventory.bean.Inventory_Outbound"%>
<%@page import="com.inventory.dao.OutboundDao"%>
<%@page import="com.inventory.bean.Inventory_Inbound"%>
<%@page import="com.inventory.dao.InboundDao"%>
<%@page import="com.inventory.bean.Inventory_Status"%>
<%@page import="com.inventory.bean.Inventory_Item"%>
<%@page import="com.inventory.bean.Inventory_Users"%>
<%@page import="com.inventory.dao.InventoryDao"%>
<%@page import="com.inventory.dao.UserDao"%>
<%@page import="java.util.List"%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Inventory | Dashboard</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  
  <!-- Fot dataTable -->
  
   
<script type="text/javascript" src="jquery/jquery2.js"></script>
<script type="text/javascript" src="jquery/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="jquery/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="jquery/jtable.css">
<link rel="stylesheet" href="jquery/jtable.css">
<link rel="stylesheet" href="jquery/jtable2.css">
<style type="text/css">
.functionBar
{
	position: absolute;
	height:80px;
	width: auto;
	/* border: 1px;
	border-style: solid;
	border-color:#E4E4E4;
	background: #FFFFFF; */
	top: 80px;
	left: 280px;

}

.tableData
{

position: absolute;
height:auto;
width: auto;
border: 1px;
border-style: solid;
border-color:#E4E4E4;
background: #FFFFFF;
top: 150px;
left: 400px;

}

.columnProperties
{

/* height: 40px;
width: 150px; */
}

.functionBar
{
	position: absolute;
	height:80px;
	width: auto;
	/* border: 1px;
	border-style: solid;
	border-color:#E4E4E4;
	background: #FFFFFF; */
	top: 80px;
	left: 280px;

}
.tableData
{

position: absolute;
height:auto;
width: auto;
border: 1px;
border-style: solid;
border-color:#E4E4E4;
background: #FFFFFF;
top: 150px;
left: 400px;

}

 a:visited 
{
   color: #FFFFFF;
   text-decoration: none;

}
a:link { color: #FFFFFF; 
text-decoration: none;
} 




table { 
    border-spacing: 10px;
    border-collapse: separate;
}

td { 
    padding: 10px;
}

</style>





 
 
<script type="text/javascript">
/* 
 function call()
 {
	//alert(1);
    $('#userTable').DataTable();
 

 }
 */
 






 </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
 
	 
function sendInfo()
{
	  
	 var v=document.addItem.item_for_client.value;
		 
		//var v=document.getElementById("item_id").value ;
		//alert(v);
		 
		var url="GetItemCount.jsp?val="+v;
		 
		if(window.XMLHttpRequest){
		request=new XMLHttpRequest();
		}
		else if(window.ActiveXObject){
		request=new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		try
		{
		
			request.onreadystatechange=getInfo;
			request.open("GET",url,true);
			request.send();
			}
		catch(e)
		{
			alert("Unable to connect to server");
		}
	 
	 
}

function getInfo()
{
if(request.readyState==4)
{
	var str=request.responseText;
	
	var itemQuantity=str.substring(str.indexOf("<h3>")+4, str.lastIndexOf("</h3>")); 
	var itemName=str.substring(str.indexOf("<h4>")+4, str.lastIndexOf("</h4>")); 
	var itemType=str.substring(str.indexOf("<p>")+3, str.lastIndexOf("</p>")); 
	//alert(itemName);
 
	
	
	  
		 
		  // alert(1);
		 // $("#item_id").css("border-color", "red");
		 document.getElementById('item_quantity').value=itemQuantity;
		 document.getElementById('item_name').value=itemName;
		 document.getElementById('item_type').value=itemType;
		  
		  		
		 
 
}
 
	
}

/* function checkItemQuantity()
{
	 
	var maxValue=document.getElementById('item_quantity').value;
	 
	var quantityValueForClient=document.getElementById('quantity_for_client').value;
	
	 
	if(quantityValueForClient>maxValue)
	{
		alert('quantity cannot extend total quantity');
		document.getElementById('quantity_for_client').value=maxValue;
		return false;
	}
	
	var remaingQuantity=maxValue-quantityValueForClient;
	document.getElementById('remaining_quantity_in_item').value=remaingQuantity;
	//alert(document.getElementById('remaining_quantity_in_item').value);
return true;
	
}
 */
 


</script>

  
  
<script type="text/javascript"> 
 
function validateForm()
{
	var itemName=document.addItem.item_for_client.value;
	var quantityValueForClient=document.getElementById('quantity_for_client').value;
	var totalQuantity=document.getElementById('item_quantity').value;
 
		if(itemName=='Select')
		{
			 
			$('#item_for_client').css("border-color","red");
			document.getElementById('errfn').innerHTML="PLESE SELECT ITEM NAME";
			return false;
		
		}
		else
		{
			$('#item_for_client').css("border-color","#C8C8C8");
			document.getElementById('errfn').innerHTML=" ";
		}
		
		if(quantityValueForClient==0 || quantityValueForClient<0 || quantityValueForClient>totalQuantity)
		{
			 
			$('#quantity_for_client').css("border-color","red");
			document.getElementById('errfn').innerHTML="Quantity can't Be Zero or Cannot be Negative";
			
			if(quantityValueForClient>totalQuantity)
			{
				$('#quantity_for_client').css("border-color","red");
				document.getElementById('errfn').innerHTML="Quantity can't Be more than Total quantity";
				
			}
			
			return false;
		
		}
		else
		{
			$('#quantity_for_client').css("border-color","#C8C8C8");
			document.getElementById('errfn').innerHTML=" ";
		}
	
	
		var remaingQuantity=totalQuantity-quantityValueForClient;
		document.getElementById('remaining_quantity_in_item').value=remaingQuantity;
	 
	
 
	return true;
	
}

</script>
  
  
  
  
  
  
  
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="plugins/morris/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker-bs3.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
  <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>


<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>

 
<script src="dist/js/app.min.js"></script>

<script src="dist/js/demo.js"></script>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

 

<%

String userid=session.getAttribute("userId").toString();
String userName=session.getAttribute("userName").toString();
%>

<%!

int outBoundId=0;
String request=null;

%>
<%
OutboundDao dao=new OutboundDao();

List<Inventory_Outbound> list=(List)session.getAttribute("outbound_request_display_for_edit");

%>
 

<body class="hold-transition skin-blue sidebar-mini">


<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>SecurAx</b>&nbsp;&nbsp;&nbsp;&nbsp;Inventory</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
       
          <!-- Tasks: style can be found in dropdown.less -->
             
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="img/usericon.png" class="user-image" alt="User Image">
              <span class="hidden-xs" style="font-size: 16px;"><%=userName %></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="img/usericon.png" class="img-circle" alt="User Image">

                <p>
                 <%=userName %>
                  <small>Member since Nov. 2012</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="Logout.jsp" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li> -->
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="img/usericon.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p style="font-size: 16px;"><%=userName %></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Busy</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        
        <li class="active treeview">
         <!-- <a href="Home.jsp">
            <i class="fa fa-dashboard"></i> <span style="font-size: 16px;">Dashboard</span> <i class="fa fa-angle-left pull-right"></i>
          </a> -->
		  <!--
          <ul class="treeview-menu">
            <li class="active"><a href="index.html"><i class="fa fa-circle-o"></i> Dashboard v1</a></li>
            <li><a href="index2.html"><i class="fa fa-circle-o"></i> Dashboard v2</a></li>
          </ul> -->
        </li>
         <li>
          <a href="ManageItems.jsp">
            <i class="fa fa-th"></i> <span style="font-size: 16px;">Manage Item</span>
            <small class="label pull-right bg-green"></small>
          </a>
        </li>
        <li class="treeview">
           <a href="ManageItemType.jsp">
            <i class="fa fa-files-o"></i>
            <span style="font-size: 16px;">Manage ItemType</span>
            <span class="label label-primary pull-right"></span>
          </a>
		  <!--
          <ul class="treeview-menu">
            <li><a href="pages/layout/top-nav.html"><i class="fa fa-circle-o"></i> Top Navigation</a></li>
            <li><a href="pages/layout/boxed.html"><i class="fa fa-circle-o"></i> Boxed</a></li>
            <li><a href="pages/layout/fixed.html"><i class="fa fa-circle-o"></i> Fixed</a></li>
            <li><a href="pages/layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>
          </ul>
		  -->
        </li>
       
        <li class="treeview">
          <a href="ManageInventoryStatus.jsp">
            <i class="fa fa-pie-chart"></i>
            <span style="font-size: 16px;">Manage Inventory Status</span>
            <!-- <i class="fa fa-angle-left pull-right"></i> -->
          </a>
		  <!--
          <ul class="treeview-menu">
            <li><a href="pages/charts/chartjs.html"><i class="fa fa-circle-o"></i> ChartJS</a></li>
            <li><a href="pages/charts/morris.html"><i class="fa fa-circle-o"></i> Morris</a></li>
            <li><a href="pages/charts/flot.html"><i class="fa fa-circle-o"></i> Flot</a></li>
            <li><a href="pages/charts/inline.html"><i class="fa fa-circle-o"></i> Inline charts</a></li>
          </ul>-->
        </li>
        <li class="treeview">
          <a href="ManageUsers.jsp">
            <i class="fa fa-laptop"></i>
            <span style="font-size: 16px;">Manage Users</span>
            <!-- <i class="fa fa-angle-left pull-right"></i> -->
          </a>
		  <!--
          <ul class="treeview-menu">
            <li><a href="pages/UI/general.html"><i class="fa fa-circle-o"></i> General</a></li>
            <li><a href="pages/UI/icons.html"><i class="fa fa-circle-o"></i> Icons</a></li>
            <li><a href="pages/UI/buttons.html"><i class="fa fa-circle-o"></i> Buttons</a></li>
            <li><a href="pages/UI/sliders.html"><i class="fa fa-circle-o"></i> Sliders</a></li>
            <li><a href="pages/UI/timeline.html"><i class="fa fa-circle-o"></i> Timeline</a></li>
            <li><a href="pages/UI/modals.html"><i class="fa fa-circle-o"></i> Modals</a></li>
          </ul> -->
        </li>
        <li class="treeview">
           <a href="ManageUserStatus.jsp">
            <i class="fa fa-edit"></i> <span style="font-size: 16px;">Manage User Status</span>
          <!--   <i class="fa fa-angle-left pull-right"></i> -->
          </a><!--
          <ul class="treeview-menu">
            <li><a href="pages/forms/general.html"><i class="fa fa-circle-o"></i> General Elements</a></li>
            <li><a href="pages/forms/advanced.html"><i class="fa fa-circle-o"></i> Advanced Elements</a></li>
            <li><a href="pages/forms/editors.html"><i class="fa fa-circle-o"></i> Editors</a></li>
          </ul>-->
        </li>
       <li class="treeview">
           <a href="ManageInboundRequest.jsp">
            <i class="fa fa-files-o"></i>
            <span style="font-size: 16px;">Manage Inbound request</span>
            <span class="label label-primary pull-right"></span>
          </a>
      </li>
      
       <li class="treeview">
           <a href="ManageOutboundRequest.jsp">
            <i class="fa fa-files-o"></i>
            <span style="font-size: 16px;">Manage Outbound request</span>
            <span class="label label-primary pull-right"></span>
          </a>
      </li>
      
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       
        <small> </small>
      </h1>
      <ol class="breadcrumb">
        <!-- <li><a href="#"><i class="fa fa-dashboard" ></i> Home</a></li>
        <li class="active">Dashboard</li> -->
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
 
       
       
       
       <!--   <add table>   -->
       
       
       
         <form action="Controller" method="post" name="addItem" onsubmit="return validateForm()">
<div class="tableData">
 
<table  >
   <!--  
    <tr style="background-color: #F5F5F5;border: 1px;border-style: solid;border-color: #EDEDED;font-weight: bold;"height=50px>
    
      <td>User Data</td>
       <td> </td>
     <td> </td>
      
    </tr> -->
     
     <%

     InventoryStatusDao status=new InventoryStatusDao();
    List<Inventory_Status> list1=status.getAllOutBoundStatus();
    
    InventoryDao inventoryDao=new InventoryDao();
    List<Inventory_Item> itemList=inventoryDao.getAllItemList();
     
    
    InventoryDao dao1=new InventoryDao();
    List<Inventory_Item> list2=dao1.getItemType();

for(Inventory_Outbound requestId:list)
{
	 
	outBoundId=requestId.getOUTBOUND_ID();
	
	%>


 
     
     
 
 
 <tr height=50px style="border: 1px;border-style: solid;border-color: #EDEDED;font-weight: bold;">
<td width="200px">
  MODAL NAME : 
   
  </td>

  <td width="200px">
  <select name="item_for_client" class="inputs" required="required"    onchange="sendInfo()" id="item_for_client" onblur="validateForm();">
			<option value="Select">Select</option>
		<% 
	
		for(Inventory_Item type:itemList)
		{
			%>
			
			
			<option value="<%=type.getITEM_ID()%>"><%=type.getITEM_NAME()%></option>
			
			
		<% 
		
		
		//itemId=type.getITEM_ID();
		}
		%>
		
			  
			   
		</select>
  
  
  
  
  
  
  <%-- 
  <input type="text" name="item_for_client" value=" <%=requestId.getITEM_FOR_CLIENT()%>"> --%>
 
  </td>
  
 
 
 
 </tr>
 
 <tr height=50px style="border: 1px;border-style: solid;border-color: #EDEDED;font-weight: bold;">
<td width="200px">
OUTBOUND STATUS:
   
  </td>

  <td width="200px">
  
  <select name="outbound_status" class="inputs" required="required">
		
		<% 
		
		for(Inventory_Status type:list1)
		{
			%>
			
			
			<option value="<%=type.getSTATUS_NAME()%>"><%=type.getSTATUS_NAME()%></option>
			
			
		<% }
		%>
		
			  
			   
		</select>

  </td>
  
 
 
 
 </tr> 
 
 
<tr height=50px style="border: 1px;border-style: solid;border-color: #EDEDED;font-weight: bold;">
 <td width="200px">
 ITEM TYPE : 
   
  </td>

  <td width="200px">
  <%--  <select name="item_type" class="inputs" required="required">
		
		<% 
		
		for(Inventory_Item type:list2)
		{
			%>
			
			
			<option value="<%=type.getITEM_TYPE() %>"   ><%=type.getITEM_TYPE() %></option>
			
			
		<% }
		%>
</select> --%>
  <input type="text" name="item_type"  id="item_type" value=" <%=requestId.getITEM_TYPE()%>" readonly="readonly">
  <td>
  <input type="hidden" name="outbound_id"  id="outbound_id" value=" <%=requestId.getOUTBOUND_ID()%>">
 
  </td>
  
 
 
 
 </tr>
<tr height=50px style="border: 1px;border-style: solid;border-color: #EDEDED;font-weight: bold;">
 <td width="200px">
Quantity : 
   
  </td>

  <td width="200px">
  <input type="number" name="quantity_for_client"  id="quantity_for_client" value=" <%=requestId.getITEM_QTY()%>" required="required" onblur="validateForm()">
 
  </td>
  <td  >
		Total Count of Item
		</td>
		<td>
		<input type="number" name="item_quantity" class="inputs" required="required" readonly="readonly" id="item_quantity" >
		</td>
 
 
 
 </tr>
 
<tr height=50px style="border: 1px;border-style: solid;border-color: #EDEDED;font-weight: bold;">
 <td width="200px">
 Price : 
   
  </td>

  <td width="200px">
  <input type="number" name="item_price" value=" <%=requestId.getITEM_PRICE()%>" required="required">
 
  </td>
  
 
 
 
 </tr>
<tr height=50px style="border: 1px;border-style: solid;border-color: #EDEDED;font-weight: bold;">
 <td width="200px">
 Serial Number 
   
  </td>

  <td width="200px">
  <input type="text" name="item_serial_number" value=" <%=requestId.getOUTBOUND_SERIAL_NUMBER()%>" readonly="readonly">
 
  </td>
  
 
 
 
 </tr>
<tr height=50px style="border: 1px;border-style: solid;border-color: #EDEDED;font-weight: bold;">
 <td width="200px">
Comments 
   
  </td>

  <td width="200px">
  <input type="text" name="item_comment" value=" <%=requestId.getOUTBOUND_COMMENTS()%>">
 
  </td>
  
 
 
 
 </tr>
 
  
  <tr>
  <td>
  <input type="submit" value="update" style="background-color: #2FA3E6;width: 80px;height: 30px;color: white;border: #1E95DA">
  
  </td>
  <td></td>
  <td>
  
    <span style="color: red;font-size: 16px;left: 60px;position: absolute;left: 250px"  id="errfn" ></span>
  
  </td>
  
  </tr>
</table>
</div>
 
 
 
 <input type="hidden" name="request" value="From_Edit_outbound_request">
 
 <input type="hidden" name="edit_outbound_id" value="<%=requestId.getOUTBOUND_ID()  %>">
 <input type="hidden" name="outbound_description" value="<%=requestId.getOUTBOUND_COMMENTS()  %>">
 <input type="hidden" name="added_by" value="<%=userid  %>">
 <%-- <input type="hidden" name="item_id" value="<%=requestId.getITEM_ID()  %>"> --%>
 <input type="hidden" name="remaining_quantity_in_item" id="remaining_quantity_in_item">
 <input type="hidden" name="item_name" id="item_name">

 
  </form>
  <%}%>
              </section>   
                <!-- /.col -->
              </div>
              <!-- /.row -->
             
            
            </div>
            <!-- /.box-footer -->
       
          
           
               


   



<%--   <form action="Controller" method="post">

 
 
 <input type="hidden" name="item_id" value="<%=id%>">
 
 <input type="hidden" name="request" value="fromEdit">

 
  </form> --%>
  
  


<script src="plugins/jQuery/jQuery-2.2.0.min.js"></script>

<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.5 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="plugins/morris/morris.min.js"></script>
<!-- Sparkline -->

<!-- Bootstrap WYSIHTML5 -->
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>


<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>

 
<script src="dist/js/app.min.js"></script>

<script src="dist/js/demo.js"></script>

</body>
</html>
