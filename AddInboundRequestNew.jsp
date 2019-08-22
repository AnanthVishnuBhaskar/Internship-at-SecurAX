<!DOCTYPE html>
<%@page import="com.inventory.dao.InboundNewDao"%>
<%@page import="com.inventory.bean.Inventory_Inbound_New"%>
<%@page import="com.inventory.bean.Inventory_Item_Names"%>
<%@page import="com.inventory.dao.InventoryStatusDao"%>
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
    
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  
  <!-- Fot dataTable -->
  
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
 

$(document).ready(function(){

    
		
    $("#addButton").click(function () 
	{
					
		   
		for(var i=0;i<4;i++)
		{
			
		
		
			 	var newTextBoxDiv = $(document.createElement('div'))
					.attr("id", 'TextBoxDiv' + i);
							
				newTextBoxDiv.after().html('<label>Textbox #'+ i + ' : </label>' +
					  '<input type="text" name="textbox' + i + 
					  '" id="textbox' + i + '" value="" >');
					  
						
				newTextBoxDiv.appendTo("#TextBoxesGroup");

							
				 
		}
    });

   //  $("#removeButton").click(function () {
	  
       
			
     //});
		
     $("#getButtonValue").click(function () 
	 {
		
	var msg = '';
	for(i=0; i<4; i++){
	if(i==0)
	{
		msg += $('#textbox' + i).val(); 
	}
else
{
 msg += ":::" + $('#textbox' + i).val(); 
}
   	
	}
    	  alert(msg);
		   
	    for(var i=0;i<4;i++)
		{
		
			
        $("#TextBoxDiv" + i).remove();
		}
document.getElementById('total').value = document.getElementById('total').value+msg+'@@@';

 
     });
  });
 
  
  
  
  
  
  
  
  
  
  
  

function unHide()
{
 
			       $(".hideTr").slideDown('10000');

}



</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
	 
function sendInfo()
{
	 
	 var v=document.addInboundRequest.item_name.value;
	  
	//alert(v);
	
	 var replaceAnd=v.replace("&", "AND"); 
	 replaceAnd=replaceAnd.replace("+", "PLUS");
	// alert(replaceAnd);
	 $("#quantity").focus();
	  
		 
		//var v=document.getElementById("item_id").value ;
		//alert(v);
		 
		var url="GetItemCountForItemNames.jsp?val="+replaceAnd;
		 
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
		var itemName=str.substring(str.indexOf("<h4>")+4, str.lastIndexOf("</h4>")).toString();
		 
		var b=itemName.search("FALSE")
		//alert(itemQuantity);
			if(b>0 || b==0)
			{
				document.getElementById('serial_number').value="NO SERIAL";
				$('#serial_numbertd1').addClass("hideAttribute");//
				$('#serial_numbertd2').addClass("hideAttribute");//
				
			
			}
			else
				{
				document.getElementById('serial_number').value="";
				$('#serial_numbertd1').removeClass('hideAttribute');
				$('#serial_numbertd2').removeClass('hideAttribute');
				}
			
		
		var itemSerialNumber=str.substring(str.indexOf("<p>")+3, str.lastIndexOf("</p>")); 
		//alert(itemName);
	 
		
		
		  
			 
			  // alert(1);
			 // $("#item_id").css("border-color", "red");
			 
			 // $(".serialCheckbox").remove();
	   // alert("about to remove label");
	     //$(".serialCheckbox").remove();
			 
			 document.getElementById('total_quantity').value=itemQuantity;
			 //document.getElementById('item_serial_number_details').value=itemSerialNumber;
			// document.getElementById('item_type').value=itemType;
			 
			  
			  		
			 
	 
	}
	 
	
}	 

