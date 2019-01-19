<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  padding-top: 30px;
  margin: auto;
  opacity: 1;
  text-align: center;
  font-family: arial;
}
.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}
</style>
</head>
<body>

<%
	if( session.getAttribute("name") == null)
		response.sendRedirect("Home.jsp");
	Connection con= null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String item =(String)request.getParameter("item");
	

	if( item == null  )
		response.sendRedirect("welcome.jsp");
	
	item = item.toLowerCase();
	
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/login";
	String user = "root";
	String dbpsw = "hasyagar";
	String sql = "SELECT Movie_ID FROM movie WHERE movie.Name=?";
	 try{
		if( !item.equals(""))
		{
			//out.println(item);
			Class.forName(driverName);
			con = DriverManager.getConnection(url, user, dbpsw);
			ps = con.prepareStatement(sql);
			ps.setString(1, item);
			
			rs = ps.executeQuery();
			
			
			 if(rs.next())
			{
			
				
				
					ServletContext sc = getServletContext();
					sc.setAttribute("Movie_ID",rs.getString("Movie_ID"));
					
					response.sendRedirect("Description.jsp");
				
				}
				else{
					
					/*ServletContext s = getServletContext();
					s.setAttribute("Notfound", "Notfound");
					
				
					response.sendRedirect("welcome.jsp");*/
					%><div class="card"><p align:center> The searched movie is not found</p>
					<form action="welcome.jsp">
			<input type="submit" value="Go to Home page" class ="button">
			</form></div><%
				}
			
		}else{
			/*ServletContext s = getServletContext();
			s.setAttribute("Notfound", "Notfound");
			
		
			response.sendRedirect("welcome.jsp");*/
			%><div class="card"><p align:center> The searched movie is not found</p>
			<form action="welcome.jsp">
			<input type="submit" value="Go to Home page" class ="button">
			</form>
				
			</div><%
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}finally{
		if(rs != null)
			rs.close();
	}
	
%>
</body>
</html>