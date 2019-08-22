<!DOCTYPE html>
<%@page import="com.inventory.bean.Inventory_Po_Reporters"%>
<%@page import="com.inventory.dao.Inventory_Po_ReportersDao"%>
<%@page import="com.inventory.dao.OutboundNewDao"%>
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
   <link rel="stylesheet" href="css/reset.css">
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <!-- Fot dataTable -->
  
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
   <script src="js/prefixfree.min.js"></script>
   
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
 
  
  
  
  
  
  
  

  
  

 


</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
function sendInfo()
{
	  
	 var v=document.addOutboundRequest.item_name.value;
		 
	  var replaceAnd=v.replace("&", "AND"); 
	 replaceAnd=replaceAnd.replace("+", "PLUS"); 
	// alert(replaceAnd);
		 
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

function hideSerialTd()
{
	if(document.getElementById('serail_number_status').value=="FALSE")
		{
		$('#serial_number_tdValue').addClass('hideAttribute');
		}
	else
		{
		$('#serial_number_tdValue').removeClass('hideAttribute');
		}
	
	
}


function getInfo()
{
	if(request.readyState==4)
	{
		var str=request.responseText;
		
		var itemQuantity=str.substring(str.indexOf("<h3>")+4, str.lastIndexOf("</h3>")); 
		
		var itemSerialNumber=str.substring(str.indexOf("<p>")+3, str.lastIndexOf("</p>")); 
		
		var serialNuberStatus=str.substring(str.indexOf("<h4>")+4, str.lastIndexOf("</h4>")).toString();
	//	alert("ser : "+itemSerialNumber);
	 
		var b=serialNuberStatus.search("FALSE")
		//alert(b);
			if(b>0 || b==0)
			{
				$('#serial_number_tr').addClass("hideAttribute");//
				$('#quantity_number_tr').removeClass('hideAttribute');
				$('#serialNumberButton').addClass('hideAttribute');
				//
					$('#serial_number_td').addClass('hideAttribute');
					//$('#serial_number_tdValue').addClass('hideAttribute');
					 
				document.getElementById('serail_number_status').value="FALSE";
			
			}
			else
				{
				//$('#serial_number_tdValue').removeClass('hideAttribute');
				$('#serial_number_tr').removeClass('hideAttribute');
				$('#serialNumberButton').removeClass('hideAttribute');
				$('#quantity_number_tr').addClass("hideAttribute");
				$('#serial_number_td').removeClass('hideAttribute');
			 
				
				//
					document.getElementById('serail_number_status').value="TRUE";
				}
		
		  
			 
			  // alert(1);
			 // $("#item_id").css("border-color", "red");
			 
			  $(".serialCheckbox").remove();
	   // alert("about to remove label");
	     $(".serialCheckbox").remove();
			 
			 document.getElementById('total_quantity').value=itemQuantity;
			 document.getElementById('item_serial_number_details').value=itemSerialNumber;
			 document.getElementById('serail_number_status').value=serialNuberStatus;
			// document.getElementById('item_type').value=itemType;
			 
			  
			  		
			 
	 
	}
	 
	
}	 
 


function showAddItemList()
{
	//alert("Called");
	 $("#AddItems").slideDown();
	

}


 
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
				colData=colData+"###"+document.getElementById("myTableData").rows[i].cells.item(j).innerHTML;
			}
	         
		}
	 
	    colData=colData+"@@@@";
	    
	    var afterRemovingLastAt=colData.substring(0, colData.lastIndexOf("@@@@"));
	 
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