function checkInvoice()
{
	  
	 var v=document.addInboundRequest.invoice_number.value;
		 
		//var v=document.getElementById("item_id").value ;
		//alert(v);
		 
		var url="GetInvoiceNumber.jsp?val="+v;
		 
		if(window.XMLHttpRequest){
		request=new XMLHttpRequest();
		}
		else if(window.ActiveXObject){
		request=new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		try
		{
		
			request.onreadystatechange=getInvoice;
			request.open("GET",url,true);
			request.send();
			}
		catch(e)
		{
			alert("Unable to connect to server");
		}
	 
	 
}


function getInvoice()
{
	 var v=document.addInboundRequest.invoice_number.value;
	if(request.readyState==4)
	{
		var str=request.responseText;
		
		var invoiceNumber=str.substring(str.indexOf("<h3>")+4, str.lastIndexOf("</h3>")); 
		invoiceNumber=invoiceNumber.toString().trim()
		 
		var b=invoiceNumber.length;
		
		
			if(b>0)
			{
				alert("Invoice Number already there");
				$('#invoice_number').addClass("makeBorderRed");
			}
			else
				{
				 
				$('#invoice_number').removeClass("makeBorderRed");
				
				}
		 
	 
		
		
		  
			  
			  
			  		
			 
	 
	}
	 
	
}	 











function showAddItemList()
{
	//alert("Called");
	 $("#AddItems").slideDown();
	

}
</script>
<script>
//auto name 
function setAutoName()
{

	var str=document.getElementById('appendItemNamesValue').value;
	// alert(str);
	var data = str.split("@@@");
	
	
	/*  jQuery ready function. Specify a function to execute when the DOM is fully loaded.  */
	$(document).ready(
	
	/* This is the function that will get executed after the DOM is fully loaded */
	function () {
	
	/* binding the text box with the jQuery Auto complete function. */
	$( "#item_name" ).autocomplete({
	 /*Source refers to the list of fruits that are available in the auto complete list. */
	 source:data,
	 /* auto focus true means, the first item in the auto complete list is selected by default. therefore when the user hits enter,
	 it will be loaded in the textbox */
	 autoFocus: true ,
	
	});
	}
	
	);
}
</script>

<script type="text/javascript"> 
 
function getDataFromItemDetailsTable() 
{
	    var rowData="";
	var colData="";
	var totalRowCount = document.getElementById("myTableData").rows.length;
	for(var i=1;i<totalRowCount;i++)
	{
	  
	   for(var j=0;j<5;j++)
	  {
			if(j==0)
			{
				colData=colData+document.getElementById("myTableData").rows[i].cells.item(j).innerHTML;
			}
			else
			{
				colData=colData+":::"+document.getElementById("myTableData").rows[i].cells.item(j).innerHTML;
			}
	         
		}
	 
	    colData=colData+"@@@";
	    
	    var afterRemovingLastAt=colData.substring(0, colData.lastIndexOf("@@@"));
	 
	}
	   document.getElementById("item_details").value=afterRemovingLastAt;
}



function sendValue()
{
	 
	 if(document.getElementById("sas_value").checked==true)
	 {
		  document.getElementById("sas_option").value="TRUE";
		 
		 
	 }
	 else
	{
		 document.getElementById("sas_option").value="FALSE";
		 
		 

	}
}








</script>









<script type="text/javascript">

function blockSpecialChar(e) 
{
    var k = e.keyCode;
    return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8   || (k >= 48 && k <= 57));
}

function addRow()
{
        
   
   var table = document.getElementById("myTableData");

   var rowCount = table.rows.length;
   var row = table.insertRow(rowCount);
   var item_name=document.getElementById("item_name");
   var item_type=document.getElementById("total_quantity_final");
   var item_quantity=document.getElementById("quantity");
   var sas_value=document.getElementById("sas_option");
   var item_serialNumber=document.getElementById("serial_number");
   
    
   row.insertCell(0).innerHTML= item_name.value;
   row.insertCell(1).innerHTML= item_type.value;
   row.insertCell(2).innerHTML= item_quantity.value;
   row.insertCell(3).innerHTML= sas_value.value;
   row.insertCell(4).innerHTML= item_serialNumber.value;
	row.insertCell(5).innerHTML= '<input type="button" value = "Delete" onClick="Javacsript:deleteRow(this)">';

}

function deleteRow(obj) {
    
   var index = obj.parentNode.parentNode.rowIndex;
   var table = document.getElementById("myTableData");
   table.deleteRow(index);
  
}



function load() {
  
   console.log("Page load finished");

}






</script>


   
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
top: 300px;
left: 530px;

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
 
 .inputs {
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    -ms-border-radius: 3px;
    -o-border-radius: 3px;
    border-radius: 3px;
    -webkit-box-shadow: 0 1px 0 #FFF, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
    -moz-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
    -ms-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
    -o-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
    box-shadow: 0 1px 0 #FFF, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -ms-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    transition: all 0.5s ease;
     
    border: 1px solid #C8C8C8;
    color: #777;
    font: 13px Helvetica, Arial, sans-serif;
    margin: 0 0 10px;
    padding: 6px 6px 6px 16px;
    width: 210px;
}

.inputs:focus {
    -webkit-box-shadow: 0 0 2px #ED1C24 inset;
    -moz-box-shadow: 0 0 2px #ed1c24 inset;
    -ms-box-shadow: 0 0 2px #ed1c24 inset;
    -o-box-shadow: 0 0 2px #ed1c24 inset;
    box-shadow: 0 0 2px #ED1C24 inset;
    background-color: #FFF;
    border: 1px solid #ED1C24;
    outline: none;
}

th, td { padding: 25px; }

/* cellspacing */
 
/* valign */
th, td { vertical-align: top; }

