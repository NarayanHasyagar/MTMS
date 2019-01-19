<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
input[type=submit] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}
input[type=text], select {
float:left;
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
</style>
<link href="home.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.nav{
float:right;
}
</style>	
</head>
<body><% 
String username = (String)session.getAttribute("name");
	if( username == null)
	{
		response.sendRedirect("Home.jsp");
	}
	%>
<div class="navbar">
	<ul>
  <li><a href="welcome2.jsp">Home</a></li>
  <div class="nav">
 <li><a text-color:white>Welcome <%=username %></a></li>
  <li><a href="logout.jsp">Logout</a></li>
  </div>
  </div>
 
	<% 
	

	
	Connection con= null;
	PreparedStatement ps = null;
	PreparedStatement cs = null;
	ResultSet rs = null;
	ResultSet temp = null;
	try{

	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/login";
	String user = "root";
	String dbpsw = "hasyagar";
	Class.forName(driverName);
	con = DriverManager.getConnection(url, user, dbpsw);
	String sql = "SELECT username,name,Email_ID FROM userdetail";
	String sql1 = "SELECT username FROM userdetail";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();%>
	<table id="customers">
  <tr>
    <th>Name</th>
    <th>UserName</th>
    <th>Email_ID</th>
  </tr>
	<% 
	while(rs.next())
	{
	%><tr>
    <td><%=rs.getString("name") %></td>
    <td><%=rs.getString("username") %></td>
    <td><%=rs.getString("Email_ID") %></td>
  </tr>
		
		
	<% 
	}%></table><br><%
	ps = con.prepareStatement(sql1);
	rs = ps.executeQuery();
	%>
	<form action = "deletion.jsp">
	<select name = "user" style = "width:450px">
	<%while(rs.next()){ %>
	<option value = <%= rs.getString("username") %> ><%= rs.getString("username") %></option>

	<%}%><%
	
	
	
}
	
	catch(Exception e)
{
	out.println(e);
}finally{
	if( ps != null)
		ps.close();
	if(rs != null)
		rs.close();
	if( con != null )
		con.close(); 
}
	%></select>
<input style = "width:125px"type = "submit" value = "Delete user">
	
</form><% 
if(session.getAttribute("msuccess") != null)
			{
				%> <p>User removed successfully<% session.removeAttribute("msuccess");
			}
			if( session.getAttribute("mfailure") != null)
			{
				%><p>User was not removed <%session.removeAttribute("mfailure"); 
			}%>
</body>
</html>