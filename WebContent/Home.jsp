<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

 
 <html>
 <head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <link rel="stylesheet" href="css.css">
      <script>function InvalidMsg(textbox) {

    	     if(textbox.validity.patternMismatch){
    	        textbox.setCustomValidity('Username cant start with number and should contain atleast 4 characters');
    	    }    
    	    else {
    	        textbox.setCustomValidity('');
    	    }
    	    return true;}
    	    function InvalidMsg1(textbox) {

       	     if(textbox.validity.patternMismatch){
       	        textbox.setCustomValidity('Name cant start with number');
       	    }    
       	    else {
       	        textbox.setCustomValidity('');
       	    }
       	    return true;
    	}
    	    function InvalidMsg2(textbox) {

          	     if(textbox.validity.patternMismatch){
          	        textbox.setCustomValidity('Enter valid Email address');
          	    }    
          	    else {
          	        textbox.setCustomValidity('');
          	    }
          	    return true;
       	}
    	    function InvalidMsg3(textbox) {

         	     if(textbox.validity.patternMismatch){
         	        textbox.setCustomValidity('Enter a valid phone number starting with 7-9');
         	    }    
         	    else {
         	        textbox.setCustomValidity('');
         	    }
         	    return true;
      	}
    	    </script>
<style>
.login-html{
   align:centre;
   padding-left:475px;
}
.headd{
align:center;
padding-left:300px;
backgound:white;
color:#ffc299;}
</style>
  
</head>

<body>
<div class="headd">
<h1 >Movie Theatre Management System </h1></div>
  <div class="login-wrap">
	<div class="login-html">
	<% ServletContext s = getServletContext();
		if( (String)s.getAttribute("Primarykey") == "Primarykey"){%>
		Username already exists<br><br>
		<input id="tab-1" type="radio" name="tab" class="sign-in" ><label for="tab-1" class="tab" >Sign In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up" checked><label for="tab-2" class="tab">Sign Up</label>
		<% s.removeAttribute("Primarykey");
				}else{ %>
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked ><label for="tab-1" class="tab" >Sign In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up" ><label for="tab-2" class="tab">Sign Up</label>
		<%}	
		
		%>
		
		
		<div class="login-form">
		
			<div class="sign-in-htm">
			<form action = "Login.jsp" method = "POST">
				<div class="group">
					<label for="user" class="label">Username</label>
					<input name="name" type="text" class="input">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input name="password" type="password" class="input" >
				 </div>
				
			 <div class="group">
				
					<input type="submit" class="button" value="Sign In">
					
				</div></form>
			
				<div style="padding-left:10px">
					
					<%	ServletContext sc = getServletContext();
							if( (String)sc.getAttribute("Error") == "Error"){%>
							<br><br>Invalid Login 
							<% }else if((String)sc.getAttribute("Invalid") == "Invalid"){sc.removeAttribute("Invalid"); %>
							<br><br>Invalid UserName or Password
							<%}
							
							 %>
			
				</div>
			</div>
		
			<form action = "registration.jsp" method = "POST">
			<div class="sign-up-htm">
				<div class="group">
					<label for="user" class="label">Username</label>
					<input name="uname" type="text" class="input" pattern = "[A-Za-z]{4,}" oninvalid="InvalidMsg(this);" oninput="InvalidMsg(this);" required>
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input name="password" type="password" class="input" data-type="password" required>
				</div>
				
				
				 <div class="group">
					<label for="pass" class="label">Name</label>
					<input name="name" type="text" class="input" pattern = "[A-Za-z]+" oninvalid="InvalidMsg1(this);" oninput="InvalidMsg1(this);" required>
				</div>
				 <div class="group">
					<label for="pass" class="label">Email Address</label>
					<input name="email" type="email" class="input" oninvalid="InvalidMsg2(this);" oninput="InvalidMsg2(this);"required>
				</div>
				<div class="group">
					<label for="pass" class="label">Phone no</label>
					<input name="phone_no" type="text"  pattern="[7-9]{1}[0-9]{9}" class="input" maxlength="10" oninvalid="InvalidMsg3(this);" oninput="InvalidMsg3(this);" required>
				</div>
				<div class="group">
					<input type="submit" class="button" value="Sign Up">
				</div>
			</form>
		</div>
	</div>
</div>
  
  
</body>
</html>



