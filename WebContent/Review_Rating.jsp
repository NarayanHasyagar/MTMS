<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String username = (String)session.getAttribute("name");
	if( username == null)
	{
		response.sendRedirect("Home.jsp");
	}
	String ID = (String)session.getAttribute("Movie_ID");
	Connection con= null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/login";
	String user = "root";
	String dbpsw = "hasyagar";
	
	String sql = "SELECT AVG(Rating),COUNT(Rating) FROM movie_rating WHERE Movie_ID = ?";
	String sql2 = "SELECT username,Rating,Review FROM movie_rating WHERE Movie_ID = ?";
	//String sql3 = "SELECT username,Review FROM movie_review WHERE movie_ID = ?";
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, user, dbpsw);
		ps = con.prepareStatement(sql);
		ps.setString(1, ID);
		//ps.setString(2,username);
		rs = ps.executeQuery();
		PreparedStatement cs = con.prepareStatement(sql);
		rs = ps.executeQuery();
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

	
%>
</body>
</html>