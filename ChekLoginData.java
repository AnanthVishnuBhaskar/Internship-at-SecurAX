package com.inventory.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.inventory.bean.UserCredendials;
import com.inventory.dao.InventoryDao;
import com.inventory.dao.UserDao;
import com.inventory.ws.FetchUserData;

/**
 * Servlet implementation class ChekLoginData
 */
@WebServlet("/ChekLoginData")
public class ChekLoginData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	 doPost(req, resp);
    }
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String requestType=request.getParameter("request");
		HttpSession session=request.getSession();
        PrintWriter out=response.getWriter();
		
		response.setContentType("text/html");
		
	if(requestType.equalsIgnoreCase("login"))
	{
		 
			 
			String userStatus="1";
		 
			
			
			String userId=request.getParameter("form-username");
			String password=request.getParameter("form-password");
			UserDao userDao=new UserDao();
			String userName=userDao.checkUserCredential(userId, password);
			System.out.println("Data : "+userName);
			if(userName!=null && userName.length()>2)
			{
				String split[]=userName.split(":");
				
				String Id=split[0];
				String name=split[1];
				String type=split[2];
				String status=split[3];
				
				if(type.equalsIgnoreCase("ADMIN"))
				{
					userStatus="3";
				}
				else if(type.equalsIgnoreCase("SM"))
				{
					userStatus="2";
				}
				else
				{
					userStatus="1";
				}
				
				/*if(userId.equalsIgnoreCase("40040") || userId.equalsIgnoreCase("50008"))
				{
					userStatus="3";
				}
				if(userId.equalsIgnoreCase("40038"))
				{
					userStatus="2";
				}*/
				
		
				session.setAttribute("userId", Id);
				session.setAttribute("userName", name);
				session.setAttribute("userStatus", status);
				
				if(!userStatus.equalsIgnoreCase("1")) //if user status not 1
				{
					RequestDispatcher rd=request.getRequestDispatcher("ManageItems.jsp");
					 
					rd.forward(request, response);
				}
				else
				{
					RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");
					 
					rd.forward(request, response);
				}
			}
		 else
			{
			     //returning to login page if credentials are wrong
				session.setAttribute("msg", "user does't Exist");
				RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
						 
						rd.forward(request, response);
						
			}
			
			
			
		}//End login stuff
	
	if(requestType.equalsIgnoreCase("updatePassword"))
	{
		//session.setAttribute("msg", "user does't Exist");
		UserDao userDao=new UserDao();
		String userId=request.getParameter("user_id");
		String newPassword=request.getParameter("user_password");
		
		boolean status=userDao.updateUserPassword(userId, newPassword);
		if(status==true)
		{
			RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
			out.print("<h4 style='color:#FFFFFF;width:100%;border:2px;background-color:#F69C55;height:60px;'>Password has changed,please Login with New Password</h4>");
			rd.include(request, response);
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("ManageItems.jsp");
			out.print("<h4 style='color:#FFFFFF;width:100%;border:2px;background-color:#F69C55;height:60px;'>Password has changed,please Login with New Password</h4>");
			rd.include(request, response);
		}
		
		
	}
	
	
	
	
	}//end post

}
