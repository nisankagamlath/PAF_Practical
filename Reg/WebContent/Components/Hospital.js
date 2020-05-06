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
			
			var status = validateItemForm();  
			if (status != true)
				{
					$("#alertError").text(status); 
					$("#alertError").show(); 
					return;
				}
			
			$("#formHospital").submit(); 
});

$(document).on("click", ".btnUpdate", function(event) 
{
	 $("#hidHospitalIDSave").val($(this).closest("tr").find('#hidHospitalIDUpdate').val());
	 $("#husername").val($(this).closest("tr").find('td:eq(0)').text());     
	 $("#hpassword").val($(this).closest("tr").find('td:eq(1)').text());     
	 $("#hName").val($(this).closest("tr").find('td:eq(2)').text());     
	 $("#address").val($(this).closest("tr").find('td:eq(3)').text()); 


});

function validateItemForm() 
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

}