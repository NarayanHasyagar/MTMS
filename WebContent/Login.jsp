<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%! 
	String userdbName;
	String userdbPsw;

%>
<%
	Connection con= null;
	PreparedStatement ps = null;
	PreparedStatement cs = null;
	ResultSet rs = null;
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/login";
	String user = "root";
	String dbpsw = "hasyagar";
	String sql = "select * from userdetail where username=? and password=?";
	String sql2 = "select * from admindetail where AdminID = ? and password = ?";
	String name = "";
	String password = "";

	try{
 		name = request.getParameter("name");
 		password = request.getParameter("password");
 		
 		
	}catch(Exception e)
	{
		out.println(e);
	}
	
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, user, dbpsw);
		if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals(""))))
		{
			try{
				
				ps = con.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, password);
				cs = con.prepareStatement(sql2);
				rs = ps.executeQuery();
				//out.println("hello1");
				if(rs.next())
				{ 
				
					userdbName = rs.getString("username");
					userdbPsw = rs.getString("password");
					if(name.equals(userdbName) && password.equals(userdbPsw))
					{
						
						session.setAttribute("name",userdbName);
						response.sendRedirect("welcome.jsp"); 
						
					} 
					else
					{
					
						ServletContext sc = getServletContext();
						String message = "Invalid";
						sc.setAttribute("Invalid",message);
						response.sendRedirect("Home.jsp");
					}
				}
				else{
					
						cs.setString(1, name);	
						cs.setString(2, password);
						rs = cs.executeQuery();
						if(rs.next())
						{ 
							userdbName = rs.getString("AdminID");
							userdbPsw = rs.getString("password");	
							if(name.equals(userdbName) && password.equals(userdbPsw))
							{
								
								session.setAttribute("name",userdbName);
								response.sendRedirect("welcome2.jsp"); 
								
							}
						}
						else
						{
							out.println("hello3");
							ServletContext sc = getServletContext();
							String message = "Invalid";
							sc.setAttribute("Invalid",message);
							response.sendRedirect("Home.jsp");
						}
					}
				}catch(SQLException sqe)
				{
					out.println(sqe);
				} 
		}
		
		
	}catch(Exception e)
	{
		out.println(e);
	}
	finally{
		if(rs!=null)
			rs.close();
		if(cs != null)
			cs.close();
		if( ps != null)
			ps.close();
		if( con != null)
			con.close();
	}
%>

</body>

</html>