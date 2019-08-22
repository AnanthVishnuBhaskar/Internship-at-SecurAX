package com.inventory.bean;

public class Inventory_Item {
	
	private String	ITEM_ID;
	private int	ITEM_Type_ID;
	private	String ITEM_NAME;
	private	 String ITEM_TYPE;
	private int ITEM_QUANTITY;
	private	double ITEM_PRICE;
	public int getITEM_Type_ID() {
		return ITEM_Type_ID;
	}
	public void setITEM_Type_ID(int iTEM_Type_ID) {
		ITEM_Type_ID = iTEM_Type_ID;
	}
	private String	ITEM_DESCRIPTION ;
	private String	ITEM_ADDED_BY;
	public String getITEM_ID() {
		return ITEM_ID;
	}
	public void setITEM_ID(String iTEM_ID) {
		ITEM_ID = iTEM_ID;
	}
	public String getITEM_NAME() {
		return ITEM_NAME;
	}
	public void setITEM_NAME(String iTEM_NAME) {
		ITEM_NAME = iTEM_NAME;
	}
	public String getITEM_TYPE() {
		return ITEM_TYPE;
	}
	public void setITEM_TYPE(String iTEM_TYPE) {
		ITEM_TYPE = iTEM_TYPE;
	}
	public int getITEM_QUANTITY() {
		return ITEM_QUANTITY;
	}
	public void setITEM_QUANTITY(int iTEM_QUANTITY) {
		ITEM_QUANTITY = iTEM_QUANTITY;
	}
	public double getITEM_PRICE() {
		return ITEM_PRICE;
	}
	public void setITEM_PRICE(double iTEM_PRICE) {
		ITEM_PRICE = iTEM_PRICE;
	}
	public String getITEM_DESCRIPTION() {
		return ITEM_DESCRIPTION;
	}
	public void setITEM_DESCRIPTION(String iTEM_DESCRIPTION) {
		ITEM_DESCRIPTION = iTEM_DESCRIPTION;
	}
	public String getITEM_ADDED_BY() {
		return ITEM_ADDED_BY;
	}
	public void setITEM_ADDED_BY(String iTEM_ADDED_BY) {
		ITEM_ADDED_BY = iTEM_ADDED_BY;
	}



}
