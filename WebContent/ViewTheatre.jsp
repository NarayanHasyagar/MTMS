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

input[type=number]{
float:left;
    width:20%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=time]{
float:left;
    width:10%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=date]{
float:left;
    width:10%;
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
<link href="home.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#nav{
float:right;
}
</style>
</head>
<body>
<% 
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
  <ul>
 <li><a text-color:black>Welcome <%=username %></a></li>
  <li><a href="logout.jsp">Logout</a></li>
  </ul>
  </id>
  
 
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
	String sql = "SELECT Theatre_ID,Name FROM theatre";
	String sql1 = "SELECT Movie_ID,Name FROM movie";
	String sql2 = "SELECT SUM(No_ticket) as Viewers,SUM(Price) as Total FROM ticket WHERE Theatre_Name = ?"; 
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();%>
	<table id="customers">
  <tr>
    <th>Theatre_ID</th>
    <th>Theatre Name</th>
    <th>No of viewers</th>
    <th>Revenue</th>
  </tr>
	<% 
	while(rs.next())
	{
		int Viewers = 0;
		int Total = 0;
	
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
    <td><%=rs.getString("Theatre_ID") %></td>
    <td><%=rs.getString("Name") %></td>
    
     <td><%=Viewers %></td>
      <td><%=Total %></td>
  </tr>
		
		
	<% 
	}%></table>
	
	<h3>Add Theatre Here.......</h3>
		<form action = "AddTheatre.jsp" method = "POST">
			<div class="signup_htm">
			<div class="group">
					<label for="pass" class="label">Theatre_ID</label>
					<input name="id" type="text"   class="input" required>
				</div>
				<div class="group">
					<label for="user" class="label">Name</label>
					<input name="name" type="text" class="input" required>
				</div>
				
				
				 <div class="group">
					<label for="pass" class="label">Location</label>
					<input name="location" type="text" class="input" required>
				</div>
				<div class="group">
					<input type="submit" class="btn" value="Add">
				</div></div>
			</form>
	<br>
	
	<h3> Modify Playing movies</h3>
	<% ps = con.prepareStatement(sql);
		
		cs = con.prepareStatement(sql1);
		temp = cs.executeQuery();
	rs = ps.executeQuery();
	%>
	
	<form action = "modifytheatre.jsp">
	
	<select name = "theatre" style = "width:250px" >
	<%while(rs.next()){ %>
	<option value = <%= rs.getString("Theatre_ID") %> ><%= rs.getString("Name") %></option>

	<%}%>
	</select>

	<select name = "movie" style = "width:250px">
	<%while(temp.next()){ %>
	<option value = <%= temp.getString("Movie_ID") %> ><%= temp.getString("Name") %></option>

	<%}%>
	
	</select>

	 
	<input type = "number" name = "price" class ="input" Required placeholder="Price">
	
	<input type = "date" name = "date" class = "input" Required>
	<input type = "time" name = "time" class = "input"  Required> 
	<input style="width:100px;" type = "submit" value = "Update">
	</form>
	
	
	<% if(session.getAttribute("integrity") != null)
	{
		%> <p>Same theatre-movie detail already exists<% session.removeAttribute("integrity");
	}
	if( session.getAttribute("modified") != null)
	{
		%><p>Details added successfully <%session.removeAttribute("modified"); 
	}
	%><br><br><%  
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	%>
	<h3>Delete Theatre Here......</h3>
	<form action = "deletion.jsp">
	<select name = "theatre" style = "width:450px">
	<%while(rs.next()){ %>
	<option value = <%= rs.getString("Theatre_ID") %> ><%= rs.getString("Name") %></option>

	<%}%>
	</select><input style="width:125px;" type = "submit" value = "Delete Theatre"></form>
	<br>
	<%if(session.getAttribute("msuccess") != null)
	{
		%> <p>Movie removed successfully<% session.removeAttribute("msuccess");
	}
	if( session.getAttribute("mfailure") != null)
	{
		%><p>Movie deletion failed <%session.removeAttribute("mfailure"); 
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