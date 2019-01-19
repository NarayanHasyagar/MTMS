<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body{
	background:url("file:///C:/Users/Narayan Hasyagar/Desktop/Pict/bc3.jpg") no-repeat center;
	width:100%;
	height:100%;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  padding-top: 30px;
  margin: auto;
  opacity: 1;
  text-align: center;
  font-family: arial;
}

.title {
  color: grey;
  font-size: 18px;
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

a {
  text-decoration: none;
  font-size: 22px;
  color: black;
}

button:hover, a:hover {
  opacity: 0.7;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% if( request.getParameterValues("Seatno") == null )
		{
			response.sendRedirect("Description.jsp");
		}
	try{
		
	 	String s[] = request.getParameterValues("Seatno");
		
	 	String x = (String)request.getParameter("Seat");
		char db[] = x.toCharArray();
		for( int i = 0; i < s.length; i++)
		{
			db[Integer.parseInt(s[i])] = '1';
		}
		String temp = String.valueOf(db);
		
	
		int Total_price = 0;
		int count = s.length;
	
		try{
		int y = (Integer.parseInt((String)request.getParameter("price")));
		 Total_price = count * y;
		}catch(Exception e)
		{
			out.println(e);
		}
		
	
		String sql = "UPDATE played_in SET seat = ? WHERE Movie_ID = ? AND Theatre_ID = ? AND Time = ? AND Date = ?";
		String sql2 = "SELECT Name FROM movie WHERE Movie_ID = ?";
		String sql3 = "SELECT Name FROM Theatre WHERE Theatre_ID = ?";
		Connection con = null;
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/login";
		String user = "root";
		String dbpsw = "hasyagar";
		PreparedStatement ps = null;
		ResultSet rs = null;
		int dummy;
		try{
			Class.forName(driverName);
			con = DriverManager.getConnection(url, user, dbpsw);
		
			ps = con.prepareStatement(sql2);
			ps.setString(1,(String)request.getParameter("Movie_ID"));
			rs = ps.executeQuery();
			rs.next();
			%>
			<div class="card">
				<p>Movie Name : <%= rs.getString("Name") %>
			<% 
			ps = con.prepareStatement(sql3);
			ps.setString(1,(String)request.getParameter("Theatre_ID"));
			rs = ps.executeQuery();
			rs.next();
			%>
			
			<p>Theatre Name : <%= rs.getString("Name") %></p>
			
			<p>Number of tickets : <%= count %></p>
			<p>Total price : <%= Total_price %></p>
			<p>Show time : <%= (String)request.getParameter("Time") %></p>
			<p>Date : <%= (String)request.getParameter("Date") %></p>
			<p>Seat no : <%for( int i = 0; i < s.length; i++)
			{%>
				<%=Integer.parseInt(s[i])+1 %>&nbsp;
			<% } %></p>
			<br><br>
			<form action = "Confirmation.jsp" method = "GET">
			<input type="hidden" name="Theatre_ID" value = <%= request.getParameter("Theatre_ID") %> />
					<input type="hidden" name="Movie_ID" value = <%= request.getParameter("Movie_ID") %> />
					<input type="hidden" name="Totalprice" value = <%= Total_price %> />
					<input type="hidden" name="Time" value = <%= request.getParameter("Time") %> />
					<input type="hidden" name="Time2" value = <%= request.getParameter("Time2") %> />
					<input type="hidden" name="Date" value = <%=(String) request.getParameter("Date") %> />
					<input type="hidden" name="Seatcount" value = <%= count %> />
						<input type="hidden" name="Seatno" value = <%= temp %> />
						<% for( int i = 0; i < s.length; i++ ){ %>
					<input type="hidden" name="No" value = <%= s[i] %> /><% } %>
						
				<input type="submit" value = "Confirm" class ="button"/>
			</form>
			<br><form action = "Description.jsp">
					<input type="submit" value="Cancel" class ="button">
				</form></div>
			<% 
			
		}catch(Exception e)
		{
			out.println(e);
		}finally{
			if( ps != null)
				ps.close();
			if( con != null )
				con.close();}
			if( rs!= null)
				rs.close();
	}catch(Exception e)
	{
		
	}
	%>
</body>
</html>