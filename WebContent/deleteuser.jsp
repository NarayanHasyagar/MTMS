<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Welcome Admin</title>
<link href="home.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.nav{
float:right;
}
</style>	


</head>

<body>

<%
String username = (String)session.getAttribute("name");
	if( username == null)
	{
		response.sendRedirect("Home.jsp");
	}%>


<div class="navbar">
	<ul>
  <li><a href="welcome2.jsp">Home</a></li>
  <div class="nav">
 <li><a text-color:white><%=username %></a></li>
  <li><a href="logout.jsp">Logout</a></li>
  </div>
  </div>
  <div>
 <%
 Connection con= null;
	PreparedStatement ps = null;
	PreparedStatement cs = null;
	ResultSet rs = null;
	ResultSet temp = null;
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/login";
	String user = "root";
	String dbpsw = "hasyagar";
	String sql = "SELECT username FROM userdetail";
	try{
	Class.forName(driverName);
	con = DriverManager.getConnection(url, user, dbpsw);
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	
	
	%>
<form action = "deletion.jsp">
<select name = "user" style = "width:450px">
<%while(rs.next()){ %>
<option value = <%= rs.getString("username") %> ><%= rs.getString("username") %></option>

<%}%></select><%}catch(Exception e)
{
	out.println(e);
}
	finally{
		if( ps != null)
			ps.close();
		if(rs != null)
			rs.close();
		if( con != null )
			con.close();   
} %></select>
<input type = "submit" value = "Delete user">
	
</form>
</div>
</body>
</html>