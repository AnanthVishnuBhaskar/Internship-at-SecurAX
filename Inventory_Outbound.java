package com.inventory.bean;

import java.util.Date;

public class Inventory_Outbound 
{

	
	private int OUTBOUND_ID;
	private Date OUTBOUND_DATE;
	private String OUTBOUND_STATUS;
	private String ITEM_TYPE;
	private double ITEM_PRICE;
	private int ITEM_QTY;
	private String ITEM_ID;
	private String ITEM_DESC;
	private String OUTBOUND_EDITABLE;
	 
	 
	public String getOUTBOUND_EDITABLE() {
		return OUTBOUND_EDITABLE;
	}
	public void setOUTBOUND_EDITABLE(String oUTBOUND_EDITABLE) {
		OUTBOUND_EDITABLE = oUTBOUND_EDITABLE;
	}
	public String getITEM_TYPE() {
		return ITEM_TYPE;
	}
	public void setITEM_TYPE(String iTEM_TYPE) {
		ITEM_TYPE = iTEM_TYPE;
	}
	public double getITEM_PRICE() {
		return ITEM_PRICE;
	}
	public void setITEM_PRICE(double iTEM_PRICE) {
		ITEM_PRICE = iTEM_PRICE;
	}
	public int getITEM_QTY() {
		return ITEM_QTY;
	}
	public void setITEM_QTY(int iTEM_QTY) {
		ITEM_QTY = iTEM_QTY;
	}
	public String getITEM_ID() {
		return ITEM_ID;
	}
	public void setITEM_ID(String iTEM_ID) {
		ITEM_ID = iTEM_ID;
	}
	public String getITEM_DESC() {
		return ITEM_DESC;
	}
	public void setITEM_DESC(String iTEM_DESC) {
		ITEM_DESC = iTEM_DESC;
	}
	private int 	OUTBOUND_DETAILS_ID ;
	//private int OUTBOUND_ID;
	private String	ITEM_FOR_CLIENT  ;
	/*private String UNKNOWN1;
	private String UNKNOWN2;*/
	private String	OUTBOUND_COMMENTS;
	private String	OUTBOUND_SERIAL_NUMBER ;
	private String dateTostring;
	public String getDateTostring() {
		return dateTostring;
	}
	public void setDateTostring(String dateTostring) {
		this.dateTostring = dateTostring;
	}
	public int getOUTBOUND_ID() {
		return OUTBOUND_ID;
	}
	public void setOUTBOUND_ID(int oUTBOUND_ID) {
		OUTBOUND_ID = oUTBOUND_ID;
	}
	public Date getOUTBOUND_DATE() {
		return OUTBOUND_DATE;
	}
	public void setOUTBOUND_DATE(Date oUTBOUND_DATE) {
		OUTBOUND_DATE = oUTBOUND_DATE;
	}
	public String getOUTBOUND_STATUS() {
		return OUTBOUND_STATUS;
	}
	public void setOUTBOUND_STATUS(String oUTBOUND_STATUS) {
		OUTBOUND_STATUS = oUTBOUND_STATUS;
	}
	public int getOUTBOUND_DETAILS_ID() {
		return OUTBOUND_DETAILS_ID;
	}
	public void setOUTBOUND_DETAILS_ID(int oUTBOUND_DETAILS_ID) {
		OUTBOUND_DETAILS_ID = oUTBOUND_DETAILS_ID;
	}
	public String getITEM_FOR_CLIENT() {
		return ITEM_FOR_CLIENT;
	}
	public void setITEM_FOR_CLIENT(String iTEM_FOR_CLIENT) {
		ITEM_FOR_CLIENT = iTEM_FOR_CLIENT;
	}
	public String getOUTBOUND_COMMENTS() {
		return OUTBOUND_COMMENTS;
	}
	public void setOUTBOUND_COMMENTS(String oUTBOUND_COMMENTS) {
		OUTBOUND_COMMENTS = oUTBOUND_COMMENTS;
	}
	public String getOUTBOUND_SERIAL_NUMBER() {
		return OUTBOUND_SERIAL_NUMBER;
	}
	public void setOUTBOUND_SERIAL_NUMBER(String oUTBOUND_SERIAL_NUMBER) {
		OUTBOUND_SERIAL_NUMBER = oUTBOUND_SERIAL_NUMBER;
	}

	
	

}
