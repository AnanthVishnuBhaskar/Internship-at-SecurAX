package com.inventory.bean;

import java.util.Date;

public class Inventory_Inbound

{

	private int INBOUND_ID;
	private Date INBOUND_DATE;
	private String INBOUND_STATUS;
	private String dateTostring;
	private String MODEL_NAME;
	private String VENDOR_NAME;
	private int INBOUND_QUANTITY;
	private Double INBOUND_PRICE;
	private String INBOUND_SERIAL_NUMBER;
	private String INBOUND_COMMENTS;
	
	private String INBOUND_ITEM_TYPE;
	
	private String INBOUND_REQUESTED_BY;
	
	private String INBOUND_EDITABLE_STATUS;
	
	
	public String getINBOUND_EDITABLE_STATUS() {
		return INBOUND_EDITABLE_STATUS;
	}
	public void setINBOUND_EDITABLE_STATUS(String iNBOUND_EDITABLE_STATUS) {
		INBOUND_EDITABLE_STATUS = iNBOUND_EDITABLE_STATUS;
	}
	public String getINBOUND_ITEM_TYPE() {
		return INBOUND_ITEM_TYPE;
	}
	public void setINBOUND_ITEM_TYPE(String iNBOUND_ITEM_TYPE) {
		INBOUND_ITEM_TYPE = iNBOUND_ITEM_TYPE;
	}
	public String getINBOUND_REQUESTED_BY() {
		return INBOUND_REQUESTED_BY;
	}
	public void setINBOUND_REQUESTED_BY(String iNBOUND_REQUESTED_BY) {
		INBOUND_REQUESTED_BY = iNBOUND_REQUESTED_BY;
	}
	public String getDateTostring() {
		return dateTostring;
	}
	public void setDateTostring(String dateTostring) {
		this.dateTostring = dateTostring;
	}
	public String getDateToString()
	{
		return dateTostring;
	}
	private int INBOUND_DETAILS_ID;

	public int getINBOUND_ID() {
		return INBOUND_ID;
	}
	public void setINBOUND_ID(int iNBOUND_ID) {
		INBOUND_ID = iNBOUND_ID;
	}
	public Date getINBOUND_DATE() {
		return INBOUND_DATE;
	}
	public void setINBOUND_DATE(Date iNBOUND_DATE) {
		INBOUND_DATE = iNBOUND_DATE;
	}
	public String getINBOUND_STATUS() {
		return INBOUND_STATUS;
	}
	public void setINBOUND_STATUS(String iNBOUND_STATUS) {
		INBOUND_STATUS = iNBOUND_STATUS;
	}
	public int getINBOUND_DETAILS_ID() {
		return INBOUND_DETAILS_ID;
	}
	public void setINBOUND_DETAILS_ID(int iNBOUND_DETAILS_ID) {
		INBOUND_DETAILS_ID = iNBOUND_DETAILS_ID;
	}
	public String getMODEL_NAME() {
		return MODEL_NAME;
	}
	public void setMODEL_NAME(String mODEL_NAME) {
		MODEL_NAME = mODEL_NAME;
	}
	public String getVENDOR_NAME() {
		return VENDOR_NAME;
	}
	public void setVENDOR_NAME(String vENDOR_NAME) {
		VENDOR_NAME = vENDOR_NAME;
	}
	public int getINBOUND_QUANTITY() {
		return INBOUND_QUANTITY;
	}
	public void setINBOUND_QUANTITY(int iNBOUND_QUANTITY) {
		INBOUND_QUANTITY = iNBOUND_QUANTITY;
	}
	public Double getINBOUND_PRICE() {
		return INBOUND_PRICE;
	}
	public void setINBOUND_PRICE(Double iNBOUND_PRICE) {
		INBOUND_PRICE = iNBOUND_PRICE;
	}
	public String getINBOUND_SERIAL_NUMBER() {
		return INBOUND_SERIAL_NUMBER;
	}
	public void setINBOUND_SERIAL_NUMBER(String iNBOUND_SERIAL_NUMBER) {
		INBOUND_SERIAL_NUMBER = iNBOUND_SERIAL_NUMBER;
	}
	public String getINBOUND_COMMENTS() {
		return INBOUND_COMMENTS;
	}
	public void setINBOUND_COMMENTS(String iNBOUND_COMMENTS) {
		INBOUND_COMMENTS = iNBOUND_COMMENTS;
	}
	
	// private String;

}