function dataToTable()
{
	 getAllSerialNumber();
	   var itemName = document.getElementById("item_name");
	  
	   var sas_option = document.getElementById("sas_option");
	  // var itemType = document.getElementById("total_item_selected");
	   var quantity = document.getElementById("total_item_selected");
	   var serial_number = document.getElementById("item_serial_number_details_final");
	   var hidden_quantity = document.getElementById("hidden_quantity");
	   var table = document.getElementById("myTableData");

	   var rowCount = table.rows.length;
	   var row = table.insertRow(rowCount);

	  
	   row.insertCell(0).innerHTML= itemName.value;
	   row.insertCell(1).innerHTML= quantity.value;
	   row.insertCell(2).innerHTML= hidden_quantity.value;
	  row.insertCell(3).innerHTML= sas_option.value;
	  
	   //row.insertCell(4).setAttribute('id','serial_number_tdValue');
	   /* var cell1=row0.insertCell(4);//the 1 here is the cell index
	   cell1.id="serial_number_tdValue"; */
	   var cell1=row.insertCell(4).innerHTML= serial_number.value;
	   cell1.id="serial_number_tdValue";
		row.insertCell(5).innerHTML= '<input type="button" value = "Delete" onClick="Javacsript:deleteRow(this)">';
		hideSerialTd();
}


function addRow()
{
	
	//hideSerialTd();
	 var serialNmberStatus = document.getElementById("serail_number_status").value;
	      if(serialNmberStatus=='FALSE')
		 {
	    	//  alert("No seri");
	    	  createCheckBox();
	    	  dataToTable();
	     }
	      else
	    	  {
	    	  dataToTable();
              }
}

function deleteRow(obj) {
    
   var index = obj.parentNode.parentNode.rowIndex;
   var table = document.getElementById("myTableData");
   table.deleteRow(index);
  
}



function load() {
  
   console.log("Page load finished");

}


//creating checkbox


 
function createCheckBox() 
{
	 var item_serial_number_details=document.getElementById('item_serial_number_details').value;
	 var serail_number_status=document.getElementById('serail_number_status').value;
	 
	
	    var res = item_serial_number_details.split("@@@");
	    var itemName=document.getElementById("item_name").value;
	    var total_quantity=document.getElementById("total_quantity").value;
	    var quantity_you_need=document.getElementById("quantity_you_need").value;
	    
	    if(itemName=='Select')
		{
			 
			$('#item_name').css("border-color","red");
			alert("There is no item to deliver");
			//document.getElementById('errfn').innerHTML="PLESE SELECT ITEM NAME";
			return false;
		
		}
	    if(total_quantity==0)
		{
			 
			$('#total_quantity').css("border-color","red");
			//document.getElementById('errfn').innerHTML="PLESE SELECT ITEM NAME";
			alert("There is no item to deliver");
			return false;
		
		}
	    
	    
	        if(serail_number_status=='FALSE')
	    	{
	     
	        	$('#serial_number_tr').css("display","red");
	        	
	        	for(var i=0;i<quantity_you_need;i++)
	    		{
	        		 
	    			//19:::568@@@20
	    			var stringData=res[i];
	    			
	    			var resAfterSplit= stringData.split(":::");
	    			
	    			var itemId=resAfterSplit[0];
	    			var itemSerialNumber=resAfterSplit[1];
	    			
	    			var x = document.createElement("INPUT");
	    			x.setAttribute("type", "checkbox");
	    			x.setAttribute("id",itemId)
	    			x.setAttribute("value",itemSerialNumber)
	    			x.setAttribute("class","serialCheckbox")
	    			x.setAttribute("checked","true");
	    			document.getElementById("cb").appendChild(x);
	    			
	    			//creating label
	    			 var newlabel = document.createElement("Label");
	    			newlabel.setAttribute("for",itemId);
	    			newlabel.setAttribute("class","serialCheckbox")
	    			newlabel.innerHTML =itemSerialNumber ;
	    			document.getElementById("cb").appendChild(newlabel)
	    			
	    			//alert(res[i]);
	    		}
	    	}
	        else
	    		{
		    		for(var i=0;i<res.length;i++)
		    		{
		    			//19:::568@@@20
		    			var stringData=res[i];
		    			
		    			var resAfterSplit= stringData.split(":::");
		    			
		    			var itemId=resAfterSplit[0];
		    			var itemSerialNumber=resAfterSplit[1];
		    			
		    			var x = document.createElement("INPUT");
		    			x.setAttribute("type", "checkbox");
		    			x.setAttribute("id",itemId)
		    			x.setAttribute("value",itemSerialNumber)
		    			x.setAttribute("class","serialCheckbox")
		    			//x.setAttribute("checked","true");
		    			document.getElementById("cb").appendChild(x);
		    			
		    			//creating label
		    			 var newlabel = document.createElement("Label");
		    			newlabel.setAttribute("for",itemId);
		    			newlabel.setAttribute("class","serialCheckbox")
		    			newlabel.innerHTML =itemSerialNumber ;
		    			document.getElementById("cb").appendChild(newlabel)
		    			
		    			//alert(res[i]);
		    		}
		    		
	    		}
	    
	    
		
	    
	return true;
 

}
 




