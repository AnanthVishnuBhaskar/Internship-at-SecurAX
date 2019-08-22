package com.inventory.util;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

public class ConvertToUrlToString 
{
	
	
	 
	
	void test()
	{
		  try {
	            StringBuffer urlString = new StringBuffer("http://localhost:8080/Inventory");
	            urlString.append("/Login.jsp");

	            URL url = new URL(urlString.toString());            
	            String savedHtml = "";
	                        
	            BufferedInputStream ins = new BufferedInputStream(url.openStream());
	            BufferedReader br = new BufferedReader(new InputStreamReader(ins));
	            StringBuffer sb = new StringBuffer();
	            String line = br.readLine();
	            while (line != null) {
	                sb.append(line);
	                sb.append("\n");
	                line = br.readLine();
	            }
	            savedHtml = sb.toString();
	            System.out.println("savedHtml : "+savedHtml);
	        }
	        catch(MalformedURLException mue) {
	           System.out.println(mue);
	        }    
	        catch(IOException ioe) {
	        	System.out.println(ioe);
	        }
		
	}
	
	
	
	
	
	
public String  FromString()
{
	 String savedHtml = "";
	/*try {
		String webPage = "http://192.168.1.47:8080/Inventory/InvoiceTable.html";
		URL url = new URL(webPage);
		URLConnection urlConnection = url.openConnection();
		InputStream is = urlConnection.getInputStream();
		InputStreamReader isr = new InputStreamReader(is);

		int numCharsRead;
		char[] charArray = new char[1024];
		StringBuffer sb = new StringBuffer();
		while ((numCharsRead = isr.read(charArray)) > 0) {
			sb.append(charArray, 0, numCharsRead);
		}
		  re = sb.toString();

		System.out.println("*** BEGIN ***");
		System.out.println(re);
		System.out.println("*** END ***");
	} catch (MalformedURLException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	
	}*/
	
	
	try {
        StringBuffer urlString = new StringBuffer("http://localhost:8080/Inventory");
        urlString.append("/OutboundInvoiceTable.jsp");

        URL url = new URL(urlString.toString());            
       
                    
        BufferedInputStream ins = new BufferedInputStream(url.openStream());
        BufferedReader br = new BufferedReader(new InputStreamReader(ins));
        StringBuffer sb = new StringBuffer();
        String line = br.readLine();
        while (line != null) {
            sb.append(line);
            sb.append("\n");
            line = br.readLine();
        }
        savedHtml = sb.toString();
        System.out.println("savedHtml : "+savedHtml);
    }
    catch(MalformedURLException mue) {
       System.out.println(mue);
    }    
    catch(IOException ioe) {
    	System.out.println(ioe);
    }
	
	
	
	
	
	
	
	
	return savedHtml;
	
}

}
 
 
	
  

 
