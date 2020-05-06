<%@page import="com.Hospital"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    
    if (request.getParameter("husername") != null)  
    {  
    	Hospital Obj = new Hospital();  
    	String stsMsg = Obj.insertHospital(request.getParameter("husername"),     
    			request.getParameter("hpassword"),     
    			request.getParameter("hName"),        
    			request.getParameter("address"));   
    	
    	session.setAttribute("statusMsg", stsMsg); 
    }
    
    if (request.getParameter("hId") != null) 
    {
    	Hospital hObj = new Hospital();
    	String stsMsg = hObj.deleteHospital(request.getParameter("hId"));
    	session.setAttribute("statusMsg", stsMsg); 
    }
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital Management</title>
</head>
<body>
	<h1>Hospital Data Management</h1>
	<form method="post" "action="Hospital.jsp" >
		<label>username</label>
		<input type="text" name="husername" value="Please start username with h eg: hApollo"><br>
		<label>password</label>
		<input type="password" name="hpassword" value=""><br>
		<label>Hospital Name</label>
		<input type="text" name="hName" value=""><br>
		<label>Address</label>
		<input type="text" name="address" value=""><br>
		<input type="submit" name="btnSubmit" value="Save">
	</form>
	<br>
	<% out.print(session.getAttribute("statusMsg")); %> 
	<br>
	<% 
		Hospital hospitalObj = new Hospital();
		out.print(hospitalObj.readHospitals()); 
		
	%>
</body>
</html>