.buttonClass {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    width: auto;
}
.buttonClass :HOVER {
	background-color: lime; /* Green */
    border: none;
    color: white;
    padding: 15px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    width: 120px;
}
.validateBtn {
    background-color: #00AECC; /* Green */
    border: none;
    color: black;
   
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    width: 100px;
    height: 30px;
}
button:hover {
  background: #3071A9
}


.hideAttribute
{

display: none;
}


.makeBorderRed
{

border: 1px;
border-color: red;
border-style: solid;
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

 <%!
int userStatus;

%>
<%

String userStatus1=session.getAttribute("userStatus").toString();
userStatus=Integer.parseInt(userStatus1);

%>

<%


String userid=session.getAttribute("userId").toString();
String userName=session.getAttribute("userName").toString();
InboundNewDao inbound_dao=new InboundNewDao();

String invoiceNumber=inbound_dao.getAutoInvoiceNumber();

%>
 <%
UserDao userDao=new UserDao();
//List<Inventory_Users> userStatus=userDao.getAllUserStatus();


%>
 <%
 InventoryStatusDao dao=new InventoryStatusDao();
List<Inventory_Status> list=dao.getAllInboundStatus();
InventoryDao dao1=new InventoryDao();
List<Inventory_Item> list1=dao1.getItemType();

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
          <%  }  if(userStatus==3 )
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
       
        <small> </small>
      </h1>
      <ol class="breadcrumb">
        <!-- <li><a href="#"><i class="fa fa-dashboard" ></i> Home</a></li>
        <li class="active">Dashboard</li> -->
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
           
              <div class="row">
        <!-- Left col -->
         
          <!-- Custom tabs (Charts with tabs)-->
          <div class="nav-tabs-custom">
            <!-- Tabs within a box -->
            <ul class="nav nav-tabs pull-right">
               
              <li class="pull-left header"><i class="fa fa-inbox"></i> ADD INBOUND REQUEST</li>
              
     
              
              
            </ul>
            <div class="tab-content no-padding">
            
                          
    
         
              <!-- Morris chart - Sales -->
              <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: auto;">
              
               <form action="ControllerNew" method="post" name="addInboundRequest">
 


<table>

<tr >
		<td style="width:auto;">INWRD NUMBER
		</td>
		<td >
		<input class="inputs"   type="text" id="inward_number" name="inward_number" required="required"  value="<%=invoiceNumber%>"/>
		 
		</td>
		
		
		
		<td style="width:100px">INVOICE NUMBER
		</td>
		<td >
		<input class="inputs"   type="text" id="invoice_number" name="invoice_number" onblur="checkInvoice();"/>
		 
		</td>
		
		
		 
</tr>
<tr>
		<!-- <td>
		RECIEVED DATE
		</td>
		<td>
		<input class="inputs"   type="text" id="invoice_date" name="invoice_recieved_date" />
		 -->
		<% 
		
		for(Inventory_Item type:list1)
		{
			%>
			
			
			 
			
			
		<% }
		%>
		
			  
			   
		  
		<td>
		PO
		</td>
		<td>
		<input class="inputs"   type="text" id="po" name="po" />
		
		 
			  
		 
		</td>
		<td>
	TRANSPORTER
		</td>
		<td>
		<input type="text" name="reporter" class="inputs" required="required"  >
		</td>
</tr>

<tr class="hideTr">
		<td>
		SUPPLIER
		</td>
		<td>
		<input type="text" name="incharge" class="inputs" required="required">
		</td>
 <td>
		INVOICE AMOUNT
		</td>
		<td>
		 
		 <input type="number" name="invoice_amount" class="inputs" required="required">
		</td>
		
</tr>

 <%
InventoryDao inventoryDao=new InventoryDao();

List<Inventory_Item_Names> itemNames=inventoryDao.getAllItemNames();

String appendItemNames="";



%>

<!-- <tr class="hideTr">
		<td>
		COMMENTS
		</td>
		<td>
		 <textarea rows="5" cols="20" name="comments" class="inputs" required="required"></textarea>
		</td>
		<td  >
		INBOUND QUANTITY
		</td>
		<td>
		<input type="text" name="inbound_quantity" class="inputs" required="required">
		</td>
</tr> -->
<tr class="hideTr">
		
		<td style="width:auto;">INVOICE DATE
		</td>
		<td >
		<input class="inputs"   type="text" id="invoice_date" name="invoice_date" required="required"/>
		 
		</td>
		
		
		<td  >
		REMARK
		</td>
		<td>
		<textarea rows="5" cols="20" name="remark" class="inputs" required="required"></textarea>
		</td>
</tr>

<tr style="display: none">
		
		<td  >
	ALL Item Names
		</td>
		<td>
		<% 
		
		for(Inventory_Item_Names type:itemNames)
		{
			

			 appendItemNames=appendItemNames+"@@@"+type.getItem_name().trim();
			%>
			
			
			
			
		<% }
		appendItemNames=appendItemNames.substring(3).trim();
		%>
		
		<input type="text" name="appendItemNames" class="inputs" required="required" value="<%=appendItemNames%>" id="appendItemNamesValue">
		
		
		
		
		
		
		
		
		
		
		</td>