</script>


   
<script type="text/javascript" src="jquery/jquery2.js"></script>
<script type="text/javascript" src="jquery/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="jquery/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="jquery/jtable.css">
<link rel="stylesheet" href="jquery/jtable.css">
<link rel="stylesheet" href="jquery/jtable2.css">
<style type="text/css">


.dropdown {
  position: absolute;
  top:50%;
  transform: translateY(-50%);
}

a {
  color: #fff;
}

.dropdown dd,
.dropdown dt {
  margin: 0px;
  padding: 0px;
}

.dropdown ul {
  margin: -1px 0 0 0;
}

.dropdown dd {
  position: relative;
}

.dropdown a,
.dropdown a:visited {
  color: #fff;
  text-decoration: none;
  outline: none;
  font-size: 12px;
}

.dropdown dt a {
  background-color: #4F6877;
  display: block;
  padding: 8px 20px 5px 10px;
  min-height: 25px;
  line-height: 24px;
  overflow: hidden;
  border: 0;
  width: 272px;
}

.dropdown dt a span,
.multiSel span {
  cursor: pointer;
  display: inline-block;
  padding: 0 3px 2px 0;
}

.dropdown dd ul {
  background-color: #4F6877;
  border: 0;
  color: #fff;
  display: none;
  left: 0px;
  padding: 2px 15px 2px 5px;
  position: absolute;
  top: 2px;
  width: 280px;
  list-style: none;
  height: 100px;
  overflow: auto;
}

.dropdown span.value {
  display: none;
}

.dropdown dd ul li a {
  padding: 5px;
  display: block;
}

.dropdown dd ul li a:hover {
  background-color: #fff;
}


