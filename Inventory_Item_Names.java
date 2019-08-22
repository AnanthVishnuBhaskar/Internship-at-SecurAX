package com.inventory.bean;

public class Inventory_Item_Names {
	
	private int item_id;
	private int editable;
	public int getEditable() {
		return editable;
	}
	public void setEditable(int editable) {
		this.editable = editable;
	}
	private String item_name;
	private String item_type;
	private String need_serial_number;
	private int item_quantity;
	private int item_stock_quantity;
	private String item_description;
	private String item_invoice_number;
	
	public String getItem_invoice_number() {
		return item_invoice_number;
	}
	public void setItem_invoice_number(String item_invoice_number) {
		this.item_invoice_number = item_invoice_number;
	}
	public String getItem_description() {
		return item_description;
	}
	public void setItem_description(String item_description) {
		this.item_description = item_description;
	}
	public final int getItem_stock_quantity() {
		return item_stock_quantity;
	}
	public final void setItem_stock_quantity(int item_stock_quantity) {
		this.item_stock_quantity = item_stock_quantity;
	}
	private String item_serial_number;
	
	public final String getItem_serial_number() {
		return item_serial_number;
	}
	public final void setItem_serial_number(String item_serial_number) {
		this.item_serial_number = item_serial_number;
	}
	public int getItem_quantity() {
		return item_quantity;
	}
	public void setItem_quantity(int item_quantity) {
		this.item_quantity = item_quantity;
	}
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_type() {
		return item_type;
	}
	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}
	public String getNeed_serial_number() {
		return need_serial_number;
	}
	public void setNeed_serial_number(String need_serial_number) {
		this.need_serial_number = need_serial_number;
	}
	
	
	

}
