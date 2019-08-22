package com.inventory.util;
import java.util.*;  
import javax.mail.*;  
import javax.mail.internet.*;  
import javax.activation.*;  


import java.util.*;  
import javax.mail.*;  
import javax.mail.internet.*;  
import javax.activation.*;  

public class SendEmail
{

	String email=null,password=null,reporterEmail=null;
	
  public void  sendEmailtoReporter(String email,String password,String reporterEmail,String itemsDetails,String poDetails[],String recipientsArray[])//HIDCARDS###149###1###TRUE###2043:::1
	{
	   
	  this.email=email;
	  this.password=password;
	  this.reporterEmail=reporterEmail.trim();
     String completeData="";
  	
  	//SplitingStringValues s1=new SplitingStringValues(); [HIDCARDS:1:NO SERIAL NUMBER]
  	List<String> itemList=SplitingStringValues.getItemNameSerialNamesAndQuantity(itemsDetails);
  	Integer totalQuantity=0;

  	int count=0;

  	for(String item_details_of_ob:itemList)
  	{
  		count++;
  		 
  			String SingleItemValues[]=item_details_of_ob.split(":");
  			String itemName=SingleItemValues[0];
  			String itemQuantity=SingleItemValues[1];
  			String itemSerialNumbers=SingleItemValues[2];
  			if(itemSerialNumbers.contains("NO"))
  			{
  				itemSerialNumbers="";
  			}
  			
  	  
  	System.out.println(count);
  	System.out.println(itemName); 
  	System.out.println(itemSerialNumbers.trim());    
  	System.out.println(itemQuantity);  
  	totalQuantity=totalQuantity+Integer.parseInt(itemQuantity);
  	System.out.println(totalQuantity);
  	String blank="<tr><td></td><td><br><span></span>"+"</td><td align='center' ></td></tr>";
  	completeData=completeData+blank+"<tr><td>"+count+"</td><td>"+itemName+"<br><span>"+itemSerialNumbers.trim()+"</span>"+"</td><td align='center' >"+itemQuantity+"</td></tr>";
  	   
  	 
  	}
		 
  	setEmailBody(completeData+":"+totalQuantity,poDetails,recipientsArray);
	}
  
  
  	void setEmailBody(String middleData,String poDetails[],String recipientsArray[])
  	{
  		System.out.println("Inside Mail : "+email+" : "+password+ ":" +reporterEmail);
  		
  		String splitVal[]=middleData.split(":");
  		
  		String host="mail.securax.in";  
		  final String user=email;//change accordingly  
		  final String userPassword=password;//change accordingly  
		  Message mesg;
		 String message_subject = "Outward Deatails";
		  
	 
		 
		 
		 /* String message_recip = "anand.prabhu@securax.in";

		   What's it all about, Alfie? 
		   

		  *//** The message CC recipient. *//*
		   String message_cc = "nobody@erewhon.com";*/

		  /** The text/plain message body */
		   String message_body = "blank";

		  /* The text/html data. */
		   String html_data1 = "<HTML><BODY><h4 style='color:#FFFFFF;width:100%;border:2px;background-color:#3BB1D7;height:30px;'>Items Are Shipped</h4></BODY>";
		   String dcNumber="<div style='font-size:12px;font-weight: bold'>DC NUMBER :"+poDetails[0]+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PO :"+poDetails[1]+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date : "+poDetails[2]+"</div><br>";
		   String greetings = "Hi Sir/Madam ,<br>"+html_data1+"<br>"+dcNumber;
		   	String tableHeader="<TABLE border:1px  style='border:1px;border-style:solid;font-family:Arial, sans-serif;font-size:10px;font-weight: lighter;width:70%;cellpadding=20;border-color: #E9E7E7;border-collapse: collapse'><tr style='height:35px;background-color:#EEF6FB;'><th width='50px'>SL NO </th><th width='300px' align='left'>ITEM NAME</th><th width='50px' align='center'>QTY</th></tr>";
		 
		  String last="<tr style='height:35px;background-color:#EEF6FB;'><th width='50px'>Total : </th><th width='300px'  align='center'></th><th width='50px'>"+splitVal[1]+"</th></tr></table>";
		  String company="<div>To,</div><br><div style='font-size:12px;font-weight: bold;width:80px;'>"+poDetails[3]+"</div>";
		  String finalData=greetings+"<br>"+tableHeader+splitVal[0]+last+"<br>"+company;
		   String[] mailAddressTo = new String[1];    
		   mailAddressTo[0] = "stores@securax.in";    
		    

		  

		  /* message.addRecipients(Message.RecipientType.TO, mailAddress_TO);
		   ress_TO = new InternetAddress[mailAddressTo.length];*/
		  
		  
		  
		  
		    
		  String to=reporterEmail;//change accordingly  
		  
		   //Get the session object  
		   Properties props = new Properties();  
		   props.put("mail.smtp.host",host);  
		   props.put("mail.smtp.auth", "true");  
		   
		     
		    Session session = Session.getDefaultInstance(props,  
		    new javax.mail.Authenticator() {  
		      protected PasswordAuthentication getPasswordAuthentication() {  
		    return new PasswordAuthentication(user,userPassword);  
		      }  
		    });   
		  
		   //Compose the message  
		    try { 
		    	
		    	mesg = new MimeMessage(session);

		        // From Address - this should come from a Properties...
		        mesg.setFrom(new InternetAddress(email));

		        // TO Address
		        InternetAddress toAddress = new InternetAddress(to);
		        mesg.addRecipient(Message.RecipientType.TO, toAddress);

		        // CC Address
		        
		        InternetAddress[] mailAddress_TO = new InternetAddress[recipientsArray.length];

				   for (int i = 0; i < mailAddressTo.length; i++)
				   {
				       try {
						mailAddress_TO[i] = new InternetAddress(mailAddressTo[i]);
					} catch (AddressException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				   }
		        
		        
		        
		        
		        
		        
		        
		       // InternetAddress ccAddress = new InternetAddress(message_cc);
		        mesg.addRecipients(Message.RecipientType.CC, mailAddress_TO);

		        // The Subject
		        mesg.setSubject(message_subject);

		        // Now the message body.
		        Multipart mp = new MimeMultipart();

		        BodyPart textPart = new MimeBodyPart();
		        textPart.setText(message_body); // sets type to "text/plain"

		        BodyPart pixPart = new MimeBodyPart();
		        pixPart.setContent(finalData, "text/html");

		        // Collect the Parts into the MultiPart
		        mp.addBodyPart(textPart);
		        mp.addBodyPart(pixPart);

		        // Put the MultiPart into the Message
		        mesg.setContent(mp);

		        // Finally, send the message!
		       Transport.send(mesg);
		    	
		    	
		    	
		    	
		     System.out.println("message sent successfully..."+finalData);  
		   
		     
		    } catch (MessagingException e) {e.printStackTrace();}
			   
	
		  
		
  	}
     
     public static void main(String[] args) 
     {
		
  	   SendEmail email=new SendEmail();

  	   String[] podetails=new String[4];
  	   podetails[0]="5489tg";
  	   podetails[1]="PO8959";
  	   podetails[2]="31/03/20tt";
  	   podetails[3]="Securax Solution1";
  	   //DC NUMBER : 548999     PO : 548999     Date : 31/03/2016
  	   
  	   //email.sendEmailtoReporter("anand.prabhu@securax.in","Securax@21jan2016","anand.prabhu@securax.in","HIDCARDS###149###1###TRUE###2043:::1@@@@HIDCARDS###149###1###TRUE###2043:::1",podetails);
         
        // Sop sop=new Sop();//middleDataAfterSplit
         
        //sop.sendEmail(middleDataAfterSplit);
	   }
	

}


