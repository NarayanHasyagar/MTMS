<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<html lang="en">
 
<head>

    <title>Movie ticket booking</title>
    <link href="home.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>




.searchTerm {
  float: left;
  width: 100%;
  border: 3px solid #00B4CC;
  padding: 5px;
  height: 30px;
  border-radius: 5px;
  outline: none;
  color: #9DBFAF;
}</style>
	<script type="text/javascript" src="home.js"></script>
	
 </head>
 
 <body><% String username = (String)session.getAttribute("name");
	if( username == null)
	{
		response.sendRedirect("Home.jsp");
	} %>

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
  <!--  
  <li><a href="lang.html">Lang</a></li>
  <li><div class="dropdown">
    <button class="dropbtn">Bengaluru 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="#">Pune</a>
      <a href="#">delhi</a>
      <a href="#">mumbai 3</a>
    </div> </li>
  </div> -->
 <li><a text-color:white>Welcome <%=username %></a></li>
  <li><a href="logout.jsp">Logout</a></li>
  </div>
 
</ul>
</div>
<br>
<!--            Slide Show         ------------------------------------------------------>
<!-- 
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext"></div>
  <img src="C:\Users\Narayan Hasyagar\Desktop\Pict\secret superstar.jpg" style="width:100%" height="300px">
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <div class="numbertext"></div>
  <img src="C:\Users\Narayan Hasyagar\Desktop\Pict\operation alamelamma.jpg" style="width:100%" height="300px">
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <div class="numbertext"></div>
  <img src="C:\Users\Narayan Hasyagar\Desktop\Pict\angel.jpg" style="width:100%" height="300px">
  <div class="text"></div>
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>
<div class= "movie">
<h1> Running Movies<h1>
</div>
 --><div class="slideshow-container">

<div class="mySlides fade">
  <img src="C:\Users\Narayan Hasyagar\Desktop\Pict\thor.jpg" style="width:100%; height:300px">
</div>
<div class="mySlides fade">
  <img src="C:\Users\Narayan Hasyagar\Desktop\Pict\golmaal again.jpg" style="width:100%;height:300px"> 
</div>

<div class="mySlides fade">
  <img src="C:\Users\Narayan Hasyagar\Desktop\Pict\bharjari.jpg" style="width:100%;height:300px">
</div>
<div class="mySlides fade">
  <img src="C:\Users\Narayan Hasyagar\Desktop\Pict\aval.jpg" style="width:100%;height:300px">
</div>
<div class="mySlides fade">
  <img src="C:\Users\Narayan Hasyagar\Desktop\Pict\angel.jpg" style="width:100%;height:300px">
</div>
<div class="mySlides fade">
  <img src="C:\Users\Narayan Hasyagar\Desktop\\Pict\operation alamelamma.jpg" style="width:100%;height:300px">
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>

<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 4000); // Change image every 2 seconds
}
</script>
 
<!--------------------------------------------------------    card   view -------------------------------------------------------->
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
	Class.forName(driverName);
	con = DriverManager.getConnection(url, user, dbpsw);
	String sql = "SELECT * FROM movie";
	String sql1 = "SELECT AVG(Rating) as Average FROM movie_rating WHERE Movie_ID = (SELECT Movie_ID FROM movie WHERE Name = ?)";
	ps = con.prepareStatement(sql);
	cs = con.prepareStatement(sql1);
	try{
	rs = ps.executeQuery();

	}catch(Exception e)
	{
		out.println(e);
	}
	
	try{
	while( rs.next() ){
	%>
	
<div class="card_container">
<div class="card"> 
  <%
  	//cs.setString(1, sql2);
  	cs.setString(1,rs.getString("Name"));
  	try{
		temp = cs.executeQuery();
		temp.next();

		}catch(Exception e)
		{
			out.println(e);
		}
  

  	

  %>
  <img src="<%=rs.getString("Image") %>" alt="Image" style="width:100%" height="180" width="40">
  <h3><%=rs.getString("Name") %></h3>
  Rating : <% if(temp.getString("Average")!=null){ %><%=(Float.valueOf(temp.getString("Average")))%><%}else{%>0
	 <%} %><i class="fa fa-dribbble"></i><br>    
  
  Language :  <%= rs.getString("Language") %><i class="fa fa-linkedin"></i> <br>  
 Running <i class="fa fa-facebook"></i> <br> <br>
	<form  method="get" action="Description.jsp">
	<input type="hidden" name="Movie_ID" value = <%= rs.getString("Movie_ID") %> />
	<input type="submit" name="bt" value="Book" class ="button" />
	</form>
 <!--   <input type="submit" class="button" value="Book">-->
</div>
</div>

<%} }catch(Exception e)
{
	out.println(e);
}finally{
	ps.close();
	rs.close();
	cs.close();
	temp.close();
	con.close();   
}
%>


 </body>
 </html>