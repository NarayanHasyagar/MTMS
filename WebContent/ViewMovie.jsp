<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>
<link href="home.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#nav{
float:right;
}

input[type=text], select {
float:left;
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

div {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
.signup_htm{
  width:400px;
}
</style>
	
</head>
<body><% 
String username = (String)session.getAttribute("name");
	if( username == null)
	{
		response.sendRedirect("Home.jsp");
	}
	%>
<div class="navbar">
	<ul>
  <li><a href="welcome2.jsp">Home</a></li>
  <id class="nav">
 <li><a text-color:white><%=username %></a></li>
  <li><a href="logout.jsp">Logout</a></li>
  </id>
  </div>
 
</ul>
</div>
	<% 
	
	Connection con= null;
	PreparedStatement ps = null;
	PreparedStatement cs = null;
	ResultSet rs = null;
	ResultSet temp = null;
	try{

	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/login";
	String user = "root";
	String dbpsw = "hasyagar";
	Class.forName(driverName);
	con = DriverManager.getConnection(url, user, dbpsw);
	String sql = "SELECT Movie_ID,Name FROM movie";
	String sql1 = "SELECT AVG(Rating) as Average FROM movie_rating WHERE Movie_ID = ?";
	String sql2 = "SELECT SUM(No_ticket) as Viewers,SUM(Price) as Total FROM ticket WHERE Movie_Name = ?"; 
	
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();%>
	<table id="customers">
  <tr>
    <th>Movie_ID</th>
    <th>Movie Name</th>
    <th>User Rating</th>
    <th>No of viewers</th>
    <th>Box Office Collection</th>
  </tr>
	<% 
	while(rs.next())
	{
		int Viewers = 0;
		int Total = 0;
		ps = con.prepareStatement(sql1);
		ps.setString(1,(String)rs.getString("Movie_ID"));
		temp = ps.executeQuery();
		temp.next();
		
		String Average = "0" ;
		if((String)temp.getString("Average")!=null)
			Average = (String)temp.getString("Average");
	
		ps = con.prepareStatement(sql2);
		ps.setString(1,(String)rs.getString("Name"));
		temp = ps.executeQuery();
		temp.next();
		if((String)temp.getString("Viewers") != null)
			Viewers = Integer.parseInt((String)temp.getString("Viewers"));
		if((String)temp.getString("Total") != null)
		 Total = Integer.parseInt((String)temp.getString("Total"));
	%>
	
	<tr>
    <td><%=rs.getString("Movie_ID") %></td>
    <td><%=rs.getString("Name") %></td>
    <td><%=Average %></td>
    
     <td><%=Viewers %></td>
      <td><%=Total %></td>
  </tr>
		
		
	<% 
	}%></table>
	<br>
	<br>
	<% 
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	%>
	<h3>Delete Movie Here......</h3>
	<form action = "deletion.jsp">
	<select name = "movie" style = "width:450px">
	<%while(rs.next()){ %>
	<option value = <%= rs.getString("Movie_ID") %> ><%= rs.getString("Name") %></option>

	<%}%>
	</select><input style="width:125px;" type = "submit" value = "Delete Movie"></form>
	<br>
	<%if(session.getAttribute("msuccess") != null)
	{
		%> <p>Movie removed successfully<% session.removeAttribute("msuccess");
	}
	if( session.getAttribute("mfailure") != null)
	{
		%><p>Movie deletion failed <%session.removeAttribute("mfailure"); 
	}
	 %>
	<br>
	<h3>Add Movie Here.......</h3>
		<form action = "Addmovie.jsp" method = "POST">
			<div class="signup_htm">
			<div class="group">
					<label for="pass" class="label">Movie_ID</label>
					<input name="id" type="number"   class="input" required>
				</div>
				<div class="group">
					<label for="user" class="label">Name</label>
					<input name="name" type="text" class="input" required>
				</div>
				<div class="group">
					<label for="" class="label">Image_URL</label>
					<input name="image" type="text" class="input"  required>
				</div>
				
				
				 <div class="group">
					<label for="pass" class="label">Language</label>
					<input name="language" type="text" class="input" required>
				</div>
				 <div class="group">
					<label for="pass" class="label">Synopsis</label>
					<input name="synopsis" type="text" class="input" required>
				</div>
				<div class="group">
					<label for="pass" class="label">Actors</label>
					<input name="actors" type="text"   class="input" required>
				</div>
				<div class="group">
					<label for="pass" class="label">Actresses</label>
					<input name="actresses" type="text"   class="input" required>
				</div>
				<div class="group">
					<label for="pass" class="label">Director</label>
					<input name="director" type="text"   class="input" required>
				</div>
				<div class="group">
					<label for="pass" class="label">Producer</label>
					<input name="producer" type="text"   class="input" required>
				</div>
				<div class="group">
					<input type="submit" class="btn" value="Add">
				</div></div>
			</form>
			<% if(session.getAttribute("integrity") != null)
			{
				%> <p>Same movie already exists<% session.removeAttribute("integrity");
			}
			if( session.getAttribute("success") != null)
			{
				%><p>Movie added successfully <%session.removeAttribute("success"); 
			}
			
			
	
	
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