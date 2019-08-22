package com.inventory.util;

import java.util.*;

public class SplitingStringValues {

	public static List<String>getItemNameAndSerialNumber(String itemDetails)
	{
		ArrayList <String> data=new ArrayList<>();
		String splitDataAt[]=itemDetails.split("@@@");
		
		for(String s:splitDataAt)
		{
			
			String splitSingleItem[]=s.split(":::");
			 
				/*System.out.println(splitSingleItem[0]);
				System.out.println(splitSingleItem[1]);
				System.out.println(splitSingleItem[2]);
				System.out.println(splitSingleItem[3]);*/
			
			String getSerialNumber[]=splitSingleItem[4].split("/");
			for(String serialNo:getSerialNumber)
			{
				//System.out.println(splitSingleItem[0]);
				//System.out.println(serialNo);
				
				String itemNameAndSerialNumber=splitSingleItem[0]+":"+serialNo;
				 data.add(itemNameAndSerialNumber);
			}
				
			
			
		}
	
		//System.out.println(data);
		return data;
	}
	
	
	public static List<String>getItemNameAndQuantity(String itemDetails)
	{
		//HIDCARDS:::153:::3:::FALSE:::1/1/1
				ArrayList <String> data=new ArrayList<>();
				String splitDataAt[]=itemDetails.split("@@@");
				
				for(String s:splitDataAt)
				{
					
					String splitSingleItem[]=s.split(":::");
					String itemNameAndSerialNumber=splitSingleItem[0]+":"+splitSingleItem[1]+":"+splitSingleItem[2]+":"+splitSingleItem[3];
						 data.add(itemNameAndSerialNumber);
					 
						
					
					
				}
			
				//System.out.println(data);
				return data;
	}
	
	//getting item id of perticular serialnumber
	
	public static List<String>getSerialNumberIdAndItemNameAndQuantity(String itemDetails)
	{
		 
		ArrayList <String> data=new ArrayList<>();
		String splitDataAt[]=itemDetails.split("@@@@"); 
		//System.out.println(splitDataAt[0]);
		int count=0;
		String afterRemoveAt="";
		for(String s:splitDataAt)
		{
			String serial_numbers="";
			String splitSingleItemByHash[]=s.split("###");
			 
			 
				 String splittingSerialNumber[]=splitSingleItemByHash[4].split("@@@"); 
				 for(String splitAt:splittingSerialNumber)
				 {
					 String afterSplitFromSerialNumber[]=splitAt.split(":::");
						 serial_numbers=serial_numbers+"@@@"+afterSplitFromSerialNumber[0];
						 afterRemoveAt=serial_numbers.substring(3);
				 }
				  
					 data.add(splitSingleItemByHash[0]+":"+splitSingleItemByHash[1]+":"+splitSingleItemByHash[2]+":"+splitSingleItemByHash[3]+":"+afterRemoveAt.trim());
			
			
		}
	
	 
		return data;
	}
	
	
	public static List<String>getItemNameSerialNamesAndQuantity(String itemDetails)
	{
	
		//Sting b###2###23:::1245@@@24:::564 ||Doom Camera###2###28:::562@@@29:::485
		//abcd1###2###1###FALSE###2209:::5655
		ArrayList <String> data=new ArrayList<>();
		String splitDataAt[]=itemDetails.split("@@@@");//Doom Camera###2###28:::562@@@29:::485
		
		for(String s:splitDataAt)
		{
			int itemQuantity=0;
			String serialData="";
			String splitSingleItemByHash[]=s.split("###");
			 
				//System.out.println(s);//Item name Doom Camera
			//	System.out.println(splitSingleItemByHash[0]);//Item quantity 2
				 String splittingSerialNumber[]=splitSingleItemByHash[4].split("@@@");//28:::562@@@29:::485
				 for(String splitAt:splittingSerialNumber)
				 {
					 itemQuantity++;
					 int i=0;
					 String afterSplitFromSerialNumber[]=splitAt.split(":::");
					 {
						   
							 if(afterSplitFromSerialNumber[1].equals("1"))
							 {
								 afterSplitFromSerialNumber[1]="NO SERIAL NUMBER";
							 }
						 
						 serialData=serialData+","+"  "+afterSplitFromSerialNumber[1];
						
					 }
					
					 
				 }
				
				 //data.add(splitSingleItemByHash[0]+":"+itemQuantity+":"+serialData);
				 String finalSerailData=serialData.trim().substring(1);
				data.add(splitSingleItemByHash[0]+":"+itemQuantity+":"+finalSerailData+":"+splitSingleItemByHash[3]);
			
			 
			
				//System.out.println(serialNo);
			 
				 
			 
				
			
			
		}
		//System.out.println(itemDetails);
		//System.out.println(data);
		 
		return data;
	}
	
	
	public static List<String>getItemNameQuantityAndSerialName(String itemDetails)
	{
	
		//SAX I101:::13:::3:::564/55/669@@@YMCKO Ribbon:::14:::4:::1/1/1/1
		ArrayList <String> data=new ArrayList<>();
		String splitDataAt[]=itemDetails.split("@@@");//SAX I101:::13:::3:::564/55/669
		
		for(String s:splitDataAt)
		{
			String itemQuantity="";
			String serialData="";
			String itemName=splitDataAt[0];
			String splitSingleItemByColon[]=s.split(":::");
			itemName=splitSingleItemByColon[0].trim();
			itemQuantity=splitSingleItemByColon[2].trim();
			
			String splitSerialNumberData[]=splitSingleItemByColon[4].trim().split("/");
			
			for(String afterSplitSlash:splitSerialNumberData)
			{
				if(afterSplitSlash.equalsIgnoreCase("1"))
				{
					afterSplitSlash="NO SERIAL NUMBER";
				}
				
				serialData=serialData+","+afterSplitSlash;
			}
			
			serialData=serialData.substring(1);
			
			data.add(itemName+":"+itemQuantity+":"+serialData);
						
				 
					
					 
		}
				 
			 
			 
				 
			 
				
			
	 
		//System.out.println(data);
		 
		return data;
	}
	
	
	

}
