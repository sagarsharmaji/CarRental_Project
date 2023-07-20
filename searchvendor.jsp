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

<%String semail="";
try{
	Class.forName("org.postgresql.Driver");
	Connection conn= DriverManager.getConnection("jdbc:postgresql:postgres","postgres","postgres");
	PreparedStatement ps=null;
    semail=request.getParameter("email");
    
	ps=conn.prepareStatement("select * from ser_pro where semail=?");
	ps.setString(1,semail);
	ResultSet rs=ps.executeQuery();
%>
		<table id="ser_pro" border=2><br><br><br>
		<h2><b><center>Service Provider Details</center></b></h2><br><br>
		<tr><th>SP Name</th><th>Email</th><th>Phone no</th><th>Address</th><th>Password</th></tr>
		<% while(rs.next())
		{
			%>
				<tr>
				<td><% out.println(rs.getString(1)); %></td>
				<td><% out.println(rs.getString(2)); %></td>
				<td><% out.println(rs.getString(3)); %></td>
				<td><% out.println(rs.getString(4)); %></td>
				<td><% out.println(rs.getString(5)); %></td>
				</tr>
			<%
					}
				}
				catch(Exception e){
					out.println(e);
				}
			%>
		</table>
	</body>
</html>