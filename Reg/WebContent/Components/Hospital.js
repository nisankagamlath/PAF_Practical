$(document).ready(function()
{
	if ($("#alertSuccess").text().trim() == "")
		{
			$("#alertSuccess").hide();			
		}
	$("#alertError").hide(); 
});

$(document).on("click", "#btnSave", function(event) 
{
			$("#alertSuccess").text("");  
			$("#alertSuccess").hide();  
			$("#alertError").text("");  
			$("#alertError").hide(); 
			
			var status = validateForm();
			
			if(status != true){
				
				$("#alertError").text(status);
				$("#alertError").show();
				return;
			}
			
			var type = ($("#hidHospitalIDSave").val() == "") ? "POST" : "PUT"
				
			$.ajax( 
			{  
				url : "HospitalAPI",  
				type : type,  data : 					
				$("#formHospital").serialize(),				
				dataType : "text",  
				complete : function(response, status)
				{   
					
					onHospitalSaveComplete(response.responseText, status); 
					
				} 
			}); 
			 
});

function onHospitalSaveComplete(response, status)
{
	var resultSet = JSON.parse(response);
	
	if (resultSet.status.trim() == "success") 
	{		
			$("#alertSuccess").text("Successfully saved.");  
			$("#alertSuccess").show();
			
			$("#divItemsGrid").html(resultSet.data);
			
	}
	else if (resultSet.status.trim() == "error") 
	{
		$("#alertError").text(resultSet.data);  
		$("#alertError").show(); 
	}
	else if (status == "error") 
	{
		$("#alertError").text("Error while saving.");  
		$("#alertError").show(); 
	}
	else
	{
		$("#alertError").text("Unknown error while saving.."); 
		$("#alertError").show(); 
	}
	
	$("#hidHospitalIDSave").val(""); 
	$("#formHospital")[0].reset(); 

}
$(document).on("click", ".btnUpdate", function(event) 
{
	 $("#hidHospitalIDSave").val($(this).closest("tr").find('#hidHospitalIDUpdate').val());
	 $("#husername").val($(this).closest("tr").find('td:eq(0)').text());     
	 $("#hpassword").val($(this).closest("tr").find('td:eq(1)').text());     
	 $("#hName").val($(this).closest("tr").find('td:eq(2)').text());     
	 $("#address").val($(this).closest("tr").find('td:eq(3)').text()); 


});

$(document).on("click", ".btnRemove", function(event) 
{
	
	$.ajax( 
	{
		url : "HospitalAPI",   
		type : "DELETE",   
		data : "hId=" + $(this).data("hid"),   
		dataType : "text",   
		complete : function(response, status)   
		{    
			onHospitalDeleteComplete(response.responseText, status);   
			
		}
	});

});

function onHospitalDeleteComplete(response, status) 
{  
	if (status == "success")  
	{   
		var resultSet = JSON.parse(response);
		
		if (resultSet.status.trim() == "success")   
		{    
			$("#alertSuccess").text("Successfully deleted.");    
			$("#alertSuccess").show(); 
			
			$("#divItemsGrid").html(resultSet.data);   
			
		} 
		else if (resultSet.status.trim() == "error")   
		{    
			$("#alertError").text(resultSet.data);    
			$("#alertError").show();  
			
		} 
		else if (status == "error")  
		{  
			$("#alertError").text("Error while deleting.");   
			$("#alertError").show(); 
		}
		else  
		{   
			$("#alertError").text("Unknown error while deleting..");   
			$("#alertError").show();  
			
		} 
		
	} 
		
}

function validateForm() 
{
	if ($("#husername").val().trim() == "")  
	{   
		return "Insert username.";  
	} 
	
	if ($("#hpassword").val().trim() == "")  
	{   
		return "Insert password.";  
	} 
	
	if ($("#hName").val().trim() == "")  
	{   
		return "Insert Hospital Name";  
	} 
	
	if ($("#address").val().trim() == "")  
	{   
		return "Insert Hospital Address";  
	} 
	
	return true;

}