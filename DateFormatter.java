package com.inventory.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatter {
	
	
	public static String getDateForSqlServer(Date date)
	{
		SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//dd/MM/yyyy
		// java.util.Date now = new 	 java.util.Date();
		 String formattedDate = sdfDate.format(date);
		 
		 return formattedDate;
	}
	
	public String dateToddmmyyyy(Date date)
	{
		String result=null;
		 
		SimpleDateFormat dateFormat=new SimpleDateFormat("dd/MM/yyyy");
		result=dateFormat.format(date);
		
		return result;
	}
	
	public Date convetToDateFormat(String cunvertCurrentDate)
	{
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		
		Date date = new Date();
		System.out.println(date);
		try {
			date = df.parse(cunvertCurrentDate);
			System.out.println(date);
		} catch (ParseException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}
}
	
 