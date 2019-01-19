<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
 


</body>
</html>