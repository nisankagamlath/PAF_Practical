<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    
    if (request.getParameter("husername") != null)  
    {  
    	session.setAttribute("husername", request.getParameter("husername"));  
    	session.setAttribute("hpassword", request.getParameter("hpassword"));  
    	session.setAttribute("hName", request.getParameter("hName"));  
    	session.setAttribute("address", request.getParameter("address"));  
    	
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
			<th>HospitalID</th>
			<th>username</th>
			<th>password</th>
			<th>Hospital Name</th>
			<th>Address</th>
			<th>Update</th>
			<th>Remove</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td><input type="button" name="btnUpdate" value="Update"></td>
			<td><input type="button" name="btnRemove" value="Remove"></td>
		</tr>	
	</table>
</body>
</html>