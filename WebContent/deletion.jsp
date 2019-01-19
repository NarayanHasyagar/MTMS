<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Welcome Admin</title>

</head>
<body>
<% String username = (String)session.getAttribute("name");
	if( username == null)
	{
		response.sendRedirect("Home.jsp");
	}
	String sql = "";
	String sql1 = "";
	String sql2 = "";
	String x = "";
	if(request.getParameter("user") != null )
	{
		 sql = "DELETE FROM userdetail WHERE username = ?";
		 sql1 = "DELETE FROM movie_rating WHERE username = ?";
		 x = (String)request.getParameter("user");
	}
	else
		if(request.getParameter("movie") != null)
		{
			 sql = "DELETE FROM movie WHERE Movie_ID = ?";
			 sql1 = "DELETE FROM movie_rating WHERE Movie_ID = ?";
			 sql2 = "DELETE FROM played_in WHERE Movie_ID = ?";
			 x = (String)request.getParameter("movie");
		}
		else
			if(request.getParameter("theatre")!=null)
			{
				sql = "DELETE FROM theatre WHERE Theatre_ID = ?";
				sql1 = "DELETE FROM played_in WHERE Theatre_ID = ?";
			}
	%>
	



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
	


	
	
	try{
	Class.forName(driverName);
	con = DriverManager.getConnection(url, user, dbpsw);
	ps = con.prepareStatement(sql);
	ps.setString(1,x);
	int i = ps.executeUpdate();
	ps = con.prepareStatement(sql1);
	ps.setString(1,x);
	int j = ps.executeUpdate();
	 if(request.getParameter("movie") != null){
		ps = con.prepareStatement(sql2);
		ps.setString(1,x);
		int k = ps.executeUpdate();}
		 
	if( i > 0)
	{
		session.setAttribute("msuccess","true");
		if(request.getParameter("user") != null )
			response.sendRedirect("ViewUser.jsp");
		if(request.getParameter("movie") != null)
			response.sendRedirect("ViewMovie.jsp");
		if(request.getParameter("theatre") != null)
			response.sendRedirect("ViewTheatre.jsp");
	}
	else{
		session.setAttribute("mfailure","true");
		if(request.getParameter("user") != null )
			response.sendRedirect("ViewUser.jsp");
		if(request.getParameter("movie") != null)
			response.sendRedirect("ViewMovie.jsp");
	 }}
	catch(Exception e)
	{
			out.println(e);
	}
	finally{
				if( ps != null)
					ps.close();
				if(rs != null)
					rs.close();
				if( con != null )
					con.close();}
	%>
</body>
</html>