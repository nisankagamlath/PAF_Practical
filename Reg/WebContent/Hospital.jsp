<%@page import="com.Hospital"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    
    if (request.getParameter("husername") != null)  
    {  
    	Hospital Obj = new Hospital();  
    	Obj.connect();//For testing the connect method   
    	
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
		<input type="text" name="address" values=""><br>
		<input type="submit" name="btnSubmit" values="Save">
	</form>
	<br>
	<table border="1">
		<tr>
			<th>username</th>
			<th>password</th>
			<th>Hospital Name</th>
			<th>Address</th>
			<th>Update</th>
			<th>Remove</th>
		</tr>
		<tr>
			<td><%out.print(session.getAttribute("husername")); %></td>
			<td><%out.print(session.getAttribute("hpassword")); %></td>
			<td><%out.print(session.getAttribute("hName")); %></td>
			<td><%out.print(session.getAttribute("address")); %></td>
			<td><input type="button" name="btnUpdate" value="Update"></td>
			<td><input type="button" name="btnRemove" value="Remove"></td>
		</tr>	
	</table>
</body>
</html>