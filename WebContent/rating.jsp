<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<% 
String ID = "";

	
	ID = (String)session.getAttribute("Movie_ID");


String username = (String)session.getAttribute("name");
	if( username == null)
	{
		response.sendRedirect("Home.jsp");
	}
	Connection con= null;
	PreparedStatement ps = null;
	PreparedStatement cs = null;
	ResultSet rs = null;
	ResultSet temp = null;


	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/login";
	String user = "root";
	String dbpsw = "hasyagar";
	try{
	Class.forName(driverName);
	con = DriverManager.getConnection(url, user, dbpsw);
	String sql = "SELECT Name FROM Movie where Movie_ID=?";
	String sql1 = "SELECT AVG(Rating) as avg_rate,COUNT(Rating)as Count_rating FROM movie_rating WHERE Movie_ID=? AND Rating IS NOT NULL";
	String sql2 = "SELECT COUNT(Rating) as incount FROM movie_rating WHERE Movie_ID = ? AND Rating = ? " ;
	String sql3= "SELECT Review, username FROM movie_rating WHERE Movie_ID=? ";
	ps = con.prepareStatement(sql);
	ps.setString(1,ID);
	rs = ps.executeQuery();
	rs.next();
	String Movie_Name = (String)rs.getString("Name");
	ps = con.prepareStatement(sql1);
	ps.setString(1,ID);
	rs = ps.executeQuery();
	rs.next();
	float Average_rating = 0;
	if((String)rs.getString("avg_rate")!=null)
	
	 Average_rating = Float.parseFloat((String)rs.getString("avg_rate"));
	int Reviewers = Integer.parseInt((String)rs.getString("Count_rating"));
	int rate[] = new int[5];
	for( int i = 1; i <= 5; i++ )
	{	
		ps = con.prepareStatement(sql2);
		ps.setString(1,ID);
		ps.setString(2,(String)Integer.toString(i));
		rs = ps.executeQuery();
		rs.next();
		rate[i-1] = Integer.parseInt((String)rs.getString("incount"));
	}
	ps = con.prepareStatement(sql3);
	ps.setString(1,ID);
	rs = ps.executeQuery();

	
%>
<head>
<title>Ratings and Reviews</title>

<link rel="stylesheet" type="text/css" href="rating.cssa">
<script type="text/javascript" src="rating.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
*review_card{
     border:1px solid black;
}
* {
    box-sizing: border-box;
}

body {
    font-family: Arial;
    margin: 0 auto; /* Center website */
    max-width: 800px; /* Max width */
    padding: 20px;
}

.heading {
    font-size: 25px;
    margin-right: 25px;
}

.fa {
    font-size: 25px;
}

.checked {
    color: orange;
}

/* Three column layout */
.side {
    float: left;
    width: 15%;
    margin-top:10px;
}

.middle {
    margin-top:10px;
    float: left;
    width: 70%;
}

/* Place text to the right */
.right {
    text-align: right;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

/* The bar container */
.bar-container {
    width: 100%;
    background-color: #f1f1f1;
    text-align: center;
    color: white;
}

/* Individual bars */

/* Responsive layout - make the columns stack on top of each other instead of next to each other */
@media (max-width: 400px) {
    .side, .middle {
        width: 100%;
    }
    .right {
        display: none;
    }
}
 .animated {
    -webkit-transition: height 0.2s;
    -moz-transition: height 0.2s;
    transition: height 0.2s;
}

.stars
{
    margin: 20px 0;
    font-size: 24px;
    color: #d17581;
}
.container{
   padding-left:130px;
}


.star-rating {
  line-height:32px;
  font-size:1.25em;
}

.star-rating .fa-star{color: yellow;}


</style>
<style>
.bar-5 {width:<%if(Reviewers == 0){%><%= 0 %><%}else{%> <%=((float)rate[4]/Reviewers)*100%><%}%>%; height: 18px; background-color: #4CAF50;}
.bar-4 {width: <%if(Reviewers == 0){%><%= 0 %><%}else{%> <%=((float)rate[3]/Reviewers)*100%><%}%>%; height: 18px; background-color: #2196F3;}
.bar-3 {width: <%if(Reviewers == 0){%><%= 0 %><%}else{%> <%=((float)rate[2]/Reviewers)*100%><%}%>%; height: 18px; background-color: #00bcd4;}
.bar-2 {width: <%if(Reviewers ==  0){%><%= 0 %><%}else{%><%=((float)rate[1]/Reviewers)*100%><%}%>%; height: 18px; background-color: #ff9800;}
.bar-1 {width: <%if(Reviewers == 0){%><%= 0 %><%}else{%> <%=((float)rate[0]/Reviewers)*100%><%}%>%; height: 18px; background-color: #f44336;}
</style>
<style>
.searchTerm {
  float: left;
  width: 100%;
  border: 3px solid #00B4CC;
  padding: 5px;
  height: 20px;
  border-radius: 5px;
  outline: none;
  color: #9DBFAF;
}

.searchTerm:focus{
  color: #00B4CC;
}

.searchButton {
  position: absolute;  
  right: -50px;
  width: 40px;
  height: 36px;
  border: 1px solid #00B4CC;
  background: #00B4CC;
  text-align: center;
  color: #fff;
  border-radius: 5px;
  cursor: pointer;
  font-size: 20px;
}

/*Resize the wrap to see the search bar change!*/
.wrap{
  width: 100%;
  position: relative;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
/* Navbar container */
.navbar {
	height:60px;
  overflow: hidden;
  background-color: #333;
  font-family: Arial;
  
}

/* Links inside the navbar */
.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}</style>
</head>
<body>

 <div class="navbar">
	<ul>
  <li><a href="welcome.jsp">Home</a></li>
  <li>
</li> 
  <li><a href="logout.jsp">Logout</a></li>
  </div>
<h1><%= Movie_Name %></h1>


<span class="heading">User Rating</span>
<% 
int i;
for(  i = 1; i <= Average_rating; i++){%>
<span class="fa fa-star checked"></span><%}
for( ; i <= 5; i++){%><span class="fa fa-star"></span> <%} %>

<p><%= Average_rating %> average based on <%= Reviewers %> reviews.</p>
<hr style="border:3px solid #f1f1f1">

<div class="row">
  <div class="side">
    <div>5 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-5"></div>
    </div>
  </div>
  <div class="side right">
    <div><%= rate[4] %></div>
  </div>
  <div class="side">
    <div>4 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-4"></div>
    </div>
  </div>
  <div class="side right">
    <div><%= rate[3] %></div>
  </div>
  <div class="side">
    <div>3 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-3"></div>
    </div>
  </div>
  <div class="side right">
    <div><%= rate[2] %></div>
  </div>
  <div class="side">
    <div>2 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-2"></div>
    </div>
  </div>
  <div class="side right">
    <div><%= rate[1] %></div>
  </div>
  <div class="side">
    <div>1 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-1"></div>
    </div>
  </div>
  <div class="side right">
    <div><%= rate[0] %></div>
  </div>
</div>

<form action="save_rating.jsp">
<div class="container">
	<div class="row" style="margin-top:40px;">
		<div class="col-md-6">
    	<div class="well well-sm">
            <div class="text-right">
                
				<input type="button" name="answer" value="Give Review" onclick="showDiv()" />
               
            </div>
        
            <div class="row" id="post-review-box" style="display:none;">
                <div class="col-md-12">
                    <form accept-charset="UTF-8" action="" method="post">
                        <input id="ratings-hidden" name="rating" type="hidden"> 
                        <textarea class="form-control animated" cols="50" id="new-review" name="comment" placeholder="Enter your review here..." rows="5"></textarea>
        
                        <div class="text-right">
                            <div class="stars starrr" data-rating="0"></div>
                            <a class="btn btn-danger btn-sm" href="#" id="close-review-box" style="display:none; margin-right: 10px;">
                            <span class="glyphicon glyphicon-remove"></span>Cancel</a>
                            <button class="btn btn-success btn-lg" type="submit">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div> 
         
		</div>
	</div>
</div>
</form>

<br>
<div class="rate">
  <form action="save_rating.jsp">
  <input type="radio" name="rate" value="1">
  <input type="radio" name="rate" value="2">
  <input type="radio" name="rate" value="3">
  <input type="radio" name="rate" value="4">
  <input type="radio" name="rate" value="5">
  <input type="submit" value="Rate">
</form>
</div> 

</div>
<br>
<br>
<br>
<h3>All Reviews:------------------------------------------------------</h3>
<% while(rs.next()){ if(rs.getString("Review") != null){ %>
<div class="review_card">
<div class="card card-inverse card-primary mb-3 text-center">
  <div class="card-block">
    <blockquote class="card-blockquote">
    
      <p><%=rs.getString("Review") %></p>
      <footer><%=rs.getString("username")%> </footer>
	 
    </blockquote>
  </div>
</div>
</div>
<%}} %>
<%}catch(Exception e)
{
	out.println(e);
}finally{
	if( ps != null)
		ps.close();
	if(rs != null)
		rs.close();
	if( con != null )
		con.close(); 
} %>
</body>
</html>