</tr>


<tr class="hideTr">
 
 
 
 
<td>

<input type="button" value="+ ADD ITEM" class="buttonClass" onclick="showAddItemList();">
</td>
<td>

<%--  <input type="hidden" name="inbound_requested_by" value="<%=userid%>">  --%>
<input type="hidden" name="request" value="new_inbound">
<!-- <input type="hidden" name="editable_inbound_status" value="TRUE"> -->
</td>
</tr>
</table>
 
 

  
  <div id="AddItems" style="display: none;">
 
  <div id="myform">
<b style="position: absolute;left: 50px">ADD  ITEM</b>
<br>
<table class="table table-striped table-bordered" >
    <tr>
        <td>Item Name</td>
    <!--     <td><input type="text" id="item_name" class="inputs"></td> -->
      <%--   <td><select name="item_name" class="inputs" required="required" id="item_name"  onchange="sendInfo()">
        <option value="Select">Select</option>
		
		<% 
		
		for(Inventory_Item_Names type:itemNames)
		{
			%>
			
			
			<option value="<%=type.getItem_name().trim()%>"><%=type.getItem_name().trim()%></option>
			
			
		<% }
		%>
		
			  
			   
		</select> --%>
		<td>
		<input type="text" name="item_name" id="item_name" onkeypress="setAutoName();" onblur="sendInfo()"/>
		
		</td>
    
        <td>Total Quantity</td>
        <td><input type="number" id="total_quantity" name="total_quantity"class="inputs" readonly="readonly">
        
    </tr>
 
	<tr >
	   
        <td>Item Quantity</td>
        
        <td><input type="number" id="quantity" class="inputs" onblur="setTotalQuantity();"><span><input type="number" id="total_quantity_final"  readonly="readonly"   class="inputs" style="width: 120px"></span>
         
     
        <td id="serial_numbertd1">Item Serial Number</td>
        <td id="serial_numbertd2"><input type="text" id="serial_number" class="inputs"></td>
		 
    </tr>
    <tr>
        <td><input type="button" id="add" value="ADD ITEM TO LIST" onclick="Javascript:addRow()" class="buttonClass"></td> 
        <td><input type="text" id="item_details" class="inputs" name="item_details" class="buttonClass"></td>
        <td><input type="checkbox" name="sas_value"  id="sas_value"  style="width: 20px;height: 30px" onchange="sendValue();"   >&nbsp;&nbsp;&nbsp;&nbsp;<span>is SaaS sails ?</span></td>
        <td><input type="hidden" name="sas_option" id="sas_option" value="FALSE"></td>
    </tr>
</table>



</div>

<script type="text/javascript">
function setTotalQuantity()
{

var v1=document.getElementById("total_quantity").value;
var v2=document.getElementById("quantity").value;
var total=Number(v1)+Number(v2)//NO SERIAL

var serialNumberStatus=document.getElementById("serial_number").value;
if(serialNumberStatus=='NO SERIAL')
	{
	var count="";
		for(var i=0;i<v2;i++)
			{
			 count=count+"1/";
			}
		//alert("Count : "+count);
		var finalString=count.substring(0, count.lastIndexOf("/"));
		//alert("finalString : "+finalString);
		document.getElementById("serial_number").value=finalString;
	}
else
	{
	alert("Enter Serial Number");
	document.getElementById("serial_number").focus();
	}
	

document.getElementById("total_quantity_final").value=total;
}



</script>

<!-- <div id="myDynamicTable">
<input type="button" id="create" value="Click here" onclick="Javascript:addTable()">
to create a Table and add some data using JavaScript
</div> -->


 <div id="mydata">
<b style="position: absolute;left: 50px">ITEMS LIST</b>
<br>
<table id="myTableData"   class="table table-striped table-bordered"  >
    <tr>
        
        <td><b>Item Name</b></td>
        <td><b>Total quantity</b></td>
        <td><b>Item quantity</b></td>
        <td><b>SaaS Sails Value</b></td>
        <td><b>Item Serial</b></td>
		<td>&nbsp;</td>
    </tr>
</table>
&nbsp;<br/>

<input type="hidden" id="add" value="CONFIRM" onclick="getDataFromItemDetailsTable();" class="buttonClass">
<input type="submit" value="ADD REQUEST" onclick="getDataFromItemDetailsTable();"  class="buttonClass">
</div>
         
            </div>
    </form>         
            </div>
          </div>
            <!-- /.box-footer -->
          </div>
       
       
       
       <!--   <add table>   -->
       
    
       
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

<!-- Auto Name -->
 <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

</body>
</html>
