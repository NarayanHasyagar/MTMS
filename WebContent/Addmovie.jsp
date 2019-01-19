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
	if(request.getParameter("id") == null)
		response.sendRedirect("ViewMovie.jsp");
	String ID = "";
	String Name = "";
	String image = "";
	String language = "";
	String synopsis = "";
	String actors = "";
	String actresses = "";
	String director = "";
	String producer = "";
	try{
	 ID = request.getParameter("id"); 
	 Name = request.getParameter("name");
	 image = request.getParameter("image");
	 language = request.getParameter("language");
	 synopsis = request.getParameter( "synopsis");
	 actors = request.getParameter("actors");
	 actresses = request.getParameter("actresses");
	 director = request.getParameter("director");
	 producer = request.getParameter("producer");

	}catch(Exception e)
	{
		out.println(e);
	}

	PreparedStatement st = null;
	Connection con = null;
	try{
	Class.forName("com.mysql.jdbc.Driver");
	 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root", "hasyagar");

	String sql = "insert into movie values(?,?,?,?,?,?,?,?,?)";
	 st= con.prepareStatement(sql);
	st.setString(1, ID);
	st.setString(2, Name);
	st.setString(3, image);
	st.setString(4, language);
	st.setString(5, synopsis);
	st.setString(6, actors);
	st.setString(7, actresses);
	st.setString(8, director);
	st.setString(9, producer);
	try{
			int i = st.executeUpdate();
			if( i > 0)
			{
				session.setAttribute("success","success");
				response.sendRedirect("ViewMovie.jsp");
			}
	}catch(SQLIntegrityConstraintViolationException e)
	{
		session.setAttribute("integrity","true");
		response.sendRedirect("ViewMovie.jsp");
	}
	}catch(Exception e)
	{
		out.println(e);
	}finally
	{
		if(con != null)
			con.close();
		if(st!= null)
			st.close();
	}
	
	%>	
</body>
</html>