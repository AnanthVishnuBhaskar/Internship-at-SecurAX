<!DOCTYPE html>
<%@page import="com.inventory.util.SplitingStringValues"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.inventory.bean.Inventory_Outbound_New"%>
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






</style>
 
<script type="text/javascript">

function callPrint()
{
	 //window.document.location = 'OutboundInvoiceTable.jsp';
	 window.open('OutboundInvoiceTable.jsp');
	 
	//window.print();
	
	
	}

function setId(id)
{
	 
	 document.getElementById('outbound_id').value=id;
	 document.getElementById('request').value='from_outboundRequest_edit';
	 //alert(document.getElementById('request').value);
	 
	document.getElementById('editOutboundRequest').submit();
	 
	 
	 
}
function setIdForDelete(id)
{
	
	if (confirm("Are you sure to delete this item ..!") == true) 
	{
		     document.getElementById('outbound_id_delete').value=id;//item_id_delete
			//alert(deleteForm.item_id_delete.value);
		     deleteOutboundRequestForm.request.value='delete_outbound_request';
			 document.getElementById('deleteOutboundRequestForm').submit();
    } 
	else 
	{
  	   alert ("You pressed Cancel!");
    }
	
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

OutboundDao dao=new OutboundDao();

 
String userName=session.getAttribute("userName").toString();
%>
 
 <%
 

 List<Inventory_Outbound_New> list = (List)session.getAttribute("display_single_ob");

%>


<%!

String editableStatus=null;


%>
<%!
int userStatus;

%>
<%

String userStatus1=session.getAttribute("userStatus").toString();
userStatus=Integer.parseInt(userStatus1);

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
          <!-- <a href="ManageInventoryStatus.jsp">
            <i class="fa fa-pie-chart"></i>
            <span style="font-size: 16px;">Manage Inventory Status</span>
            <i class="fa fa-angle-left pull-right"></i>
          </a> -->
		  <!--
          <ul class="treeview-menu">
            <li><a href="pages/charts/chartjs.html"><i class="fa fa-circle-o"></i> ChartJS</a></li>
            <li><a href="pages/charts/morris.html"><i class="fa fa-circle-o"></i> Morris</a></li>
            <li><a href="pages/charts/flot.html"><i class="fa fa-circle-o"></i> Flot</a></li>
            <li><a href="pages/charts/inline.html"><i class="fa fa-circle-o"></i> Inline charts</a></li>
          </ul>-->
        </li>
     
        <li class="treeview">
         <%    if(userStatus==2 || userStatus==3  )
        {%>
           <a href="ManagePoReporters.jsp">
            <i class="fa fa-laptop"></i>
            <span style="font-size: 16px;">Manage PO Reporters</span>
            <!-- <i class="fa fa-angle-left pull-right"></i> -->
          </a>
          <%   } if(userStatus==3 )
        {%>
          <a href="ManageUsersNew.jsp">
            <i class="fa fa-laptop"></i>
            <span style="font-size: 16px;">Manage Users</span>
            <!-- <i class="fa fa-angle-left pull-right"></i> -->
          </a>
          
          <%} %>
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
           <a href="ManageInboundRequestNew.jsp">
            <i class="fa fa-files-o"></i>
            <span style="font-size: 16px;">Manage Inbound request</span>
            <span class="label label-primary pull-right"></span>
          </a>
      </li>
      
       <li class="treeview">
           <a href="ManageOutboundRequestNew.jsp">
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
      <%
String itemDetails="";
for(Inventory_Outbound_New req:list)
{
	 
		
	
	%>
        <small> </small>
      </h1>
      <ol class="breadcrumb">
        <!-- <li><a href="#"><i class="fa fa-dashboard" ></i> Home</a></li>-->
        <li class="active">
         
        
        <button style="background-color: #2FA3E6;width: 50px;height: 30px;color: white;border: #1E95DA"  onclick="setId('<%=req.getOutbound_id()%>')">Edit</button>
        
        
         
<%--  <button style="background-color: #CE1A01;width: 50px;height: 30px;color: white;border: #1E95DA" onclick="setIdForDelete('<%=7%>');">Delete</button>  
 --%>
 <button style="background-color: #2FA3E6;width: 50px;height: 30px;color: white;border: #1E95DA" onClick="callPrint();">PRINT</button> 
</li> 
      </ol>  
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <!-- Left col -->
        <br>
         
          <!-- Custom tabs (Charts with tabs)-->
          <div class="nav-tabs-custom">
            <!-- Tabs within a box -->
            <ul class="nav nav-tabs pull-right">
            <!--    
              <li class="pull-left header"><i class="fa fa-inbox"></i> </li>
             -->  
     
              
              
            </ul>
            <div class="tab-content no-padding">
            
                          
    
         
              <!-- Morris chart - Sales -->
              <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: auto;">
              <br>
                        <!-- Table -->
     <table id="userTable"   class="table table-striped table-bordered" >
    
  
     
    <tbody>  



 
     
     
  <tr>
<td width="200px">
  DC NUMBER
   
  </td>

  <td width="200px">
  
  <%=req.getOutbound_invoice_number() %>
  </td>
  
  <tr>
<td width="200px">
DC DATE
   
  </td>

  <td width="200px">
  <%=req.getDelivery_date_string() %>
  </td>
  
 
 
 </tr>
   <tr>
<td width="200px">
PO
   
  </td>

  <td width="200px">
  
  <%=req.getOutbound_po() %>
  </td>
  
 
 
 
 </tr>
    <tr>
<td width="200px">
 TRANSPORT
   
  </td>

  <td width="200px">
  
  <%=req.getTransporter()%>
  </td>
  
 
 
 
 </tr>
     
 
   <tr>
<td width="200px">
REPORT TO
   
  </td>

  <td width="200px">
  
  <%=req.getReporter()%>
 
  </td>
  </tr>
  <tr>
<td width="200px">
REMARK
   
  </td>

  <td width="200px">
  
  <%=req.getRemark()%>
  
 
 
  </td>
  
   
   </tr>
   
   
   
   <%itemDetails=req.getItem_details_added_to_Export(); %>
 
 
 
  <%} %>
</table>


<%

System.out.println("export : "+itemDetails);//abcd1###2###1###FALSE###2209:::5655
List<String> itemList=SplitingStringValues.getItemNameSerialNamesAndQuantity(itemDetails);

%>
<h3>Items of outbound request</h3>
<table id="userTable"   class="table table-striped table-bordered" >
    
  
     
    <tbody>  
    
   <tr>
<td width="200px">
 ITEM NAME
   
  </td>  
  <td width="200px">
 ITEM Quantity
   
  </td>
  <td width="200px">
 ITEM Serial Numbers
   
  </td>
  <td width="200px">
 Saas Item ?
   
  </td>
  </tr>
 
    
<%

for(String item_details_of_ob:itemList)//export : abcd1###2###1###FALSE###2209:::5655
{
	 
		String SingleItemValues[]=item_details_of_ob.split(":");
		String itemName=SingleItemValues[0];
		String itemQuantity=SingleItemValues[1];
		String itemSerialNumbers=SingleItemValues[2];
		String SasValue=SingleItemValues[3];
		
		
		
	
	%>


 
     <tr>
     
  

  <td width="200px">
  
  <%=itemName%>
  </td>
  

 

  <td width="200px">
  <%=itemQuantity %>
  </td>
  
 
 


 
  <td width="200px">
  
  <%=itemSerialNumbers %>
  </td>
  
  <td width="200px">
  
  <%=SasValue %>
  </td>
  
 
 
 

 </tr>
  
   
 
   
   
   
   
 
 
 
  <%} %>
  </tbody>
</table>


              </div>
         
            </div>
          </div>
            <!-- /.box-footer -->
          </div>
     

            <!-- /.box-footer -->
          </div>
          
           
              </section>   
                <!-- /.col -->
              </div>
              <!-- /.row -->
            
            </div>


<!-- new table -->



 

  
  







   

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
<form id="editOutboundRequest" method="post" action="ControllerNew">
  
  <input type="hidden" name="outbound_id" id="outbound_id"> 
 <input type="hidden" name="request" id="request"> 
  
  
  </form>
  <form id="deleteOutboundRequestForm" method="post" action="Controller">
  
  <input type="hidden" name="outbound_id_delete" id="outbound_id_delete"> 
 <input type="hidden" name="request" id="request"> 
  
  
  </form>

</body>
</html>