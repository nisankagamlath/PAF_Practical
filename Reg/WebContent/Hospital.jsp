<%@page import="com.Hospital"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    if (request.getParameter("husername") != null)
    {
    	
    	Hospital Obj = new Hospital();
    	String stsMsg = ""; 
    	
    	if (request.getParameter("hidHospitalIDSave") != null)  
    	{  
    	  
   			stsMsg = Obj.insertHospital(request.getParameter("husername"),     
    									request.getParameter("hpassword"),     
    									request.getParameter("hName"),        
    									request.getParameter("address"));    	
    		 
    	}
    	else
    	{
    		stsMsg = Obj.updateHospital(Integer.parseInt(request.getParameter("hidHospitalIDSave")), 
    				request.getParameter("husername"),     
    				Integer.parseInt(request.getParameter("hpassword")),        
    				request.getParameter("hName"),     
    				request.getParameter("address")); 
    	}
    	
    	session.setAttribute("statusMsg", stsMsg);
    }
    
    if (request.getParameter("hidHospitalIDDelete") != null) 
    {
    	Hospital hObj = new Hospital();
    	String stsMsg = hObj.deleteHospital(request.getParameter("hidHospitalIDDelete"));
    	session.setAttribute("statusMsg", stsMsg); 
    }
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital Management</title>
<link rel="stylesheet" href="Views/css/bootstrap.min.css"> 
<script src="Components/jquery-3.2.1.min.js"></script> 
<script src="Components/Hospital.js"></script> 
</head>
<body>
	<h1>Hospital Data Management</h1>
	
	<form  id="formHospital" name="formHospital" method="post" "action="Hospital.jsp" >
	
		username:<input  id="husername" type="text" name="husername" value="" class="form-control form-control-sm"><br>
		
		password:<input id="hpassword" type="password" name="hpassword" value="" class="form-control form-control-sm"><br>
		
		Hospital Name:<input id="hName" type="text" name="hName" value="" class="form-control form-control-sm"><br>
		
		Address:<input id="address" type="text" name="address" value="" class="form-control form-control-sm"><br>
		
		<input id="btnSave" type="button" name="btnSave" value="Save" class="btn btn-primary">
		
		<input type="hidden" id="hidHospitalIDSave" name="hidHospitalIDSave" value="">
		
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