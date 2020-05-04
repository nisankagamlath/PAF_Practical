package com; 
 
import java.sql.*; 

 
public class Login{ 
	
	private Connection connect(){ 
		
		Connection con = null; 
	
		try{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			   
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hdb", "root", "");
			
			}
		catch (Exception e)
		
		{e.printStackTrace();}
		
		return con;
		
	}
	
	public String login(String username, String password) {	
		
		String output = "";
		
		try {
			
				Connection con = connect();
				 
				if(con == null)
			 		return "Error connecting to database";  
	 
				
				char ch = username.charAt(0);
				
				if (ch == 'p') {
					
					String query = "select pusername, ppassword from patient where pusername='" + username + "' and ppassword='" + password + "'";
					
					PreparedStatement stmt = con.prepareStatement(query);
					ResultSet rs = stmt.executeQuery(query);
					
		            if (rs.next())		            	
		            	output = "Patient Login Successful.";        
		         

			    } else if(ch == 'd') {
			    	
			    	String query = "select dusername, dpassword from doctor where dusername='" + username + "' and dpassword='" + password + "'";
					
					PreparedStatement stmt = con.prepareStatement(query);
					ResultSet rs = stmt.executeQuery(query);
					
		            if (rs.next())		            	
		            	output = "Doctor Login Successful.";		            
		            
		            
			    }else if (ch == 'h') {
					
					String query = "select husername, hpassword from hospital where husername='" + username + "' and hpassword='" + password + "'";
					
					PreparedStatement stmt = con.prepareStatement(query);
					ResultSet rs = stmt.executeQuery(query);
					
		            if (rs.next())		            	
		            	output = "Hospital Login Successful.";			            
		            
					
				}else if((username == "admin")) {
					
					String query = "select password from user where username='" + username;
					
					PreparedStatement stmt = con.prepareStatement(query);
					ResultSet rs = stmt.executeQuery(query);
					
					if (password == rs.getString(0))					
						output = "Admin Login Successful.";			
				
				}else {
					
					output = "Invalid Login";
				
				}
			
		}catch (Exception err) {
			    	err.getMessage();
			    	err.printStackTrace();
			    	output = "Exception Error";
			}
		
		return output;
	}
	
}

			
		
	
