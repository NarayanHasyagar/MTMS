<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String username = (String)session.getAttribute("name");
	if( username == null)
	{
		response.sendRedirect("Home.jsp");
	} 

	Connection con= null;
	PreparedStatement ps = null;
	PreparedStatement cs = null;
	ResultSet rs = null;
	ResultSet temp = null;
	ResultSet temp2 = null;
	PreparedStatement as = null;
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/login";
	String user = "root";
	String dbpsw = "hasyagar";
	String sql = "SELECT  *FROM movie_rating WHERE Movie_ID = ? AND username = ? ";
	String sql1 = "UPDATE movie_rating SET Review = ? WHERE Movie_ID = ? AND username = ?";
	String sql2 = "UPDATE movie_rating SET Rating = ? WHERE Movie_ID = ? AND username = ?";
	String sql3 = "INSERT INTO movie_rating(Movie_ID,username,Review) VALUES (? ,? ,?)";
	String sql4 = "INSERT INTO movie_rating(Movie_ID,username,Rating) VALUES (? ,? ,?)";
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, user, dbpsw);
		ps = con.prepareStatement(sql);
		ps.setString(1,(String)session.getAttribute("Movie_ID"));
		ps.setString(2, username);
		rs = ps.executeQuery();
		if(rs.next())
		{
			if((String)request.getParameter("comment") != null)
			{
				ps = con.prepareStatement(sql1);
				ps.setString(1,(String)request.getParameter("comment"));
				ps.setString(2,(String)session.getAttribute("Movie_ID"));
				ps.setString(3,username);
				int i = ps.executeUpdate();
				
			}
			if((String)request.getParameter("rate") != null)
			{
				ps = con.prepareStatement(sql2);
				ps.setString(1,(String)request.getParameter("rate"));
				ps.setString(2,(String)session.getAttribute("Movie_ID"));
				ps.setString(3,username);
				int i = ps.executeUpdate();
				
			}
			
			
		}
		else{
			if((String)request.getParameter("comment") != null)
			{
				ps = con.prepareStatement(sql3);
				
				ps.setString(1,(String)session.getAttribute("Movie_ID"));
				ps.setString(2,username);
				ps.setString(3,(String)request.getParameter("comment"));
				int i = ps.executeUpdate();
				
			}
			if((String)request.getParameter("rate") != null)
			{
				ps = con.prepareStatement(sql4);
				
				ps.setString(1,(String)session.getAttribute("Movie_ID"));
				ps.setString(2,username);
				ps.setString(3,(String)request.getParameter("rate"));
				int i = ps.executeUpdate();
				
			}
		}
		response.sendRedirect("rating.jsp");
		
	}catch(Exception e)
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