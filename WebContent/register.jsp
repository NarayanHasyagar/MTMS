<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link  href="register.css" rel="stylesheet">
</head>
<body>
<form method="post" action="registration.jsp">
            <center>
            <table border="1" width="30%" cellpadding="5">
<thead>
<tr>
<th colspan="2">Enter Information Here</th>
</tr>
</thead>
<tbody>
<tr>
<td>Name</td>
<td><input type="text" name="name" value="" /></td>
</tr>

<tr>
<td>Email</td>
<td><input type="email" name="email" value="" /></td>
</tr>
<tr>
<td>User Name</td>
<td><input type="text" name="uname" value="" /></td>
</tr>
<tr>
<td>Password</td>
<td><input type="password" name="password" value="" /></td>
</tr>
<tr>
<tr>
<td>Phone Number</td>
<td><input type="text" name="phone_no" value=""/></td>

<td><input type="submit" value="Submit" /></td>
<td><input type="reset" value="Reset" /></td>
</tr>
<tr>
<td colspan="2">Already registered!! <a href="Home.jsp">Login Here</a></td>
</tr>
</tbody>
</table>
            </center>
        </form>

</body>
</html>