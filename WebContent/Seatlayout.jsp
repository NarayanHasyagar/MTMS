<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="stylesheet" href="ticket.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body{
	background:url("file:///C:/Users/Narayan Hasyagar/Desktop/Pict/bc4.png") no-repeat center;
}
form { 
margin:  auto; 
width:400px;
padding-left:400px;
/*align:centre;*/
}

.label__checkbox_checked{
	color:#cbcfd6;
}
.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  
  color: white;
  background-color: #000;
  /*text-align: center;*/
  cursor: pointer;
  width: 50%;
  font-size: 18px;
}

p.screen{
	border-style:solid ;
	border-radius:10px;
	width:400px;
	text-align:center;
	align:center;
	
}
</style>
</head>
<body>
<%
	String Movie_ID = "";

	//session.setAttribute("Movie_ID",request.getParameter("name"));
		Movie_ID =(String) request.getParameter("Movie_ID") ;
	
	String Theatre_ID = (String) request.getParameter("Theatre_ID");
	String Time = (String) request.getParameter("Time");
	String Date = (String) request.getParameter("Date");


	String username = (String)session.getAttribute("name");
	if( username == null)
	{
		response.sendRedirect("Home.jsp");
	}
	Connection con= null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/login";
	String user = "root";
	String dbpsw = "hasyagar";
	String sql = "SELECT seat FROM played_in where Movie_ID = ? AND Theatre_ID = ? AND Time = ? AND Date = ?";
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(url, user, dbpsw);
		ps = con.prepareStatement(sql);
		ps.setString(1,Movie_ID);
		ps.setString(2, Theatre_ID);
		ps.setString(3,Time);
		ps.setString(4,Date);
		rs = ps.executeQuery();
		rs.next();
		String x = (String)rs.getString("seat");
		char s[] =  x.toCharArray();%>
		<div style="padding-left:330px">
	<p class="screen">SCREEN</p><br> </div>
	<form action="Seatprocess.jsp" method = "POST" >
<% for( int i = 0; i < 7; i++)
	{
	for( int j = 0 ; j < 10; j++){
		if( j == 5)
		{
			%> <%
		}
	if( s[i*10+j] == '0')
	{%>
	
	<div class="center">
      <label class="label">
	      <input  type="checkbox" class = "label__checkbox" value = <%=i*10+j %> name = "Seatno">
	   <span class="label__text">
      <span class="label__check">
        <i class="fa fa-check icon"></i>
      </span>
    </span>
  </label>
</div>
	<%} else{%>
	<div class="center">
      <label class="label">
		<input   class = "label__checkbox_checked" style="background:black" type="checkbox" value =  <%=i*10+j %> name = "Seatno" disabled>
		<span class="label__text">
      <span class="label__check2">
        <i class="fa fa-check icon2"></i>
      </span>
    </span>
  </label>
</div>
	<%}
	}%><br><br><%
	}
	%><br><div style = "padding-right:50px">
	<input type="hidden" name="Theatre_ID" value = <%= request.getParameter("Theatre_ID") %> />
					<input type="hidden" name="Movie_ID" value = <%= request.getParameter("Movie_ID") %> />
					<input type="hidden" name="price" value = <%= request.getParameter("price") %> />
					<input type="hidden" name="Time" value = <%= request.getParameter("Time") %> />
					<input type="hidden" name="Time2" value = <%= request.getParameter("Time2") %> />
					<input type="hidden" name="Date" value = <%= request.getParameter("Date") %> />
					<input type="hidden" name="Seat" value = <%= x %> />
					
	<input class = "button"  type = "submit" value="submit" >
	</div>
	</form>
	<p style="padding-left:600px">Price:<%= request.getParameter("price") %></p>
	<% }catch(Exception e)
	{
		out.println(e);
	}finally{
		if( ps != null)
			ps.close();
		if(rs != null)
			rs.close();
		if( con != null )
			con.close();}
	%>

</body>
</html>