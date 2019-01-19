<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Login Error</title>

</head>

<body>



<%

//getServletContext().getRequestDispatcher("/Home.jsp").include(request, response);
ServletContext sc = getServletContext();
String message = "Invalid";
sc.setAttribute("Invalid",message);
response.sendRedirect("Home.jsp");

%>

</body>

</html>

