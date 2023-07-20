<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="pageNumber.*, java.util.*, java.sql.*, java.lang.*, java.io.*"%>

<html>
<head>
<link rel="stylesheet" href="table.css">
</head>
<ul>
    <li><a class="active" href="homepage.html">Home</a></li>
    <li><a href="process.html">Process</a></li>
    <li><a href="contact.html">Contact us</a></li>
    <li><a href="aboutus.html">About</a></li>
</ul>

<body>
<div class="wrap">
<nav>
<div class="logo">CRMS</div>
</nav></div>
<div class="loginbox">
<h2><b><center>Customer Details</center></b></h2>
<%String cemail="";
try{
	Class.forName("org.postgresql.Driver");
	Connection conn= DriverManager.getConnection("jdbc:postgresql:postgres","postgres","postgres");
	PreparedStatement ps=null;
    cemail=request.getParameter("email");
    
	ps=conn.prepareStatement("select * from customer where cemail=?");
	ps.setString(1,cemail);
	ResultSet rs=ps.executeQuery();
%>
		<table id="customers" border=2><br><br><br>
		<br><br>
		<tr><th>First Name</th><th>Last Name</th><th>Email</th><th>Phone no</th><th>Address</th><th>Password</th></tr>
		<% while(rs.next())
		{
			%>
				<tr>
				<td><% out.println(rs.getString(1)); %></td>
				<td><% out.println(rs.getString(2)); %></td>
				<td><% out.println(rs.getString(3)); %></td>
				<td><% out.println(rs.getString(4)); %></td>
				<td><% out.println(rs.getString(5)); %></td>
				<td><% out.println(rs.getString(6)); %></td></tr>
			<%
					}
				}
				catch(Exception e){
					out.println(e);
				}
			%>
		</table>
		</div>
	</body>
</html>