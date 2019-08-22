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

import com.inventory.bean.Inventory_Inbound;
import com.inventory.bean.Inventory_Item;
import com.inventory.bean.Inventory_Outbound;
import com.inventory.bean.Inventory_Po_Reporters;
import com.inventory.bean.Inventory_Status;
import com.inventory.bean.Inventory_Users;
import com.inventory.dao.InboundDao;
import com.inventory.dao.InventoryDao;
import com.inventory.dao.InventoryStatusDao;
import com.inventory.dao.Inventory_Po_ReportersDao;
import com.inventory.dao.OutboundDao;
import com.inventory.dao.UserDao;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	 protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    	// TODO Auto-generated method stub
	    	 doPost(req, resp);
	    }
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		String requestType=request.getParameter("request");
		//String requestTypeForDelete=request.getParameter("request_delete");
		System.out.println("Controller : "+requestType);
		HttpSession session=null;
		PrintWriter out=response.getWriter();
		
		response.setContentType("text/html");
		
		 
		if(requestType.equalsIgnoreCase("addItem"))
		{
			System.out.println(requestType);
			
			String itemId,itemName,itemType,itemQuantity,itemPrice,itemDescription,itemAddedBy; 
			
			itemId=request.getParameter("item_id");
			itemName=request.getParameter("item_name");
			itemType=request.getParameter("item_type");
			itemQuantity=request.getParameter("item_quantity");
			Integer itemQuantitytoInt=Integer.parseInt(itemQuantity);
			itemPrice=request.getParameter("item_price");
			Double itemPriceToDouble=Double.parseDouble(itemPrice);
			
			itemDescription=request.getParameter("item_description");
			itemAddedBy=request.getParameter("item_added_by");
			Inventory_Item inventory_Item=new Inventory_Item();
			InventoryDao inventoryDao=new InventoryDao();
			
			inventory_Item.setITEM_ID(itemId);
			inventory_Item.setITEM_NAME(itemName);
			inventory_Item.setITEM_TYPE(itemType);
			
			inventory_Item.setITEM_QUANTITY(itemQuantitytoInt);
			inventory_Item.setITEM_PRICE(itemPriceToDouble);
			inventory_Item.setITEM_DESCRIPTION(itemDescription);
			inventory_Item.setITEM_ADDED_BY(itemAddedBy);
			int i=inventoryDao.addItem(inventory_Item);
			
			if(i>0)
			{
				response.setContentType("text/html");
				RequestDispatcher rd=request.getRequestDispatcher("ManageItems.jsp");
				out.print("<h4 style='color:#FFFFFF;width:100%;border:2px;background-color:#F69C55;height:60px;'>Item Added sucessfully</h4>");
				rd.include(request, response);

			}
			else
			{
				 out=response.getWriter();
				out.println("<h4>Item can't Add</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("AddItem.jsp");
				rd.forward(request, response);
			}
			
			
			
			
		}
		if(requestType.equalsIgnoreCase("addItemType"))
		{
			System.out.println(requestType);
			
			String itemAddedBy=request.getParameter("item_added_by");

			String itemType=request.getParameter("item_type");
			Inventory_Item inventory_Item=new Inventory_Item();
			inventory_Item.setITEM_TYPE(itemType);
			inventory_Item.setITEM_ADDED_BY(itemAddedBy);
			InventoryDao dao=new InventoryDao();
			int i=dao.addItemType(inventory_Item);
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("ManageItems.jsp");
				rd.forward(request, response);
			}
			else
			{
				out=response.getWriter();
				out.println("<h4>Item type can't Add</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("ManageItems.jsp");
				rd.include(request, response);
			}
		}
		
		//System.out.println("Done");
		if(requestType.equalsIgnoreCase("item_display"))
		{
			System.out.println(requestType);
			String id=request.getParameter("item_id");
			Integer Id=Integer.parseInt(id);
			InventoryDao dao=new InventoryDao();
			//List list=dao.getItemById(id);
			List list=dao.getItemNamesById(Id);
			if(list!=null)
			{
				session=request.getSession();
				session.setAttribute("edit_list", list);
				RequestDispatcher rd=request.getRequestDispatcher("DisplayItem.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>Item  can't Display</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("ManageItems.jsp");
				rd.include(request, response);
			}
			
		}
		if(requestType.equalsIgnoreCase("editItem"))
		{
			System.out.println(requestType);
			String id=request.getParameter("item_id");
			InventoryDao dao=new InventoryDao();
			List list=dao.getItemById(id);
			if(list!=null)
			{
				session=request.getSession();
				session.setAttribute("edit_list", list);
				RequestDispatcher rd=request.getRequestDispatcher("EditItem.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>Item  can't Edit</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("DisplayItem.jsp");
				rd.include(request, response);
			}
			
		}
		if(requestType.equalsIgnoreCase("delete_item"))
		{
			System.out.println(requestType);
			String id=request.getParameter("item_id_delete");
			InventoryDao dao=new InventoryDao();
			Inventory_Item item=new Inventory_Item();
			item.setITEM_ID(id);
			int status=dao.deleteItemById(item);
			if(status>0)
			{
				session=request.getSession();
				
				RequestDispatcher rd=request.getRequestDispatcher("ManageItems.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>Item  can't Delete</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("ManageItems.jsp");
				rd.include(request, response);
			}
			
		}
		
		if(requestType.equalsIgnoreCase("fromEdit"))
		{
			System.out.println(requestType);
			String id=request.getParameter("item_id");

			String itemName,itemType,itemQuantity,itemPrice,itemDescription; 
			 
			itemName=request.getParameter("item_name");
			itemType=request.getParameter("item_type");
			itemQuantity=request.getParameter("item_quantity");
			Integer itemQuantitytoInt=Integer.parseInt(itemQuantity);
			itemPrice=request.getParameter("item_price");
			Double itemPriceToDouble=Double.parseDouble(itemPrice);
			
			itemDescription=request.getParameter("item_description");
		 
			
			
			
			Inventory_Item inventory_Item=new Inventory_Item();
			 
			inventory_Item.setITEM_NAME(itemName);
			inventory_Item.setITEM_TYPE(itemType);
			
			inventory_Item.setITEM_QUANTITY(itemQuantitytoInt);
			inventory_Item.setITEM_PRICE(itemPriceToDouble);
			inventory_Item.setITEM_DESCRIPTION(itemDescription);
			
			InventoryDao dao=new InventoryDao();
			int i=dao.updateItem(inventory_Item,id);
			if(i>0)
			{
				session=request.getSession();
				List list=dao.getItemById(id);
				session.setAttribute("edit_list", list);
				RequestDispatcher rd=request.getRequestDispatcher("DisplayItem.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>Item  can't Edit</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("EditItem.jsp");
				rd.include(request, response);
			}//from_user_Edit
			
		}
		
		 if(requestType.equalsIgnoreCase("add_reporter"))
		{
			 Inventory_Po_ReportersDao dao=new Inventory_Po_ReportersDao();
			 Inventory_Po_Reporters reporters=new Inventory_Po_Reporters();
			 
			String userId,userName,userEmail; 
			
			userId=request.getParameter("user_id");
			userName=request.getParameter("user_name");
			userEmail=request.getParameter("user_email");
			
			reporters.setReporterUserName(userId);
			reporters.setReporterFirstName(userName);
			reporters.setReporterEmail(userEmail);
		 
			 
			int i=dao.addRepoter(reporters);
			
			if(i>0)
			{
				System.out.println("Called");
				RequestDispatcher rd=request.getRequestDispatcher("ManagePoReporters.jsp");
				rd.forward(request, response);
			}
			else
			{
				 out=response.getWriter();
				out.println("<h4>user can't Add</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("AddReporter.jsp");
				rd.include(request, response);
			}
			
			
		}
		
		 
		/*if(requestType.equalsIgnoreCase("user_display"))
		{
			System.out.println(requestType);
			String id=request.getParameter("user_id");
			UserDao dao=new UserDao();
			List list=dao.getUserById(id);
			if(list!=null)
			{
				session=request.getSession();
				session.setAttribute("user_single", list);
				RequestDispatcher rd=request.getRequestDispatcher("DisplyUser.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>user  can't Display</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("ManageUser.jsp");
				rd.include(request, response);
			}
			
		}*/
		
		// user data to edit
		
		/*if(requestType.equalsIgnoreCase("edit_user"))
		{
			//System.out.println(requestType);
			 
			String id=request.getParameter("user_id");
			UserDao dao=new UserDao();
			List list=dao.getUserById(id);
			if(list!=null)
			{
				session=request.getSession();
				session.setAttribute("edit_user_list", list);
				RequestDispatcher rd=request.getRequestDispatcher("EditUser.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>user  can't Edit</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("ManageUser.jsp");
				rd.include(request, response);
			} 
			
			
			
		}*/
		
		/*if(requestType.equalsIgnoreCase("from_user_Edit"))
		{
			
			String id=request.getParameter("user_id");

			String userName,userType,userEmail,userPhone,userStatus; 
			 
			userName=request.getParameter("user_name");
			userType=request.getParameter("user_type");
			userEmail=request.getParameter("user_email");
			
			userPhone=request.getParameter("user_phone");
			
			
			userStatus=request.getParameter("user_status");
	
			Inventory_Users user=new Inventory_Users();
			user.setUser_name(userName);
			user.setUser_type(userType);
			user.setUser_email(userEmail);
			user.setUser_phone(userPhone);
			user.setUser_status(userStatus);
			
			
	 
			UserDao dao=new UserDao();
			int i=dao.updateUserData(user,id);
			if(i>0)
			{
				session=request.getSession();
				List list=dao.getUserById(id);
				session.setAttribute("user_single", list);
				RequestDispatcher rd=request.getRequestDispatcher("DisplyUser.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>Item  can't Edit</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("EditItem.jsp");
				rd.include(request, response);
			}//
			
		}
		*/
		//To Delete user
		
		/*if(requestType.equalsIgnoreCase("delete_user"))
		{
			System.out.println(requestType);
			String id=request.getParameter("user_id_delete");
			UserDao dao=new UserDao();
			Inventory_Users user=new Inventory_Users();
			user.setUser_id(id);
			int status=dao.deleteItemById(user);
			if(status>0)
			{
				//session=request.getSession();
				
				RequestDispatcher rd=request.getRequestDispatcher("ManageUsers.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>Item  can't Delete</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("ManageUsers.jsp");
				rd.include(request, response);
			}
			
		}
*/
		
		/*Controller For ItemType Module*/
		
		//To display single ItemType
		
		if(requestType.equalsIgnoreCase("item_type_display"))
		{
			//System.out.println(requestType);
			String id=request.getParameter("item_type_id");
			Integer itemTypeId=Integer.parseInt(id);
			InventoryDao dao=new InventoryDao();
			List list=dao.getItemTypeById(itemTypeId);
			if(list!=null)
			{
				session=request.getSession();
				session.setAttribute("item_type_single", list);
				RequestDispatcher rd=request.getRequestDispatcher("DisplayItemType.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>Iem  can't Display</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("ManageItemType.jsp");
				rd.include(request, response);
			}
			
			
			
			
			
			
		}
		
		//edit single ItemType
		
		if(requestType.equalsIgnoreCase("edit_Item_Type"))
		{
			//System.out.println(requestType);
			String id=request.getParameter("item_type_id");
			Integer itemTypeId=Integer.parseInt(id);
			InventoryDao dao=new InventoryDao();
			List<Inventory_Item> list=dao.getItemTypeById(itemTypeId);
			
			String itemTypeName=null;
			for(Inventory_Item itemType:list)
			{
				itemTypeName=itemType.getITEM_TYPE().trim();
				//checkItemTypeToEdit()	
			}
			
			List<String> itemTypeFromDb=dao.checkItemTypeToEdit(itemTypeName);
			/*for(String s:itemTypeFromDb)
			{
				System.out.println("val : "+s);
			}*/
			/*System.out.println("itemTypeFromDb.size() : "+itemTypeFromDb.size());*/
			
			if(itemTypeFromDb.size()==0)
			{
				session=request.getSession();
				session.setAttribute("item_type_single", list);
				RequestDispatcher rd=request.getRequestDispatcher("EditItemType.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<div style='width:100%;color:#FFFFFF;background-color:red'><h4>item type  can't Edit beacuse its used by some other table </h4></div>");
				RequestDispatcher rd=request.getRequestDispatcher("ManageItemType.jsp");
				rd.include(request, response);
			}
			
			
			
			
			
			
		}
		//fromEditItemType
		if(requestType.equalsIgnoreCase("from_EditItem_Type"))
		{
			
			String id=request.getParameter("item_type_id");
			Integer itemTypeId=Integer.parseInt(id);
			String ItemType; 
			 
			ItemType=request.getParameter("item_type");
			  
			Inventory_Item item=new Inventory_Item();
			item.setITEM_TYPE(ItemType);
	 
			InventoryDao dao=new InventoryDao();
			int i=dao.updateItemType(item, itemTypeId);
			if(i>0)
			{
				session=request.getSession();
				List list=dao.getItemTypeById(itemTypeId);
				session.setAttribute("item_type_single", list);
				RequestDispatcher rd=request.getRequestDispatcher("DisplayItemType.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>Item  can't Edit</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("EditItem.jsp");
				rd.include(request, response);
			}//
			
		}

	
		// 
		
		if(requestType.equalsIgnoreCase("delete_item_type"))
		{
			System.out.println(requestType);
			String id=request.getParameter("item_id_delete");
			Integer itemTypeId=Integer.parseInt(id);
			InventoryDao dao=new InventoryDao();
			Inventory_Item item=new Inventory_Item();
			item.setITEM_Type_ID(itemTypeId);
			
			//InventoryDao dao=new InventoryDao();
			List<Inventory_Item> list=dao.getItemTypeById(itemTypeId);
			
			String itemTypeName=null;
			for(Inventory_Item itemType:list)
			{
				itemTypeName=itemType.getITEM_TYPE().trim();
				//checkItemTypeToEdit()	
			}
			
			List<String> itemTypeFromDb=dao.checkItemTypeToEdit(itemTypeName);
			/*for(String s:itemTypeFromDb)
			{
				System.out.println("val : "+s);
			}
			System.out.println("itemTypeFromDb.size() : "+itemTypeFromDb.size());
			*/
			if(itemTypeFromDb.size()==0)
			{
			 
				//session=request.getSession();
				int status=dao.deleteItemTypeById(item);
				//System.out.println("I m going to Delete");
				RequestDispatcher rd=request.getRequestDispatcher("ManageItemType.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<div style='width:100%;color:#FFFFFF;background-color:red'><h4>item type  can't Delete beacuse its used by some other table </h4></div>");
				RequestDispatcher rd=request.getRequestDispatcher("ManageItemType.jsp");
				rd.include(request, response);
			}
			
		}
		
		
		if(requestType.equalsIgnoreCase("add_status"))
		{
			System.out.println(requestType);
			
			String statusName,statusType,statusAddedBy,isValid; 
			
			statusName=request.getParameter("status_name");
			statusType=request.getParameter("status_type");
			isValid=request.getParameter("status_availability");
			statusAddedBy=request.getParameter("status_added_by");
			
			Inventory_Status status=new Inventory_Status();
			status.setSTATUS_NAME(statusName);
			status.setSTATUS_TYPE(statusType);
			status.setSTATUS_AVAILABILITY(isValid);
			status.setSTATUS_ADDED_BY(statusAddedBy);
			
			InventoryStatusDao dao=new InventoryStatusDao();
			int i=dao.addStatus(status);
			
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("ManageInventoryStatus.jsp");
				rd.forward(request, response);
			}
			else
			{
				 out=response.getWriter();
				out.println("<h4>Status can't Add</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("AddInventoryStatus.jsp");
				rd.include(request, response);
			}
			
			
			
			
		}
		
		// To display Single Inventory Status
		
		

		if(requestType.equalsIgnoreCase("status_display"))
		{
			//System.out.println(requestType);
			String id=request.getParameter("status_id");
			Integer statusId=Integer.parseInt(id);
			
			InventoryStatusDao dao=new InventoryStatusDao();
			List list=dao.getInventoryStatusById(statusId);
			if(list!=null)
			{
				session=request.getSession();
				session.setAttribute("inventory_status_single", list);
				RequestDispatcher rd=request.getRequestDispatcher("DisplayInventoryStatus.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>Iem  can't Display</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("ManageItemType.jsp");
				rd.include(request, response);
			}
			
			
			
			
			
			
		}
		
		if(requestType.equalsIgnoreCase("editInventoryStatus"))
		{
			String id=request.getParameter("status_id");
			//System.out.println("here : "+id);
			Integer statusId=Integer.parseInt(id);
			String statusNameToCheck=null;
			
			InventoryStatusDao dao=new InventoryStatusDao();
			List<Inventory_Status>list=dao.getInventoryStatusById(statusId);
			for(Inventory_Status statusName:list)
			{
				statusNameToCheck=statusName.getSTATUS_NAME().trim();
			}
			//System.out.println("statusNameToCheck : "+statusNameToCheck);
			
			String resultInbound=dao.checkInboundInventoryStatusToEdit(statusNameToCheck);
			String resultOutbound=dao.checkOutboundInventoryStatusToEdit(statusNameToCheck);
			
			if(resultInbound==null && resultOutbound==null)
			{
			
				if(list!=null)
				{
					session=request.getSession();
					session.setAttribute("inventory_status_single", list);
					RequestDispatcher rd=request.getRequestDispatcher("EditInventoryStatus.jsp");
					rd.forward(request, response);
				}
			}
			
			else
			{
				out.println("<div style='width:100%;color:#FFFFFF;background-color:red'><h4>Status  can't Edit beacuse its used by some other table </h4></div>");
				RequestDispatcher rd=request.getRequestDispatcher("DisplayInventoryStatus.jsp");
				rd.include(request, response);
			}
			
			
			
			
		}

		if(requestType.equalsIgnoreCase("fromEditStatus"))
		{
			String id,statusName,statusType,isStatus;
			 id=request.getParameter("status_id");
		 
			 statusName=request.getParameter("status_name");
			 isStatus=request.getParameter("is_compleated");
			 
			 
			// System.out.println("statt name : "+statusName);
			 statusType=request.getParameter("status_type");
			Integer statusId=Integer.parseInt(id);
			
			Inventory_Status status=new Inventory_Status();
			status.setSTATUS_ID(statusId);
			status.setSTATUS_NAME(statusName);
			status.setSTATUS_TYPE(statusType);
			status.setSTATUS_AVAILABILITY(isStatus);
			
			InventoryStatusDao dao=new InventoryStatusDao();
			int i=dao.updateInventoryStatus(status);
			if(i>0)
			{
				session=request.getSession();
				List list=dao.getInventoryStatusById(statusId);
				session.setAttribute("inventory_status_single", list);
				RequestDispatcher rd=request.getRequestDispatcher("DisplayInventoryStatus.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>Item  can't Edit</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("EditItem.jsp");
				rd.include(request, response);
			}//
			
		} 
		
		// To delete inventory ststus type
		
		if(requestType.equalsIgnoreCase("delete_status"))
		{
			System.out.println(requestType);
			String id=request.getParameter("status_id_delete");
			Integer statusId=Integer.parseInt(id);
			String statusNameToCheck=null;
			InventoryStatusDao dao1=new InventoryStatusDao();
			List<Inventory_Status>list=dao1.getInventoryStatusById(statusId);
			for(Inventory_Status statusName:list)
			{
				statusNameToCheck=statusName.getSTATUS_NAME().trim();
			}
			System.out.println("statusNameToCheck : "+statusNameToCheck);
			String resultInbound=dao1.checkInboundInventoryStatusToEdit(statusNameToCheck);
			String resultOutbound=dao1.checkOutboundInventoryStatusToEdit(statusNameToCheck);
			
			if(resultInbound==null && resultOutbound==null)
			{
				
				InventoryStatusDao dao=new InventoryStatusDao();
				 Inventory_Status status1=new Inventory_Status();
				 status1.setSTATUS_ID(statusId);
				int status=dao.deleteInventoryStatusById(status1);
				if(status>0)
				{
					session=request.getSession();
					
					RequestDispatcher rd=request.getRequestDispatcher("ManageInventoryStatus.jsp");
					rd.forward(request, response);
				}
				
			}
			else
			{
				out.println("<div style='width:100%;color:#FFFFFF;background-color:red'><h4>Status  can't Delete beacuse its used by some other table </h4></div>");
				RequestDispatcher rd=request.getRequestDispatcher("DisplayInventoryStatus.jsp");
				rd.include(request, response);
			}
		}
		
		 
		/*if(requestType.equalsIgnoreCase("add_user_status"))
		{
			System.out.println(requestType);
			
			String user_status_name;
			user_status_name=request.getParameter("status_name");
			
			Inventory_Users user=new Inventory_Users();
			user.setUser_status(user_status_name);
			UserDao dao=new UserDao();
			int i=dao.addUserStatus(user);
			if(i>0)
			{
				//session=request.getSession();
				RequestDispatcher rd=request.getRequestDispatcher("ManageUserStatus.jsp");
				rd.forward(request, response);
			
			}else
			{
				//session=request.getSession();
				RequestDispatcher rd=request.getRequestDispatcher("AddUserStatus.jsp");
				out.println("<h4>user status  can't Add</h4>");
				rd.include(request, response);
			}
			 
		}*/
		/*if(requestType.equalsIgnoreCase("user_status_display"))
		{
			String statusId;
			statusId=request.getParameter("status_id");
			Integer user_status_id=Integer.parseInt(statusId);
			
			Inventory_Users user=new Inventory_Users();
			//user.setUser_status(user_status_name);
			UserDao dao=new UserDao();
			List list=dao.getAllUserStatusById(user_status_id);
			if(list!=null)
			{
				session=request.getSession();
				session.setAttribute("user_status_single", list);
				RequestDispatcher rd=request.getRequestDispatcher("DisplayUserStatus.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>can't Display</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("ManageUserStatus.jsp");
				rd.include(request, response);
			}
			 
		}//
		if(requestType.equalsIgnoreCase("edit_user_status"))
		{
			String statusId;
			statusId=request.getParameter("status_id");
			Integer user_status_id=Integer.parseInt(statusId);
			
		//	Inventory_Users user=new Inventory_Users();
			//user.setUser_status(user_status_name);
			UserDao dao=new UserDao();
			List<Inventory_Users> list=dao.getAllUserStatusById(user_status_id);
			String UserStatusName=null;
			
			for(Inventory_Users userStatus:list)
			{
				UserStatusName=userStatus.getUser_status().trim();
			}
			
			System.out.println("Fro Db userStaus : "+UserStatusName);
		    boolean flag= dao.checkStatusAvailability(UserStatusName);
			if(flag==false)
			{
				session=request.getSession();
				session.setAttribute("user_status_single", list);
				RequestDispatcher rd=request.getRequestDispatcher("EditUserStatus.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<div style='width:100%;color:#FFFFFF;background-color:red'><h4>user can't Edit beacuse its used by some other table </h4></div>");
				RequestDispatcher rd=request.getRequestDispatcher("ManageUserStatus.jsp");
				rd.include(request, response);
			}
		}
		*/
		//updating user_status
		/*if(requestType.equalsIgnoreCase("from_edit_userStatus"))
		{
			String statusName=request.getParameter("status_name");
			String id=request.getParameter("status_id");
			Integer statusId=Integer.parseInt(id);
			Inventory_Users user=new Inventory_Users();
			user.setUser_status(statusName);
			UserDao dao=new UserDao();
			int i=dao.updateUserStatus(user,statusId);
			if(i>0)
			{
				session=request.getSession();
				List list=dao.getAllUserStatusById(statusId);
				session.setAttribute("user_status_single", list);
				RequestDispatcher rd=request.getRequestDispatcher("DisplayUserStatus.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>status  can't Edit</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("EditUserStatus.jsp");
				rd.include(request, response);
			}//
			
		}
		*/
		/*if(requestType.equalsIgnoreCase("delete_user_status"))
		{
			//String statusName=request.getParameter("status_name");
			String id=request.getParameter("status_id_delete");
			Integer statusId=Integer.parseInt(id);
			UserDao userDao=new UserDao();
			List<Inventory_Users> list=userDao.getAllUserStatusById(statusId);
			String UserStatusName=null;
			
			for(Inventory_Users userStatus:list)
			{
				UserStatusName=userStatus.getUser_status().trim();
			}
		    boolean flag= userDao.checkStatusAvailability(UserStatusName);
			
			
			Inventory_Users user=new Inventory_Users();
			user.setUser_status_id(statusId);
			UserDao dao=new UserDao();
			if(flag==false)
			{
				int i=dao.deleteUserStatusById(user);
				if(i>0)
				{
					//session=request.getSession();
					//List list=dao.getAllUserStatusById(statusId);
					//session.setAttribute("user_status_single", list);
					RequestDispatcher rd=request.getRequestDispatcher("ManageUserStatus.jsp");
					rd.forward(request, response);
				}
				else
				{
					out.println("<h4>status  can't Delete</h4>");
					RequestDispatcher rd=request.getRequestDispatcher("ManageUserStatus.jsp");
					rd.include(request, response);
				}
				
			}
			else
			{
				out.println("<div style='width:100%;color:#FFFFFF;background-color:red'><h4>user status can't Delete beacuse its used by some other table </h4></div>");
				RequestDispatcher rd=request.getRequestDispatcher("ManageUserStatus.jsp");
				rd.include(request, response);
			}
			
			//
			
		}*/
		
		if(requestType.equalsIgnoreCase("new_inbound"))
		{
			String modalName,vendor,serialNumber,comment,status,price,quantity,itemType,inBoundRequetedBy,editableStatus;
			modalName=request.getParameter("modal_name");
			vendor=request.getParameter("vendor_name");
			serialNumber=request.getParameter("item_serial_number");
			comment=request.getParameter("comments");
			price=request.getParameter("item_price");
			quantity=request.getParameter("inbound_quantity");
			inBoundRequetedBy=request.getParameter("inbound_requested_by");
			itemType=request.getParameter("inbound_item_type");
			status=request.getParameter("inbound_status");
			editableStatus=request.getParameter("editable_inbound_status");
			
			int itemQuantity;
			double itemPrice;
			itemPrice=Double.parseDouble(price);
			itemQuantity=Integer.parseInt(quantity);
			Date date=new Date();
			Inventory_Inbound inbound=new Inventory_Inbound();
			inbound.setMODEL_NAME(modalName);
			inbound.setVENDOR_NAME(vendor);
			inbound.setINBOUND_SERIAL_NUMBER(serialNumber);
			inbound.setINBOUND_COMMENTS(comment);
			inbound.setINBOUND_STATUS(status);
			inbound.setINBOUND_PRICE(itemPrice);
			inbound.setINBOUND_QUANTITY(itemQuantity);
			inbound.setINBOUND_ITEM_TYPE(itemType);
			inbound.setINBOUND_REQUESTED_BY(inBoundRequetedBy);
			inbound.setINBOUND_DATE(date);
			inbound.setINBOUND_EDITABLE_STATUS(editableStatus);
			InboundDao dao=new InboundDao();
			int i=dao.addInboundRequest(inbound);
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("ManageInboundRequest.jsp");
				rd.forward(request, response);
			}
			
		}
		
		if(requestType.equalsIgnoreCase("inbound_display"))
		{
			String inboundId=request.getParameter("inbound_id");
			Integer inboundIdToInt=Integer.parseInt(inboundId);
			
		//	Inventory_Users user=new Inventory_Users();
			//user.setUser_status(user_status_name);
			InboundDao dao=new InboundDao();
			List list=dao.getIBFullRequestDetailsById(inboundIdToInt);
			if(list!=null)
			{
				session=request.getSession();
				session.setAttribute("inbound_request_display", list);
				RequestDispatcher rd=request.getRequestDispatcher("DisplayInboundRequest.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>can't Display</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("ManageInboundRequest.jsp");
				rd.include(request, response);
			}
			
			
		}
		
		if(requestType.equalsIgnoreCase("edit_inbound_request"))
		{
			
			String inboundId=request.getParameter("inbound_request_id");
			//System.out.println("inboundId "+inboundId);
			
			Integer inboundIdToInt=Integer.parseInt(inboundId);
			
		//	Inventory_Users user=new Inventory_Users();
			//user.setUser_status(user_status_name);
			InboundDao dao=new InboundDao();
			List list=dao.getIBFullRequestDetailsById(inboundIdToInt);
			
			session=request.getSession();
			session.setAttribute("inbound_request_display_for_edit", list);
			RequestDispatcher rd=request.getRequestDispatcher("EditInboundRequest.jsp");
			rd.forward(request, response);
			
		}
		
		
		
		if(requestType.equalsIgnoreCase("From_Edit_inbound_request"))
		{
			String inBoundId=request.getParameter("edit_inbound_id");//inbound_id
			
			InboundDao dao=new InboundDao();
		 
			Integer inBoundIdToInt=Integer.parseInt(inBoundId);
			
		
			 
			
			String modalName,vendor,itemType,comment,status,price,quantity;
			modalName=request.getParameter("modal_name");
			vendor=request.getParameter("vendor_name");
		 
			price=request.getParameter("item_price");
			quantity=request.getParameter("inbound_quantity");
			status=request.getParameter("inbound_status").trim();
			System.out.println("status : "+status);
			String isStatus=dao.getIsCompleatedState(status);
			System.out.println(isStatus);
			
			String item_id=request.getParameter("edit_inbound_id");
			 
			itemType=request.getParameter("inbound_item_type");
			
			quantity=request.getParameter("inbound_quantity");
			Integer itemQuantitytoInt=Integer.parseInt(quantity);
		 
			
			
			price=request.getParameter("item_price");
			String description=request.getParameter("inbound_item_description");
			Double itemPriceToDouble=Double.parseDouble(price);
			String addedBy=request.getParameter("inbound_item_added_by");
			
			
			InboundDao inboundDao=new InboundDao();
			if(isStatus.equalsIgnoreCase("TRUE"))
			{
				
				
				//Adding item to inventory From INbound Request
				
		 
				Inventory_Item inventory_Item=new Inventory_Item();
				InventoryDao inventoryDao=new InventoryDao();
				
				inventory_Item.setITEM_ID(item_id);//id name,type,qua,prcice.desc,addedBy
				inventory_Item.setITEM_NAME(modalName);
				inventory_Item.setITEM_TYPE(itemType);
				
				inventory_Item.setITEM_QUANTITY(itemQuantitytoInt);
				inventory_Item.setITEM_PRICE(itemPriceToDouble);
				inventory_Item.setITEM_DESCRIPTION(description);
				inventory_Item.setITEM_ADDED_BY(addedBy);
				int i=inventoryDao.addItem(inventory_Item);
				inboundDao.setEditableValue(inBoundIdToInt);
				 
				
			}
				
				
			//	itemType=request.getParameter("inbound_item_type");
				
				int itemQuantity;
				double itemPrice;
				itemPrice=Double.parseDouble(price);
				itemQuantity=Integer.parseInt(quantity);
				//Date date=new Date();
				Inventory_Inbound inbound=new Inventory_Inbound();
				inbound.setMODEL_NAME(modalName);
				inbound.setVENDOR_NAME(vendor);
			//	inbound.setINBOUND_SERIAL_NUMBER(serialNumber);
				//inbound.setINBOUND_COMMENTS(comment);
				inbound.setINBOUND_STATUS(status);
				inbound.setINBOUND_PRICE(itemPrice);
				inbound.setINBOUND_QUANTITY(itemQuantity);
				
				
				
				
				
				 
				int i=dao.updateInboundRequest(inbound , inBoundIdToInt);
				if(i>0)
				{
					session=request.getSession();
					List list=dao.getIBFullRequestDetailsById(inBoundIdToInt);
					session.setAttribute("inbound_request_display", list);
					RequestDispatcher rd=request.getRequestDispatcher("DisplayInboundRequest.jsp");
					rd.forward(request, response);
				}
				else
				{
					out.println("<h4>status  can't Edit</h4>");
					RequestDispatcher rd=request.getRequestDispatcher("EditInboundRequest.jsp");
					rd.include(request, response);
				}//
			
		}
		
		
		if(requestType.equalsIgnoreCase("delete_inbound_request"))
		{
			String inBoundIdToDelete=request.getParameter("inbound_id_delete");
			InboundDao dao=new InboundDao();
			Integer inBoundIdToInt=Integer.parseInt(inBoundIdToDelete);
			System.out.println("inBoundIdToInt : "+inBoundIdToInt);
			
			int i=dao.deleteInboundRequestDetails(inBoundIdToInt);
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("ManageInboundRequest.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("ManageInboundRequest.jsp");
				rd.forward(request, response);
			}
			
		}
		
		
		//OUTBOUND REQUEST
	
		if(requestType.equalsIgnoreCase("new_outbound"))
		{
			String modalForClient,ItemType,serialNumber,comment,status,price,quantity,itemId,editableSatus,itemNameForClient;
			//modalForClient=request.getParameter("item_for_client");
			itemNameForClient=request.getParameter("item_name");
			itemId=request.getParameter("item_for_client");
			ItemType=request.getParameter("item_type");
			quantity=request.getParameter("quantity_for_client");
			
	
			
			
			serialNumber=request.getParameter("outbound_serial_number");
			comment=request.getParameter("outbound_comments");
			status=request.getParameter("outbound_status");
			InboundDao dao=new InboundDao();
			editableSatus=dao.getIsCompleatedState(status);
			price=request.getParameter("outbound_item_price");
			
			int itemQuantity=Integer.parseInt(quantity);
			double itemPrice=Double.parseDouble(price);
			 
			Date date=new Date();
			Inventory_Outbound outbound=new Inventory_Outbound();
			
			outbound.setITEM_ID(itemId);
			outbound.setITEM_FOR_CLIENT(itemNameForClient);
			outbound.setITEM_TYPE(ItemType);
			outbound.setOUTBOUND_STATUS(status);
			
			outbound.setITEM_QTY(itemQuantity);
			outbound.setITEM_PRICE(itemPrice);
			
			outbound.setOUTBOUND_SERIAL_NUMBER(serialNumber);
			
			outbound.setOUTBOUND_DATE(date);
			outbound.setOUTBOUND_COMMENTS(comment);
			outbound.setITEM_ID(itemId);
			outbound.setOUTBOUND_EDITABLE(editableSatus);
			
			OutboundDao outboundDao=new OutboundDao();
			 int i=outboundDao.addOutboundRequest(outbound);
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("ManageOutboundRequest.jsp");
				rd.forward(request, response);
			}
			
		}
		
		//OUTBOUND REQUEST
		
		if(requestType.equalsIgnoreCase("outbound_display"))
		{
			String outBoundId=request.getParameter("outbound_id");
			Integer outBoundIdToInt=Integer.parseInt(outBoundId);
			
		//	Inventory_Users user=new Inventory_Users();
			//user.setUser_status(user_status_name);
			OutboundDao dao=new OutboundDao();
			List list=dao.getOBFullRequestDetailsById(outBoundIdToInt);
			if(list!=null)
			{
				session=request.getSession();
				session.setAttribute("outbound_request_display", list);
				RequestDispatcher rd=request.getRequestDispatcher("DisplayOutboundRequest.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>can't Display</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("ManageOutboundRequest.jsp");
				rd.include(request, response);
			}
			
			
		}
		
		if(requestType.equalsIgnoreCase("edit_outbound_request"))
		{
			
			String outBoundId=request.getParameter("outbound_request_id");
			//System.out.println("OutboundId "+outBoundId);
			
			Integer outBoundIdToInt=Integer.parseInt(outBoundId);
		//	System.out.println("2 ");
			
		//	Inventory_Users user=new Inventory_Users();
			//user.setUser_status(user_status_name);
			OutboundDao dao=new OutboundDao();
			List list=dao.getOBFullRequestDetailsById(outBoundIdToInt);
			//System.out.println("3 ");
			
			session=request.getSession();
			session.setAttribute("outbound_request_display_for_edit", list);
			RequestDispatcher rd=request.getRequestDispatcher("EditOutboundRequest.jsp");
			rd.forward(request, response);
			
		}
		
		
		
		if(requestType.equalsIgnoreCase("From_Edit_outbound_request"))//
		{
			String outBoundId=request.getParameter("edit_outbound_id");//inbound_id
			
			OutboundDao dao=new OutboundDao();
		 
			Integer outBoundIdToInt=Integer.parseInt(outBoundId);
			 
			
			String itemId,status,price,quantity,description,serialNumber,itemName;
			
			itemId=request.getParameter("item_for_client");
			itemName=request.getParameter("item_name");
			
			String itemType=request.getParameter("item_type");
			status=request.getParameter("outbound_status").trim(); 
			
			price=request.getParameter("item_price");
			Double itemPrice=Double.parseDouble(price);
			
			quantity=request.getParameter("quantity_for_client").trim();
			int itemQuantity=Integer.parseInt(quantity);
			
			serialNumber=request.getParameter("item_serial_number").trim();
			
			description=request.getParameter("item_comment");
			
			String addedBy=request.getParameter("added_by");
			
			 
			
			
		 
			Inventory_Outbound outbound=new Inventory_Outbound();
			 
	 
			 String editableStatus="FALSE";
			
			//here
			InboundDao inBoundDao=new InboundDao();
			
		 	String isStatus=inBoundDao.getIsCompleatedState(status);
			System.out.println(isStatus);
			
			 
			
			
			OutboundDao outboundDao=new OutboundDao();
			InventoryDao inventoryItem=new InventoryDao();
			if(isStatus.equalsIgnoreCase("TRUE"))
			{
				
				String remainingQuantityOfItem=request.getParameter("remaining_quantity_in_item");
				System.out.println("remainingQuantityOfItem : "+remainingQuantityOfItem);
				int remainingQuantityOfItemToInt=Integer.parseInt(remainingQuantityOfItem);
			 
				
				
			//	System.out.println("Item id : "+itemId);
				inventoryItem.updateItemQuantityFromOutboundRequest(remainingQuantityOfItemToInt, itemId);
				 
			//	outboundDao.setEditableValue(outBoundIdToInt);
				editableStatus="TRUE";
				System.out.println("Done");
				
			}
				
			//Setting Outbound Item  values
				 
			
			 
			outbound.setITEM_FOR_CLIENT(itemName);
			outbound.setITEM_ID(itemId);
			outbound.setITEM_TYPE(itemType);
			
			outbound.setOUTBOUND_STATUS(status);
			outbound.setITEM_PRICE(itemPrice);
			outbound.setITEM_QTY(itemQuantity);
			
			outbound.setOUTBOUND_SERIAL_NUMBER(serialNumber);
			outbound.setITEM_DESC(description);
			outbound.setOUTBOUND_EDITABLE(editableStatus);
			
		 
			int i=dao.updateOutboundRequest(outbound, outBoundIdToInt);
			if(i>0)
			{
				session=request.getSession();
				List list=dao.getOBFullRequestDetailsById (outBoundIdToInt);
				session.setAttribute("outbound_request_display", list);
				RequestDispatcher rd=request.getRequestDispatcher("DisplayOutboundRequest.jsp");
				rd.forward(request, response);
			}
			else
			{
				out.println("<h4>status  can't Edit</h4>");
				RequestDispatcher rd=request.getRequestDispatcher("EditInboundRequest.jsp");
				rd.include(request, response);
			}
		
		}
		
		
		if(requestType.equalsIgnoreCase("delete_outbound_request"))
		{
			String inBoundIdToDelete=request.getParameter("outbound_id_delete");
			OutboundDao dao=new OutboundDao();
			Integer outBoundIdToInt=Integer.parseInt(inBoundIdToDelete);
			System.out.println("outBoundIdToDelete  : "+outBoundIdToInt);
			
			int i=dao.deleteOutboundRequestDetails(outBoundIdToInt);
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("ManageOutboundRequest.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("ManageOutboundRequest.jsp");
				rd.forward(request, response);
			}
			
		}
	
		
		
		
		
		
		
		
		
		
	}//method end new_outbound
	
	
	
	
	
	
	
	
	
	
	
	
	

}
