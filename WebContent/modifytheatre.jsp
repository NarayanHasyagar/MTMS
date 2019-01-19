<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
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
String Movie_ID = (String)request.getParameter("movie");
String Theatre_ID = (String)request.getParameter("theatre");
String price = request.getParameter("price");
String time = "";
String sql = "";
String sql1 = "";
String sql2 = "";
String x = "";
System.out.println((String)request.getParameter("date"));
sql = "SELECT TIME_FORMAT(STR_TO_DATE(?, '%h:%i %p'), '%T') as Time";
sql1 = "INSERT INTO played_in values(? , ? , ? , ? , ? , ?)";
String seat = "0000000000000000000000000000000000000000000000000000000000000000000000";
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


	time = (String)request.getParameter("time") + ":00";
	System.out.println((String)request.getParameter("time"));
	out.println((String)request.getParameter("time"));
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, user, dbpsw);
		/*ps = con.prepareStatement(sql);
		ps.setString(1,(String)request.getParameter("time"));
		rs = ps.executeQuery();
		rs.next();
		time = rs.getString("Time");*/
		ps = con.prepareStatement(sql1);
		ps.setString(1,Movie_ID);
		ps.setString(2,Theatre_ID);
		ps.setString(3,price);
		ps.setString(4,time);
		ps.setString(5,seat);
		ps.setString(6,(String)request.getParameter("date"));
		try{
			int i = ps.executeUpdate();
		if( i > 0)
		{
			session.setAttribute("modified","true");
			response.sendRedirect("ViewTheatre.jsp");
		}
		}catch(SQLIntegrityConstraintViolationException e)
		{
			session.setAttribute("integrity","true");
			//System.out.println(rs.getString("Time"));
			response.sendRedirect("ViewTheatre.jsp");
		}
	}
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