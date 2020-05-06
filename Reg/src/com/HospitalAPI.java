package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 
import java.util.HashMap; 
import java.util.Map; 
import java.util.Scanner; 

@WebServlet("/HospitalAPI")
public class HospitalAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Hospital obj = new Hospital();
    
    public HospitalAPI() {
        super();
    }

    private static Map getParasMap(HttpServletRequest request) {
		
		Map<String, String> map = new HashMap<String, String>(); 
		
		try 
		{
			
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8"); 
			String queryString = scanner.hasNext() ?scanner.useDelimiter("\\A").next() : ""; 
			scanner.close();
			
			String[] params = queryString.split("&"); 
			for (String param : params) 
			{
				String[] p = param.split("="); 
				map.put(p[0], p[1]); 
			}
					
		}
		catch(Exception e)
		{
			
		}
		
		return map;
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String output = obj.insertHospital(request.getParameter("husername"),     
											request.getParameter("hpassword"),     
											request.getParameter("hName"),        
											request.getParameter("address"));
		
		response.getWriter().write(output); 
	}	

	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map paras = getParasMap(request); 
		
		String output = obj.updateHospital(paras.get("hidHospitalIDSave").toString(), 
				paras.get("husername").toString(),     
				paras.get("hpassword").toString(),        
				paras.get("hName").toString(),     
				paras.get("address").toString());
		
		response.getWriter().write(output); 
	}

	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map paras = getParasMap(request);
		
		String output = obj.deleteHospital(paras.get("hId").toString()); 
		
		response.getWriter().write(output); 
	}
	
	

}
