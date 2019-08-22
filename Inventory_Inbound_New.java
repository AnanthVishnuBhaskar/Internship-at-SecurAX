package com.inventory.bean;

import java.util.Date;

public class Inventory_Inbound_New 
{
	private int inbound_id;
	private String inbound_invoice_number;
	private Date invoice_date;
	private String invoice_date_string;
	private Date recieve_date;
	private String recieve_date_string;
	private String inbound_po;
	private String vendor_or_transporter;
	private int invoice_amount;
	private String incharge;
	private String remark;
	private String inward;
	public String getInward() {
		return inward;
	}
	public void setInward(String inward) {
		this.inward = inward;
	}
	private String item_details_added_to_inventory;
	
	public final int getInbound_id() {
		return inbound_id;
	}
	public final void setInbound_id(int inbound_id) {
		this.inbound_id = inbound_id;
	}
	public final String getInbound_invoice_number() {
		return inbound_invoice_number;
	}
	public final void setInbound_invoice_number(String inbound_invoice_number) {
		this.inbound_invoice_number = inbound_invoice_number;
	}
	public final Date getInvoice_date() {
		return invoice_date;
	}
	public final void setInvoice_date(Date invoice_date) {
		this.invoice_date = invoice_date;
	}
	public final String getInvoice_date_string() {
		return invoice_date_string;
	}
	public final void setInvoice_date_string(String invoice_date_string) {
		this.invoice_date_string = invoice_date_string;
	}
	public final Date getRecieve_date() {
		return recieve_date;
	}
	public final void setRecieve_date(Date recieve_date) {
		this.recieve_date = recieve_date;
	}
	public final String getRecieve_date_string() {
		return recieve_date_string;
	}
	public final void setRecieve_date_string(String recieve_date_string) {
		this.recieve_date_string = recieve_date_string;
	}
	public final String getInbound_po() {
		return inbound_po;
	}
	public final void setInbound_po(String inbound_po) {
		this.inbound_po = inbound_po;
	}
	public final String getVendor_or_transporter() {
		return vendor_or_transporter;
	}
	public final void setVendor_or_transporter(String vendor_or_transporter) {
		this.vendor_or_transporter = vendor_or_transporter;
	}
	public final int getInvoice_amount() {
		return invoice_amount;
	}
	public final void setInvoice_amount(int invoice_amount) {
		this.invoice_amount = invoice_amount;
	}
	public final String getIncharge() {
		return incharge;
	}
	public final void setIncharge(String incharge) {
		this.incharge = incharge;
	}
	public final String getRemark() {
		return remark;
	}
	public final void setRemark(String remark) {
		this.remark = remark;
	}
	public final String getItem_details_added_to_inventory() {
		return item_details_added_to_inventory;
	}
	public final void setItem_details_added_to_inventory(String item_details_added_to_inventory) {
		this.item_details_added_to_inventory = item_details_added_to_inventory;
	}
	
	
	
	

}
