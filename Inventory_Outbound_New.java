package com.inventory.bean;

import java.util.Date;

public class Inventory_Outbound_New 
{
	private int outbound_id;
	private String outbound_invoice_number;
	private String reporter;
	private Date outbound_date;
	private String outbound_date_string;
	private Date delivery_date;
	private String delivery_date_string;
	private String outbound_po;
	private String transporter;
	private int dc_amount;
	private String companyName;
	private String remark;
	private String item_details_added_to_Export;
	
	
	
	public final String getReporter() {
		return reporter;
	}
	public final void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public final int getOutbound_id() {
		return outbound_id;
	}
	public final void setOutbound_id(int outbound_id) {
		this.outbound_id = outbound_id;
	}
	public final String getOutbound_invoice_number() {
		return outbound_invoice_number;
	}
	public final void setOutbound_invoice_number(String outbound_invoice_number) {
		this.outbound_invoice_number = outbound_invoice_number;
	}
	public final Date getOutbound_date() {
		return outbound_date;
	}
	public final void setOutbound_date(Date outbound_date) {
		this.outbound_date = outbound_date;
	}
	public final String getOutbound_date_string() {
		return outbound_date_string;
	}
	public final void setOutbound_date_string(String outbound_date_string) {
		this.outbound_date_string = outbound_date_string;
	}
	public final Date getDelivery_date() {
		return delivery_date;
	}
	public final void setDelivery_date(Date delivery_date) {
		this.delivery_date = delivery_date;
	}
	public final String getDelivery_date_string() {
		return delivery_date_string;
	}
	public final void setDelivery_date_string(String delivery_date_string) {
		this.delivery_date_string = delivery_date_string;
	}
	public final String getOutbound_po() {
		return outbound_po;
	}
	public final void setOutbound_po(String outbound_po) {
		this.outbound_po = outbound_po;
	}
	public final String getTransporter() {
		return transporter;
	}
	public final void setTransporter(String transporter) {
		this.transporter = transporter;
	}
	public final int getDc_amount() {
		return dc_amount;
	}
	public final void setDc_amount(int dc_amount) {
		this.dc_amount = dc_amount;
	}
	public final String getCompanyName() {
		return companyName;
	}
	public final void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public final String getRemark() {
		return remark;
	}
	public final void setRemark(String remark) {
		this.remark = remark;
	}
	public final String getItem_details_added_to_Export() {
		return item_details_added_to_Export;
	}
	public final void setItem_details_added_to_Export(String item_details_added_to_Export) {
		this.item_details_added_to_Export = item_details_added_to_Export;
	}
	
	 
	

}
