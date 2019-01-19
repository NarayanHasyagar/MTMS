<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Movie ticket booking</title>
    <link href="home.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<style>

</style>
	<script type="text/javascript" src="home.js"></script>
	
 </head>
 
<body>

<%
	String ID = "";
	if(request.getParameter("Movie_ID") != null)
	{
		//session.setAttribute("Movie_ID",request.getParameter("name"));
			ID =(String) request.getParameter("Movie_ID") ;
			session.setAttribute("Movie_ID",ID);
	}
	else
	{
		ServletContext s = getServletContext();
		
		if((String)s.getAttribute("Movie_ID") != null)
		{
			ID = (String)s.getAttribute("Movie_ID");
			session.setAttribute("Movie_ID",ID);
			s.removeAttribute("Movie_ID");
		}
		ID = (String)session.getAttribute("Movie_ID");
	}
	String Date = "";
	if((String)request.getParameter("Date") == null)
	{
		Date = "2017-11-29";
	}
	else
		Date = request.getParameter("Date");

	System.out.println(Date);
	

	String username = (String)session.getAttribute("name");
	if( username == null)
	{
		response.sendRedirect("Home.jsp");
	}
	ServletContext s = getServletContext();
	
	if((String)s.getAttribute("Movie_ID") != null)
	{
		ID = (String)s.getAttribute("Movie_ID");
		s.removeAttribute("Movie_ID");
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
	String c = "select TIME_FORMAT(?, '%r') as Time";
	String sql3 = "SELECT *FROM movie WHERE Movie_ID = ?";
	String sql = "SELECT *FROM movie WHERE Movie_ID = ? ";
	String sql1 = "SELECT Name,played_in.Theatre_ID,price,Time FROM theatre,played_in WHERE theatre.Theatre_ID = played_in.Theatre_ID AND played_in.Movie_ID = ? AND Date = ? ";
	String nm ="";
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, user, dbpsw);
		ps = con.prepareStatement(sql);
		ps.setString(1, ID);
		rs = ps.executeQuery();
		as = con.prepareStatement(sql3);
		as.setString(1, ID);
		temp2 = as.executeQuery();
		temp2.next();
		%>
 <div class="navbar">
<ul>
  <li><a href="welcome.jsp">Home</a></li>
  <li>
 <div class="wrap">
   <div class="search">
   <form action = "Search.jsp" method = "POST">
      <input type="text" class="searchTerm" placeholder="What are you looking for?" name="item">
      <input type="submit" class="searchButton" value = "GO" >
    
     </form>
   </div>
</div>
</li>
<div class="menu">
 <li><a text-color:white>Welcome <%=username %></a></li>
  <li><a href="logout.jsp">Logout</a></li>
  </div>
 
 
 
</ul>
</div>
		
		<div class="mySlides fade">
  <div class="numbertext"></div>
  <img src= "<%= temp2.getString("Image") %>" style="width:100%" height="400px">
  <div class="text"></div>
</div><% 
		if(rs.next())
		{
			%><a href = "rating.jsp"><%=temp2.getString("Name") %></a><br>Actor: <%= rs.getString("Actor")%> , Actress: <%= rs.getString("Actress")%> , Director: <%= rs.getString("Director")%>,  Producer: <%= rs.getString("Producer") %>
			<br><br>Synopsis : <%=rs.getString("Synopsis")%><br><br><%  
		}%>
		<div class="card_container">
		<div class = "card">
<form  method="GET" action="Description.jsp">
<input type = "hidden" name = "Date" value = "2017-11-30" />
<input type="submit" name="bt" value="30-11-2017" class ="button" />
</form></div></div>
	<div class="card_container"><div class = "card">
<form  method="GET" action="Description.jsp">
<input type = "hidden" name = "Date" value = "2017-12-01" />
<input type="submit" name="bt" value="01-12-2017" class ="button" />
</form></div></div>
	<div class="card_container"><div class = "card">
<form  method="GET" action="Description.jsp">
<input type = "hidden" name = "Date" value = "2017-12-02" />
<input type="submit" name="bt" value="02-12-2017" class ="button" />
</form>
</div></div>
<br><br>
<p align="center">List of theatres playing movie on <%= Date %></p>
<%
		try{
		
			cs = con.prepareStatement(sql1);
			cs.setString(1, ID);
			cs.setString(2,Date);
			try{
			temp = cs.executeQuery();
			}catch(Exception e)
			{
				out.println(e);
			}
		}catch(Exception e)
		{
			out.println(e);
			
		}
		//out.println(temp.getString(""));
		/*while(temp.next())
		{
			out.println(temp.getString("Name"));
			out.println(temp.getString("Time"));
			
		}*/
		try{
		while(temp.next())
		{	
			//out.println("Hello");
			cs = con.prepareStatement(c);
				cs.setString(1,temp.getString("Time"));
				temp2 = cs.executeQuery();
				temp2.next();
			%>
			<br>
				<div class="card_container">
				<div class="card"> <br>
					<%= temp.getString("Name") %><i class="fa fa-dribbble"></i></a><br>    
  					Show Time : <%=temp2.getString("Time")  %><i class="fa fa-linkedin"></i></a> <br>  
  				
  					<form  method="GET" action="Seatlayout.jsp">
					   <input type="hidden" name="Theatre_ID" value = <%= temp.getString("Theatre_ID") %> />
					<input type="hidden" name="Movie_ID" value = <%= rs.getString("Movie_ID") %> />
					<input type="hidden" name="price" value = <%= temp.getString("price") %> />
				<input type="hidden" name="Time" value = <%= temp.getString("Time") %> />
				<input type="hidden" name="Time2" value = <%= temp2.getString("Time") %> />
				<input type = "hidden" name = "Date" value = <%= (String)request.getParameter("Date") %>/>
					<input type="submit" name="bt" value="Book" class ="button" />
					</form>
  					
					
				</div>
 
			</div>
					
 
			<% 
			
		}}catch(Exception e)
		{
			out.println(e);
		}
		
	
	
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