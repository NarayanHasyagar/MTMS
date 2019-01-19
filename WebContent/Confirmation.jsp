<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*" import="javax.naming.*,java.io.*,javax.mail.*,
javax.mail.internet.*,com.sun.mail.smtp.*, java.util.*,
javax.activation.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
body{
	background:url("file:///C:/Users/Narayan Hasyagar/Desktop/Pict/bc3.jpg") no-repeat center;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  padding-top : 30px;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.title {
  color: grey;
  font-size: 18px;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

a {
  text-decoration: none;
  font-size: 22px;
  color: black;
}

button:hover, a:hover {
  opacity: 0.7;
}
</style>

<script>
function myFunction() {
    window.print();
}
</script>

</head>
<body>
	<% 
	
		
	
	String username = (String)session.getAttribute("name");
	if( username == null)
	{
		response.sendRedirect("Home.jsp");
	}
	if((String)request.getParameter("Movie_ID") == null)
		response.sendRedirect("welcome.jsp");
	try{
	 	
		
		
		
		String temp = (String)request.getParameter("Seatno");
		String sql = "UPDATE played_in SET seat = ? WHERE Movie_ID = ? AND Theatre_ID = ? AND Time = ? AND Date = ?";
		String sql2 = "SELECT Name FROM movie WHERE Movie_ID = ?";
		String sql3 = "SELECT Name FROM theatre WHERE Theatre_ID = ?";
		String sql4 = "INSERT INTO ticket values(? , ? ,? ,? ,? , ? ,? ,?)";
		String sql5 = "SELECT MAX(Ticket_ID) as ID FROM ticket";
		String sql6 = "SELECT Email_ID FROM userdetail WHERE username = ?";
		Connection con = null;
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/login";
		String user = "root";
		String dbpsw = "hasyagar";
		PreparedStatement ps = null;
		ResultSet rs = null;
		int ID = 1;
		int dummy;
		String no[] = request.getParameterValues("No");
		String Time = (String)request.getParameter("Time");
		try{
			Class.forName(driverName);
			con = DriverManager.getConnection(url, user, dbpsw);
			ps = con.prepareStatement(sql);
			ps.setString(1, temp);
			ps.setString(2,(String)request.getParameter("Movie_ID"));
			ps.setString(3,(String)request.getParameter("Theatre_ID"));
			ps.setString(4,(String)request.getParameter("Time"));
			ps.setString(5,(String)request.getParameter("Date"));
			dummy = ps.executeUpdate();
			ps = con.prepareStatement(sql5);
			rs = ps.executeQuery();
			try{
				if(rs.next())
				{
				//out.println((String)rs.getString("ID"));
				if((String)rs.getString("ID") != null)
					ID = ID + (Integer.parseInt((String)rs.getString("ID")));
				}
				ps = con.prepareStatement(sql2);
				ps.setString(1,(String)request.getParameter("Movie_ID"));
				rs = ps.executeQuery();
				rs.next();
				String Movie_Name = rs.getString("Name");
				ps = con.prepareStatement(sql3);
				ps.setString(1,(String)request.getParameter("Theatre_ID"));
				rs = ps.executeQuery();
				rs.next();
				String Theatre_Name = rs.getString("Name");
				ps = con.prepareStatement(sql4);
				ps.setString(1,Integer.toString(ID));
				ps.setString(2,username);
				ps.setString(3,Movie_Name);
				ps.setString(4,Theatre_Name);		
				ps.setString(5,(String)request.getParameter("Seatcount"));
				ps.setString(6,(String)request.getParameter("Totalprice"));
				ps.setString(7,Time);
				ps.setString(8,(String)request.getParameter("Date"));
				int z = ps.executeUpdate();
				ps = con.prepareStatement(sql6);
				ps.setString(1,(String)session.getAttribute("name"));
				rs = ps.executeQuery();
				rs.next();
				
				String p = "";
				for(int  i = 0 ; i < no.length; i++)
					p = p + " "+ no[i];
			
			
				String dump = "Ticket Summary\r\nTicket ID : "+ID+"\r\nMovie Name :"+Movie_Name+"\r\nNumber of tickets :"+"\r\nTheatre Name:"+Theatre_Name+(String)request.getParameter("Seatcount")+"\r\nTotal price :"+(String)request.getParameter("Totalprice")+"\r\nDate :"+(String)request.getParameter("Date")+"\r\nShow time :"+(String)request.getParameter("Time")+"\r\nTicket no :"+p;
			%>
			<h1 style="text-align:center">Ticket Summary: </h1>
             <div class="card">
			
			<p>Ticket ID : <%= ID %>
			<p>Movie Name : <%= Movie_Name %>
			<p>Theatre Name : <%= Theatre_Name %>
			<p>Number of tickets : <%= (String)request.getParameter("Seatcount") %>
			<p>Total price : <%=(String)request.getParameter("Totalprice") %>
			<p>Date : <%= (String)request.getParameter("Date") %>	
			<p>Show time : <%= (String)request.getParameter("Time")  %>	
			<p>Ticket no : <% for( int i = 0 ; i < no.length; i++ )
				{
				%><%=Integer.parseInt(no[i])+1 %> &nbsp;<% 
				}%>
			<br>	
		    <form action = "welcome.jsp"  >
		    <input type = "submit" class = "button" value = "Home page"></form>
		    <br>
		    <button class = "button" onclick="myFunction()">Print Ticket</button>
		    
			</div>
			<% 
			
			
			String host="", usere="", pass="";
			host = "smtp.gmail.com"; usere = "@gmail.com"; //"
			 // email id to send the emails
			pass = ""; //Your gmail password
			String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
			String to = rs.getString("Email_ID"); // out going email id
			String from = "mtmsdbms@gmail.com"; //Email id of the recipient
			String subject = "Ticket Confirmation";
			String messageText = dump;//messageString;
			//String fileAttachment "C:/workspace/WEBTESTING/WebContent/Output-File/SmartHome.txt";
			boolean WasEmailSent ;
			boolean sessionDebug = true;
			Properties props = System.getProperties();
			props.put("mail.host", host);
			props.put("mail.transport.protocol.", "smtp");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.", "true");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.socketFactory.fallback", "false");
			props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
			Session mailSession = Session.getInstance(props, null);
			mailSession.setDebug(sessionDebug);
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from));
			InternetAddress[] address = {new InternetAddress(to)};
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(subject);
			msg.setContent(messageText, "text/html"); // use setText if you want to

			//DataSource source = new FileDataSource(fileAttachment);
			//msg.setDataHandler(new DataHandler(source));
			//msg.setFileName("Sugam.txt");
			Transport transport = mailSession.getTransport("smtp");
			transport.connect(host, usere, pass);
		
			try {
			transport.sendMessage(msg, msg.getAllRecipients());
			WasEmailSent = true; // assume it was sent
			}
			catch (Exception err) {
			WasEmailSent = false; // assume it's a fail
			}
			transport.close();
			%> <br>
			<p style="text-align:center"> Email sent </p>
			<%}catch(Exception e)
			{
				out.println("Email not sent");
			}
			
			
		}catch(Exception e)
		{
			out.println("Email not sent");
		}finally{
			if( ps != null)
				ps.close();
			if( con != null )
				con.close();
			if( rs!= null)
				rs.close();}
		%>
		<%
			
	}catch(Exception e)
	{
		out.println(e);
	}
	%>
	
</body>
</html>