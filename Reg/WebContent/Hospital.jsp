<%@page import="com.Hospital"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital Management</title>
<link rel="stylesheet" href="Views/css/bootstrap.min.css"> 
<script src="Components/jquery-3.5.1.min.js"></script> 
<script src="Components/Hospital.js"></script> 
<link href="Views/css/PatientReg.css" rel="stylesheet">
</head>
<body>
<div class="container">
<div class="row"> 
<div class="col-6">
	<h1>Hospital Data Management</h1>
	
	<form  id="formHospital" name="formHospital" method="post" action="Hospital.jsp" >
	
		username:<input  id="husername" type="text" name="husername" value="" class="form-control form-control-sm"><br>
		
		password (Length must be 8 characters):<input id="hpassword" type="password" name="hpassword" value="" class="form-control form-control-sm"><br>
		
		Hospital Name:<input id="hName" type="text" name="hName" value="" class="form-control form-control-sm"><br>
		
		Address:<input id="address" type="text" name="address" value="" class="form-control form-control-sm"><br>
		
		<div id="alertSuccess" class="alert alert-success"></div> 
		<div id="alertError" class="alert alert-danger"></div> 
		
		<input id="btnSave" type="button" name="btnSave" value="Save" class="btn btn-primary">
		
		<input type="hidden" id="hidHospitalIDSave" name="hidHospitalIDSave" value="">
		
	</form>
	<br>
	<% out.print(session.getAttribute("statusMsg")); %> 
	<br>
	<div id="divItemsGrid"> 
	<% 
		Hospital hospitalObj = new Hospital();
		out.print(hospitalObj.readHospitals()); 
		
	%>
	</div>
	
	</div>
	</div>
	</div>
</body>
</html>