<!DOCTYPE html>
<%@page import="com.inventory.bean.Inventory_Outbound_New"%>
<%@page import="com.inventory.dao.OutboundNewDao"%>
<%@page import="com.inventory.bean.Inventory_Outbound"%>
<%@page import="com.inventory.dao.OutboundDao"%>
<%@page import="com.inventory.bean.Inventory_Inbound"%>
<%@page import="com.inventory.dao.InboundDao"%>
<%@page import="com.inventory.bean.Inventory_Item"%>
<%@page import="com.inventory.bean.Inventory_Users"%>
<%@page import="com.inventory.dao.InventoryDao"%>
<%@page import="com.inventory.dao.UserDao"%>
<%@page import="java.util.List"%>
<html>
<head>

 <script type="text/javascript">
 
 function doSearch() 
 {
	    var searchText = document.getElementById('searchTerm').value;
	    var targetTable = document.getElementById('dataTable');
	    var targetTableColCount;
	            
	    //Loop through table rows
	    for (var rowIndex = 0; rowIndex < targetTable.rows.length; rowIndex++) {
	        var rowData = '';

	        //Get column count from header row
	        if (rowIndex == 0) {
	           targetTableColCount = targetTable.rows.item(rowIndex).cells.length;
	           continue; //do not execute further code for header row.
	        }
	                
	        //Process data rows. (rowIndex >= 1)
	        for (var colIndex = 0; colIndex < targetTableColCount; colIndex++) {
	            rowData += targetTable.rows.item(rowIndex).cells.item(colIndex).textContent;
	        }

	        //If search term is not found in row data
	        //then hide the row, else show
	        if (rowData.indexOf(searchText) == -1)
	            targetTable.rows.item(rowIndex).style.display = 'none';
	        else
	            targetTable.rows.item(rowIndex).style.display = 'table-row';
	    }
	}
 function exportToExcel()
 {
 	 //window.document.location = 'OutboundInvoiceTable.jsp';
 	 window.open('OUTBOND_TABLE.jsp', '_blank');
 	 
 	//window.print();
 	
 	
 	}
 
 </script>
  


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









</style>
 
<script type="text/javascript">
/* 
 function call()
 {
	//alert(1);
    $('#userTable').DataTable();
 

 }
 */
 function callAddItem()
 {
 	 //alert(data);
         //window.document.location = 'AddInboundRequest.jsp';
         window.document.location = 'AddOutboundRequestNew.jsp';
    
 }

 
  function setId(id)
  {
 	// alert(id);
 	
	    document.getElementById('outbound_id').value = id;
		document.getElementById('request').value = 'outbound_display';
		//alert(document.getElementById('request').value);

		document.getElementById('display_ob_request').submit();

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
UserDao userDao=new UserDao();

String userName=session.getAttribute("userName").toString();
OutboundNewDao outboundNewDao=new OutboundNewDao();
List<Inventory_Outbound_New> list=outboundNewDao. getAllOBRequest();
 
 
 
 
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
          <input type="text" name="q" class="form-control" placeholder="Search..." id="searchTerm" onkeyup="doSearch()">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        
        <!-- <li class="active treeview">
         <a href="Home.jsp">
            <i class="fa fa-dashboard"></i> <span style="font-size: 16px;">Dashboard</span> <i class="fa fa-angle-left pull-right"></i>
          </a>
		  
          <ul class="treeview-menu">
            <li class="active"><a href="index.html"><i class="fa fa-circle-o"></i> Dashboard v1</a></li>
            <li><a href="index2.html"><i class="fa fa-circle-o"></i> Dashboard v2</a></li>
          </ul>
        </li> -->
        <li>
          <a href="ManageItems.jsp">
            <i class="fa fa-th"></i> <span style="font-size: 16px;">Manage Item</span>
            <small class="label pull-right bg-green"></small>
          </a>
        </li>
        
        
         <%
        if(userStatus==2 || userStatus==3 )
        {
        %>
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
        <%    if(userStatus==2 || userStatus==3)
        {%>
           <a href="ManagePoReporters.jsp">
            <i class="fa fa-laptop"></i>
            <span style="font-size: 16px;">Manage PO Reporters</span>
            <!-- <i class="fa fa-angle-left pull-right"></i> -->
          </a>
          <%    }if(userStatus==3 )
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
      
    </section><%} %>
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
        <!-- <li><a href="#"><i class="fa fa-dashboard" ></i> Home</a></li> -->
        <li class="active">
        
       <!--  <input type="text" id="searchTerm" onkeyup="doSearch()"> -->
        <button style="background-color: #2FA3E6;width: 50px;height: 30px;color: white;border: #1E95DA" onclick="callAddItem();">+</button> 
        <button style="background-color: #BC002B;width: auto;height: 30px;color: white;border: #1E95DA" onclick="exportToExcel();">Export To Excel</button></li> 
       
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
               
              <li class="pull-left header"><i class="fa fa-inbox"></i> OUTBOUND REQUEST</li>
              
     
              
              
            </ul>
            <div class="tab-content no-padding">
            
                          
    
         
              <!-- Morris chart - Sales -->
              <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: auto;">
              <br>
                        <!-- Table -->
     <table id="dataTable"   class="table table-striped table-bordered" id="example">
    
 <thead>
            <tr style="font-weight: bold;">
   
      <td>DC NUMBER
    </td>
    <td>DC DATE
    </td>
    
     <td>COMPANY NAME
    </td>
      <td>PO
    </td>
      <td>TRANSPORTER
    </td>
      <td>REPORTER
    </td>
       <td>REMARK
    </td>
    
    </tr></thead>
     
    <tbody>  <%
 
for(Inventory_Outbound_New requestList:list)
{
	
	 
	%>


 
     
     
<tr style="cursor: pointer;"  onclick="setId('<%=requestList.getOutbound_id() %>');">

   
   
 <td width="200px">
 
 
  
 <%=requestList.getOutbound_invoice_number() %>
	 
	 

 </td>
  <td width="200px">
   
  
  <%=requestList.getDelivery_date_string()%>
  
  
  
  
  </td>
   <td width="200px"><%=requestList.getCompanyName()%></td>
  <td width="200px"><%=requestList.getOutbound_po() %></td>
  <td width="200px"><%=requestList.getTransporter() %></td>
  <td width="200px"><%=requestList.getReporter() %></td>
  <td width="200px"><%=requestList.getRemark() %></td>
  
 </tr>
  
 
  <%} %>
</table>













              <!--  <div style=" position:absolute;left: 800px;top: -20px;z-index: 5">
<button style="background-color: #2FA3E6;width: 50px;height: 30px;color: white;border: #1E95DA" onclick="callAddItem();">+</button>
 </div> -->
 
 
 
 
 
 
 
 
 
 
 
              </div>
      
            </div>
          </div>
            <!-- /.box-footer -->
          </div>
          
               <div id="AddItems">
    
  </div>
              </section>   
                <!-- /.col -->
              </div>
              <!-- /.row -->
            
            </div>
            
            
     
            
<form action="ControllerNew" method="post" id='display_ob_request'>
 <input type="hidden" name="outbound_id" id="outbound_id"> 
 <input type="hidden" name="request" id="request"> 
  </form>
  
 <!--  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.2
    </div>
    <strong>Copyright &copy; 2015-2016 <a href="http://almsaeedstudio.com">SecurAx</a>.</strong> All rights
    reserved.
  </footer>

   -->
 
 

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
