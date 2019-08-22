package com.inventory.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.inventory.bean.Inventory_Inbound_New;
import com.inventory.bean.Inventory_Item_Names;
import com.inventory.bean.Inventory_Outbound_New;
import com.inventory.bean.Inventory_Recipients;
import com.inventory.bean.Inventory_Users;
import com.inventory.dao.InboundNewDao;
import com.inventory.dao.InventoryDao;
import com.inventory.dao.Inventory_ReciepientsDao;
import com.inventory.dao.OutboundNewDao;
import com.inventory.dao.UserDao;
import com.inventory.util.DateFormatter;
import com.inventory.util.SendEmail;
import com.inventory.util.SplitingStringValues;

/**
 * Servlet implementation class ControllerNew
 */
@WebServlet("/ControllerNew")
public class ControllerNew extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerNew() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String requestType=request.getParameter("request");
		HttpSession session=request.getSession();
		RequestDispatcher rd=null;
		PrintWriter out=response.getWriter();
		
		response.setContentType("text/html");
		
		if(requestType.equalsIgnoreCase("addItemName"))
		{
			Inventory_Item_Names names=new Inventory_Item_Names();
			
			String itemName,itemType,serialNumberStatus;
			 
			int itemQuantity=0;
			itemName=request.getParameter("item_name");
			itemType=request.getParameter("item_type");
			serialNumberStatus=request.getParameter("serial_no_availability");
			
			names.setItem_name(itemName);
			names.setNeed_serial_number(serialNumberStatus);
			names.setItem_type(itemType);
			names.setItem_quantity(itemQuantity);
			names.setItem_stock_quantity(0);
			names.setEditable(1);
			
			InventoryDao inventoryDao=new InventoryDao();
			int status=inventoryDao.addItemName(names);
			if(status>0)
			{
				System.out.println("Item name added");
				rd=request.getRequestDispatcher("AddItemNew.jsp");
				rd.include(request, response);
				//session.setAttribute(arg0, arg1);
			}
			else
			{
				
			}
			
			
			
			
		}
		
		if(requestType.equalsIgnoreCase("deleteItemName"))
		{
			Inventory_Item_Names names=new Inventory_Item_Names();
			String itemId ;
			InventoryDao inventoryDao=new InventoryDao();
			itemId=request.getParameter("item_id_delete");
			Integer itemIdInt=Integer.parseInt(itemId);
			int editableStatus=inventoryDao.checkEditableOfItemName(itemIdInt);
			
			if(editableStatus==0)
			{
				int status=inventoryDao.deleteItemFromItemNamesById(itemIdInt);
				 
				if(status>0)
				{
					out.print("<h4 style='color:#FFFFFF;width:100%;border:2px;background-color:#F69C55;height:60px;'>Item Name Deleted</h4>");
					rd=request.getRequestDispatcher("ManageItems.jsp");
					rd.include(request, response);
					 
					//session.setAttribute(arg0, arg1);
				}
			}
			else
			{
				out.print("<h4 style='color:#FFFFFF;width:100%;border:2px;background-color:#F69C55;height:60px;'>Item Name in use can't delete</h4>");
				rd=request.getRequestDispatcher("ManageItems.jsp");
				rd.include(request, response);
			}
			
			 
			
			
		 
			
			
			 
			
			
			 
			
			
			
			
		}
		
		
		
		if(requestType.equalsIgnoreCase("new_inbound"))
		{
			SplitingStringValues ob=new SplitingStringValues();
			
			
			InboundNewDao dao=new InboundNewDao();
			String invoiceNumber,invoiceDate,recievedDate,po,incharge,client,comment,invoiceAmount,itemDetails,inwardNumber;
			invoiceNumber=request.getParameter("invoice_number");
			inwardNumber=request.getParameter("inward_number");
			invoiceDate=request.getParameter("invoice_date");
			recievedDate=request.getParameter("invoice_recieved_date");
			po=request.getParameter("po");
			incharge=request.getParameter("incharge");
			client=request.getParameter("reporter");
			comment=request.getParameter("remark");
			invoiceAmount=request.getParameter("invoice_amount");
			itemDetails=request.getParameter("item_details");
			Integer invoiceAmountToInt=Integer.parseInt(invoiceAmount);
			InboundNewDao inboundNewDao=new InboundNewDao();
			
			List<String> itemAndSerialNumber=ob.getItemNameAndSerialNumber(itemDetails);
			for(String output:itemAndSerialNumber)
			{ //[HIDCARDS:1:1:1, HIDCARDS:1:1:1]
				String splitItemAndSerialNumber[]=output.split(":");
				Inventory_Item_Names inventory_Item_Names=new Inventory_Item_Names();
				inventory_Item_Names.setItem_name(splitItemAndSerialNumber[0]);
				inventory_Item_Names.setItem_serial_number(splitItemAndSerialNumber[1]);
				inventory_Item_Names.setItem_invoice_number(invoiceNumber);
				int i=inboundNewDao.addItemDetailsFromIBRequest(inventory_Item_Names);
				  System.out.println("item Details : "+itemDetails);
				if(i>0)
				{
					System.out.println("Item and serial number added sucess");
				}
			}
			
			List<String> itemAndQuantity=ob.getItemNameAndQuantity(itemDetails);
			//[HIDCARDS:153:FALSE, HIDCARDS:153:FALSE]
			for(String output2:itemAndQuantity)
			{ 
				String splitItemAndQuantity[]=output2.split(":");
				
				String itemName=splitItemAndQuantity[0];
				String itemQuantity=splitItemAndQuantity[1];
				String currentQuantity=splitItemAndQuantity[2];
				String sasValueStatus=splitItemAndQuantity[3];
				
				 int quantity=Integer.parseInt(itemQuantity);
				if(sasValueStatus.equalsIgnoreCase("FALSE"))
				{
					
					    InventoryDao names=new InventoryDao();
					    int stockQuantity=names.getStockQuantitybyItem(itemName);
					    
					    System.out.println("itemName : "+itemName);
					    int newStockQuantity=stockQuantity+Integer.parseInt(currentQuantity);
					    
					    int status=names.updateStockQuantity(newStockQuantity,itemName);
					    if(status>0)
					    {
					    	System.out.println("Stock quantity updated sucess");
					    }
						int i=names.updateStoreQuantity(quantity,itemName);//updateStoreQuantity
						if(i>0)
						{
							System.out.println("Item and quantity added sucess");
							out.print("<h4 style='color:#FFFFFF;width:100%;border:2px;background-color:#F69C55;height:60px;'>Item Added to Inventory</h4>");
							rd=request.getRequestDispatcher("AddInboundRequestNew.jsp");
							rd.include(request, response);
						}
					
				}
				else
				{

				    InventoryDao names=new InventoryDao();
					int i=names.updateStoreQuantity(quantity,itemName);//updateStoreQuantity
					if(i>0)
					{
						System.out.println("Item and quantity added sucess");
						out.print("<h4 style='color:#FFFFFF;width:100%;border:2px;background-color:#F69C55;height:60px;'>Item Added to Store</h4>");
						rd=request.getRequestDispatcher("AddInboundRequestNew.jsp");
						rd.include(request, response);
					}
					
				}
				 
			   
			}
			
			Inventory_Inbound_New inbound_New=new Inventory_Inbound_New();
			
			inbound_New.setInbound_invoice_number(invoiceNumber);
			Date date=new Date();
			 DateFormatter dateFormatter=new DateFormatter();
			 Date invoice_Date=dateFormatter.convetToDateFormat(invoiceDate.trim());
			
			inbound_New.setInvoice_date(invoice_Date);
			inbound_New.setRecieve_date(date);
			inbound_New.setInbound_po(po);
			inbound_New.setIncharge(incharge);
			inbound_New.setVendor_or_transporter(client);
			inbound_New.setRemark(comment);
			inbound_New.setInvoice_amount(invoiceAmountToInt);
			inbound_New.setInward(inwardNumber);
			inbound_New.setItem_details_added_to_inventory(itemDetails);
			
			
			int i=dao.addInboundRequest(inbound_New);
			if(i>0)
			{
				System.out.println("success");
			}
			
			
		}
		
		
		//New outbound request
		
		if(requestType.equalsIgnoreCase("new_outbound_request"))
		{
			SplitingStringValues ob=new SplitingStringValues();
			
			InventoryDao names=new InventoryDao();
			InboundNewDao dao=new InboundNewDao();
			String dcNumber,reporter,deliveringDate,po,company_name,transporter,comment,dc_amount,itemDetails,userId;
			userId=request.getParameter("userId");
			dcNumber=request.getParameter("dc_number");
			reporter=request.getParameter("reporter");
			//deliveringDate=request.getParameter("delivering_date");
			po=request.getParameter("po");
			
			company_name=request.getParameter("company_name");
			transporter=request.getParameter("transporter");
			comment=request.getParameter("remark");
			dc_amount=request.getParameter("dc_amount");
			itemDetails=request.getParameter("item_details");
			Integer dcAmountToInt=Integer.parseInt(dc_amount);
			
			//Adding data to outbound request;
			
			Inventory_Outbound_New inventory_Outbound_New=new Inventory_Outbound_New();
			OutboundNewDao outboundNewDao=new OutboundNewDao();
			inventory_Outbound_New.setOutbound_invoice_number(dcNumber);
			Date date=new Date();
			inventory_Outbound_New.setReporter(reporter);
			inventory_Outbound_New.setDelivery_date(date);
			inventory_Outbound_New.setOutbound_po(po);
			inventory_Outbound_New.setCompanyName(company_name);
			inventory_Outbound_New.setTransporter(transporter);
			inventory_Outbound_New.setRemark(comment);
			inventory_Outbound_New.setDc_amount(dcAmountToInt);
			inventory_Outbound_New.setItem_details_added_to_Export(itemDetails);
			
			List<String> itemIdAnditemName=ob.getSerialNumberIdAndItemNameAndQuantity(itemDetails);
			//abcd1:3:1:TRUE:2211
			for(String data:itemIdAnditemName)
			{
				String splitAtColon[]=data.split(":");
				
				String itemName=splitAtColon[0];
				String itemQuantity=splitAtColon[1];
				String itemQuantityOrdered=splitAtColon[2];
				String SASvalue=splitAtColon[3];
				String itemSerialNumber=splitAtColon[4];
				String itemSerialNumberSplitAt[]=itemSerialNumber.split("@@@");
				
				
				 //Deleting items
				for(String idTodelete:itemSerialNumberSplitAt)
				{
					Integer itemIdToDelete=Integer.parseInt(idTodelete);
					
					int deleteStatus=outboundNewDao.deleteInboundRequestDetails(itemIdToDelete);
					if(deleteStatus>0)
					{
						System.out.println(deleteStatus+"Item Deleted sucessfully");
					}
					
				}
				
				//Updating quantity
				
				Integer quantityToUpdate=Integer.parseInt(itemQuantity);
				
				 InventoryDao inventoryDao=new InventoryDao();
					
					if(SASvalue.equalsIgnoreCase("FALSE"))
					{   
						int i=inventoryDao.updateStoreQuantity(quantityToUpdate,itemName);
						if(i>0)
						{
							System.out.println("Item and quantity of store updated sucess");
						}
						
						int stockQuantity=inventoryDao.getTotalQuantityOfItem(itemName);
						int stockQuantity2=stockQuantity-Integer.parseInt(itemQuantityOrdered);
						
						int j=inventoryDao.updateStockQuantity(stockQuantity2,itemName);
						if(j>0)
						{
							System.out.println("Item and quantity of Stock updated sucess");
						}
					}
					else
					{
						  
						int i=inventoryDao.updateStoreQuantity(quantityToUpdate,itemName);
						if(i>0)
						{
							System.out.println("Item and quantity of store updated sucess");
						}
						 
						
					}
					
				 
					 
				
			}
			//Adding out bound request
			
			int i=outboundNewDao.addOutboundRequest(inventory_Outbound_New);
			if(i>0)
			{
				out.print("<h4 style='color:#FFFFFF;width:100%;border:2px;background-color:#F69C55;height:60px;'>Item Exported sucessfully</h4>");
				rd=request.getRequestDispatcher("AddOutboundRequestNew.jsp");
				//Mail Stuffs
				
				Inventory_ReciepientsDao reciepientsDao=new Inventory_ReciepientsDao();
				
				List<String> reciepientsList=reciepientsDao.getAllActiveReciepients();
				
				String [] reciepientsArray = reciepientsList.toArray(new String[reciepientsList.size()]);
				
				SendEmail sendEmail=new SendEmail();
				
				UserDao userDao=new UserDao();
				
				String emailAndPassword=userDao.getEmailAndPassword(userId);
				//System.out.println("Email And password : "+emailAndPassword.trim());
				
				String SplitEmailAndPassword[]=emailAndPassword.split(":");
				DateFormatter dateFormatter=new DateFormatter();
				String dateAfterConversion= dateFormatter.dateToddmmyyyy(date);
				
				   String[] podetails=new String[4];
			  	   podetails[0]=dcNumber;
			  	   podetails[1]=po;
			  	   podetails[2]=dateAfterConversion;
			  	   podetails[3]=company_name;
				
				
				sendEmail.sendEmailtoReporter(SplitEmailAndPassword[0],SplitEmailAndPassword[1],reporter,itemDetails,podetails,reciepientsArray);
				
				
				
				rd.include(request, response);
			}
			
			
		}
		
		if(requestType.equalsIgnoreCase("outbound_display"))
		{
			//System.out.println("Request from New : "+requestType);
			 OutboundNewDao newDao=new OutboundNewDao();
			 String outBoundRequestId=request.getParameter("outbound_id");
			 Integer outBoundRequestIdToInt=Integer.parseInt(outBoundRequestId);
			 
			 List<Inventory_Outbound_New> singleOBRequest=newDao.getSingleOBRequestById(outBoundRequestIdToInt);
			 if(singleOBRequest.size()>0)
			 {
				 session.setAttribute("display_single_ob", singleOBRequest);
				 rd=request.getRequestDispatcher("DisplayOutboundRequestNew.jsp");
				 rd.forward(request, response);
			 }
			 
			
			
		}
		
		if(requestType.equalsIgnoreCase("from_outboundRequest_edit"))
		{
			//System.out.println("Request from New : "+requestType);
			 OutboundNewDao newDao=new OutboundNewDao();
			 String outBoundRequestId=request.getParameter("outbound_id");
			 Integer outBoundRequestIdToInt=Integer.parseInt(outBoundRequestId);
			 
			 List<Inventory_Outbound_New> singleOBRequest=newDao.getSingleOBRequestById(outBoundRequestIdToInt);
			 if(singleOBRequest.size()>0)
			 {
				 session.setAttribute("edit_single_ob", singleOBRequest);
				 rd=request.getRequestDispatcher("EditOutboundRequestNew.jsp");
				 rd.forward(request, response);
			 }
			 
			
			
		}
		
	
		if(requestType.equalsIgnoreCase("outbound_update"))
		{
			 //updateOutboundRequest  Inventory_Outbound_New
			 OutboundNewDao newDao=new OutboundNewDao();
			 Inventory_Outbound_New outbound=new Inventory_Outbound_New();
			 String outBoundRequestId=request.getParameter("outbound_id").trim();
			 System.out.println("outbound_id"+outBoundRequestId);
			 Integer outBoundRequestIdToInt=Integer.parseInt(outBoundRequestId);
			 
			 String remark=request.getParameter("remark");
			 outbound.setRemark(remark);
			 
			 int i=newDao.updateOutboundRequest(outbound, outBoundRequestIdToInt);
			 if(i>0)
			 {
				 List<Inventory_Outbound_New> singleOBRequest=newDao.getSingleOBRequestById(outBoundRequestIdToInt);
				 if(singleOBRequest.size()>0)
				 {
					 session.setAttribute("display_single_ob", singleOBRequest);
					 rd=request.getRequestDispatcher("DisplayOutboundRequestNew.jsp");
					 rd.forward(request, response);
				 }
				 
			 }
			 else
			 {
				 
			 }
			
			
		}
		
		
		
		
		if(requestType.equalsIgnoreCase("inbound_display"))
		{
			//System.out.println("Request from New : "+requestType);
			InboundNewDao inDao=new InboundNewDao();
			String InboundRequestId=request.getParameter("inbound_id");
			Integer InboundRequestIdToInt=Integer.parseInt(InboundRequestId);
			
			List<Inventory_Inbound_New> singleIbRequest=inDao.getSingleIBRequestById(InboundRequestIdToInt);
			if(singleIbRequest.size()>0)
			{
				session.setAttribute("display_single_ib", singleIbRequest);
				rd=request.getRequestDispatcher("DisplayInboundRequestNew.jsp");
				rd.forward(request, response);
			}
			
			
			
		}
		
		if(requestType.equalsIgnoreCase("new_user"))
		{
		
			String user_name,user_first_name,user_password,user_type,user_status;
			
			 
			
			user_name=request.getParameter("user_name");
			user_first_name=request.getParameter("user_first_name");
		
			user_password=request.getParameter("user_password");
			user_type=request.getParameter("user_type");
			user_status=request.getParameter("user_status");
			
			Inventory_Users inventory_Users=new Inventory_Users();
			inventory_Users.setUserName(user_name);
			inventory_Users.setUserFirstName(user_first_name);
			inventory_Users.setUserPasword(user_password);
			inventory_Users.setUserType(user_type);
			inventory_Users.setUserStatus(user_status);
			
			UserDao dao=new UserDao();
			int i=dao.addUserToLogin(inventory_Users);
			if(i>0)
			{
				out.print("<h4 style='color:#FFFFFF;width:100%;border:2px;background-color:#F69C55;height:60px;'>User added sucessfully</h4>");
				rd=request.getRequestDispatcher("AddUser.jsp");
				rd.include(request, response);
			}
			else
			{
				out.print("<h4 style='color:#FFFFFF;width:100%;border:2px;background-color:#F69C55;height:60px;'>User can't add</h4>");
				rd=request.getRequestDispatcher("AddUser.jsp");
				rd.include(request, response);
			}
		
		
		}
		
		//

		if(requestType.equalsIgnoreCase("updateEmail"))
		{
		
			String user_email,user_email_password,user_id;
			user_email=request.getParameter("user_email");
			user_email_password=request.getParameter("user_email_password");
			user_id=request.getParameter("user_id");
			UserDao userDao=new UserDao();
			boolean flag=userDao.updateUserEmail(user_id, user_email, user_email_password);
			if(flag==true)
			{
				out.print("<h4 style='color:#FFFFFF;width:100%;border:2px;background-color:#F69C55;height:60px;'>User Email updated</h4>");
				rd=request.getRequestDispatcher("UserProfile.jsp");
				rd.include(request, response);
				
			}
			else
			{
				out.print("<h4 style='color:#FFFFFF;width:100%;border:2px;background-color:#F69C55;height:60px;'>User Email can't update</h4>");
				rd=request.getRequestDispatcher("UserProfile.jsp");
				rd.include(request, response);
				
			}
			
			 
		}
		
		if(requestType.equalsIgnoreCase("add_cc"))
		{
			Inventory_Recipients recipients=new Inventory_Recipients();
			String user_email,user_name,user_status;
			user_email=request.getParameter("user_email");
			user_name=request.getParameter("user_name");
			user_status=request.getParameter("user_status");
			recipients.setReciepient_name(user_name);
			recipients.setReciepient_email(user_email);
			recipients.setReciepient_status(user_status);
			
			Inventory_ReciepientsDao reciepientsDao=new Inventory_ReciepientsDao();
			int i=reciepientsDao.addReciepients(recipients);
			if(i>0)
			{
				out.print("<h4 style='color:#FFFFFF;width:100%;border:2px;background-color:#F69C55;height:60px;'>Recipients Added</h4>");
				rd=request.getRequestDispatcher("AddRecipient.jsp");
				rd.include(request, response);
				
			}
			else
			{
				out.print("<h4 style='color:#FFFFFF;width:100%;border:2px;background-color:#F69C55;height:60px;'>Recipients Failed to Add/h4>");
				rd=request.getRequestDispatcher("AddRecipient.jsp");
				rd.include(request, response);
				
			}
			
			 
		}
		
		if(requestType.equalsIgnoreCase("update_cc"))
		{
			Inventory_Recipients recipients=new Inventory_Recipients();
			String user_id,user_status;
			user_id=request.getParameter("user_id");
			user_status=request.getParameter("user_status");
			 Integer reciepientId=Integer.parseInt(user_id);
			
			Inventory_ReciepientsDao reciepientsDao=new Inventory_ReciepientsDao();
			int i=reciepientsDao.updateReciepientStatus(reciepientId, user_status);
			if(i>0)
			{
				out.print("<h4 style='color:#FFFFFF;width:100%;border:2px;background-color:#F69C55;height:60px;'>Recipients Added</h4>");
				rd=request.getRequestDispatcher("AddRecipient.jsp");
				rd.include(request, response);
				
			}
			else
			{
				out.print("<h4 style='color:#FFFFFF;width:100%;border:2px;background-color:#F69C55;height:60px;'>Recipients Failed to Add/h4>");
				rd=request.getRequestDispatcher("AddRecipient.jsp");
				rd.include(request, response);
				
			}
			
			 
		}
		if(requestType.equalsIgnoreCase("item_display"))
		{
			String id=request.getParameter("item_id");
			InventoryDao inventoryDao=new InventoryDao();
			List<Inventory_Item_Names> list=inventoryDao.getItemNamesById(Integer.parseInt(id));
			if(list!=null)
			{
				session=request.getSession();
				session.setAttribute("edit_list", list);
				rd=request.getRequestDispatcher("EditItem.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>Item  can't Edit</h4>");
				rd=request.getRequestDispatcher("DisplayItem.jsp");
				rd.include(request, response);
			}
			
			
			
		}
		if(requestType.equalsIgnoreCase("edit_item_description"))
		{
			String id=request.getParameter("item_id");
			String item_description=request.getParameter("item_description").trim();
			InventoryDao inventoryDao=new InventoryDao();
			
			Integer intId=Integer.parseInt(id);
			int i=inventoryDao.updateItemDescription(intId, item_description);
			if(i>0)
			{
				/*session=request.getSession();
				session.setAttribute("edit_list", list);*/
				out.println("<h4>Item description  updated sucess</h4>");
				rd=request.getRequestDispatcher("ManageItems.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>Item  can't update</h4>");
				rd=request.getRequestDispatcher("ManageItems.jsp");
				rd.include(request, response);
			}
			
			
			
		}
		
		
		//
		  
	}//End Post

}
