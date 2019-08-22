package com.inventory.bean;

public class Inventory_Users
{

	private int userId;
	private String  userName;
	private String  userFirstName;
	
	public final int getUserId() {
		return userId;
	}
	public final void setUserId(int userId) {
		this.userId = userId;
	}
	public final String getUserName() {
		return userName;
	}
	public final void setUserName(String userName) {
		this.userName = userName;
	}
	public final String getUserFirstName() {
		return userFirstName;
	}
	public final void setUserFirstName(String userFirstName) {
		this.userFirstName = userFirstName;
	}
	public final String getUserType() {
		return userType;
	}
	public final void setUserType(String userType) {
		this.userType = userType;
	}
	public final String getUserStatus() {
		return userStatus;
	}
	public final void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	public final String getUserPasword() {
		return userPasword;
	}
	public final void setUserPasword(String userPasword) {
		this.userPasword = userPasword;
	}
	private String  userType;
	private String  userStatus;
	private String  userPasword;
	
}