.hideAttribute
{

display: none;
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
OutboundNewDao newDao=new OutboundNewDao();
String dcNumber =newDao.getAutoDcNumber();
 
%>
 <%
Inventory_Po_ReportersDao reportersDao=new Inventory_Po_ReportersDao();
 
 List<Inventory_Po_Reporters> reporters=reportersDao.getAllReporters();


%>
 <%
 InventoryStatusDao dao=new InventoryStatusDao();
List<Inventory_Status> list=dao.getAllInboundStatus();
InventoryDao dao1=new InventoryDao();
List<Inventory_Item> list1=dao1.getItemType();

%>

<body class="hold-transition skin-blue sidebar-mini">

<div id="test">

<a href="">test</a>
</div>
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
               
              <li class="pull-left header"><i class="fa fa-inbox"></i> ADD OUTBOUND REQUEST</li>
              
     
              
              
            </ul>
            <div class="tab-content no-padding">
            
                          
    
         
              <!-- Morris chart - Sales -->
              <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: auto;">
              
               <form action="ControllerNew" method="post" name="addOutboundRequest" >
 


<table>

<tr >
		<td style="width:100px">DC NUMBER
		</td>
		<td >
	 
		<input class="inputs"   type="text" id="dc_number" name="dc_number" value="<%=dcNumber%>" readonly="readonly"/>
		 
		</td>
		<td>
		PO
		</td>
		<td>
		<input class="inputs"   type="text" id="po" name="po" />
		
		 
			  
		 
		</td>
		
		 
</tr>
<tr>
		<td>
		Report To
		</td>
		<td>
		<select name="reporter"   id="reporter"  class="inputs" required="required" onchange="sendInfo()">
        <option value="Select">Select</option>
		
		<% 
		
		for(Inventory_Po_Reporters users:reporters)
		{
			%>
			
			
			  <option value="<%=users.getReporterEmail().trim()%>"><%=users.getReporterFirstName().trim()%></option>  
			
			
		<% }
		%>
		
			  
			   
		</select>
		<td>
	TRANSPORTER
		</td>
		<td>
		<input type="text" name="transporter" class="inputs" required="required"  >
		</td>
		
</tr>

<tr class="hideTr">
		<td>
		COMPANY NAME
		</td>
		<td>
		<textarea rows="5" cols="20" name="company_name" class="inputs" required="required"></textarea>
		 
		</td>
		 
  
		<td>
		REMARK
		</td>
		<td>
		<textarea rows="5" cols="20" name="remark" class="inputs" required="required"></textarea>
		<input type="hidden" name="dc_amount" class="inputs" required="required" value="0">
		</td>
		
</tr>
<%
InventoryDao inventoryDao=new InventoryDao();

List<Inventory_Item_Names> itemNames=inventoryDao.getAllItemNames();

String appendItemNames="";



%>

<tr class="hideTr">
		
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
		
		<input type="hidden" name="appendItemNames" class="inputs" required="required" value="<%=appendItemNames%>" id="appendItemNamesValue">
		
		
		
		
		
		
		
		
		
		
		</td>
</tr>


 
<tr class="hideTr">

<td>

<input type="button" value="+ ADD ITEM" class="buttonClass" onclick="showAddItemList();">
</td>
<td><%--
 <input type="text" name="q" class="form-control" placeholder="Search..." id="searchTerm" onkeyup="doSearch()">
  <input type="hidden" name="inbound_requested_by" value="<%=userid%>">  --%>
<input type="hidden" name="request" value="new_outbound_request">
<!-- <input type="hidden" name="editable_inbound_status" value="TRUE"> -->
</td>
</tr>
</table>
 
 
 
  
  <div id="AddItems" style="display: none;">
 
  <div id="myform">
<b style="position: absolute;left: 50px">ADD  ITEM</b>
<br>
 
 


<table class="table table-striped table-bordered" id="dataTable" >
    <tr>
        <td>Item Name</td>
        <!-- <td><input type="text" id="" class="inputs"> -->
    
       <%--  <select name="item_name"   id="item_name"  class="inputs" required="required" onchange="sendInfo()">
        <option value="Select">Select</option>
		
		<% 
		
		for(Inventory_Item_Names type:itemNames)
		{
			%>
			
			
			<option value="<%=type.getItem_name().trim()%>"><%=type.getItem_name().trim()%></option>
			
			
		<%
}
		%>
		
			  
			   
		</select> --%>
		
		<td>
		<input type="text" name="item_name" id="item_name" onkeypress="setAutoName();" onblur="sendInfo()"/>
		
		</td>
		
		 
         <td>Total Quantity 
        <input type="text" id="total_quantity" id="total_quantity" class="inputs" style="width: 50px" ></td>
        
 <td><input type="checkbox" name="sas_value"  id="sas_value"  style="width: 20px;height: 30px" onchange="sendValue();"   >&nbsp;&nbsp;&nbsp;&nbsp;<span>is SAS Item ?</span></td>
         
        <!-- <td><input type="button" class="buttonClass" onclick="return createCheckBox();" value="Get serialNumbers"> -->
    </tr>
    <tr id="quantity_number_tr">
     <td>Quantity you Need ?</td>
        <td><input type="text" id="quantity_you_need" id="quantity_you_need" class="inputs" >
         <td>
      <input type="text" id="serail_number_status" class="inputs"   value="FALSE"></td>
      <td></td>
        
       
    </tr>
	<tr id="serial_number_tr">
        
         
     
       <!--  <td>Item Serial Number</td>
        <td><input type="text" id="serial_number" class="inputs"></td> -->
         <td style="">
		<span class="hida">SERIAL NUMBERS</span>    
      <p class="multiSel" id="span_Id"></p>  
        
      <dl> 
  
    <dt>
    <a href="#">
      
    </a>
    </dt>
  
    <dd>
        <div class="mutliSelect">
            <ul>
            
             
            
                <li id="cb">
                   <%-- <input type="checkbox" value="<%=serialNuberAndQuantity%>" id="<%=serialNuberAndQuantity%>"   class="serialCheckbox"/> <%=serialNuberAndQuantity%> --%>
                    
                    
                    </li>
                    	 
            
                 
            </ul>
        </div>
    </dd>
   
</dl>
      
      
      
      </td>
       <td></td>
       <td></td>
       <td></td>
      <td >
      <input type="hidden" id="total_item_selected" class="inputs" readonly="readonly">
      
    </tr>
    <tr>
    <td id="serialNumberButton" class="hideAttribute"><input type="button" class="buttonClass" onclick="return createCheckBox();" value="Get serialNumbers"></td>
        <td><input type="button" id="add" value="ADD ITEM TO LIST" onclick="Javascript:addRow()" class="buttonClass"></td> 
        <td ><input type="hidden" id="item_serial_number_details" class="inputs" name="item_serial_number_details"></td>
        <td ><input type="hidden" id="item_serial_number_details_final" class="inputs" readonly="readonly"></td>
        <td ><input type="hidden" id="userId"name="userId" value="<%=userid%>"></td>
        <td ><input type="text" id="item_details" name="item_details"  class="hideAttribute" readonly="readonly"></td>
        <td ><input type="hidden" name="sas_option" id="sas_option" value="FALSE"></td>
       
    </tr>
</table>



</div>

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
      
        <td><b>Remaining Quantity</b></td>
        <td><b>Item Quantity</b></td>
       
        <td><b>Is SAS item true ? </b></td>
           <td id='serial_number_td'><b>Item Serial Numbers</b></td>
         
		<td>&nbsp;</td>
    </tr>
</table>
&nbsp;<br/>

<input type="hidden" id="add" value="CONFIRM" onclick="getDataFromItemDetailsTable();" class="buttonClass">
 

<input type="submit" value="ADD REQUEST" class="buttonClass"  onclick="getDataFromItemDetailsTable();">
 
<input type="hidden" id="hidden_quantity">
</div>
         
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/index.js"></script>
         
            </div>
    </form>         
            </div>
          </div>
            <!-- /.box-footer -->
          </div>
       
       <script type="text/javascript">
       
     


       function getAllSerialNumber()
       {
        
	    	  
	       var checkedValue = null;
	       var checkedId = null;  
	       var data=" ";
	       var count=0;
	       var inputElements = document.getElementsByClassName('serialCheckbox');
	       for(var i=0; inputElements[i]; ++i)
	       {
	             if(inputElements[i].checked)
	             {
	            	 count++;
	                  checkedValue = inputElements[i].value;
	                  checkedId = inputElements[i].id;
	           //   alert(checkedId );
			          if(count==1)
			       {
			       data=inputElements[i].id+":::"+inputElements[i].value;
			       }
			       else
			       {
			       data=data+"@@@"+inputElements[i].id+":::"+inputElements[i].value;
			       }
			          document.getElementById("item_serial_number_details_final").value=data;
			//
			      // alert(data );
			                //  break;
			             }
			       }
	       //
	       var totalCountToDelete=document.getElementById("total_quantity").value;
	       
	       var total=Number(totalCountToDelete)-Number(count);
	      document.getElementById("total_item_selected").value=total;
	      document.getElementById("hidden_quantity").value=count;
	     // alert(count);
	    	   
       }
       </script>
       
       
  
       
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
