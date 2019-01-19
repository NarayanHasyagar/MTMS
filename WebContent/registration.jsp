<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	String user = "";
	String pwd = "";
	String name = "";
	String email = "";
	String phone_no = "";
	String rpwd = "";
	try{
	 user = request.getParameter("uname"); 
	 pwd = request.getParameter("password");
	 name = request.getParameter("name");
	 email = request.getParameter("email");
	 phone_no = request.getParameter( "phone_no");
	 //rpwd = request.getParameter("rpassword");
	}catch(Exception e)
	{
		out.println(e);
	}
	if( pwd != rpwd )
	
	try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root", "hasyagar");

	String sql = "insert into userdetail(username, password,name,phone_number,Email_ID) values(?,?,?,?,?)";
	PreparedStatement st= con.prepareStatement(sql);
	st.setString(1, user);
	st.setString(2, pwd);
	st.setString(3, name);
	st.setString(4, phone_no);
	st.setString(5, email);
	try{
			int i = st.executeUpdate();
		
		
			out.print("Registration Successfull!"+"<a href='Home.jsp'>Go to Login</a>");
		}
	catch(SQLIntegrityConstraintViolationException e)
	{
		ServletContext s = getServletContext();
		s.setAttribute("Primarykey","Primarykey");
		response.sendRedirect("Home.jsp");
	}finally{
		if( con != null)
			con.close();
		if( st != null)
			st.close();
	}
	}
	catch(Exception e)
	{
		out.println(e);
	
	}
	
	



%>
</body>
</html>