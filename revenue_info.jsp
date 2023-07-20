<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="pageNumber.*, java.util.*, java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="table.css">
</head>
<ul>
  <li><a class="active" href="homepage.html">Home</a></li>
  <li><a href="process.html">Process</a></li>
  <li><a href="contact.html">Contact us</a></li>
  <li><a href="aboutus.html">About</a></li>
</ul>
<body>
<div class="loginbox">
<table border=2><br><br><br>
<center>
<%
try{
	Class.forName("org.postgresql.Driver");
	Connection conn= DriverManager.getConnection("jdbc:postgresql:postgres","postgres","postgres");
	PreparedStatement ps=null;

	ps=conn.prepareStatement("select sum(service_amt) from booking;");
	ResultSet rs=ps.executeQuery();

	%>&emsp; &emsp; &emsp;&emsp;
		<h2><b><center>Revenue Details</center></b></h2><br><br>
		
		<tr><th>Total Revenue This Quarter</th>
		</tr>
		<% while(rs.next())
		{
			%>
				<tr>
				<td><% out.println(rs.getString(1)); %></td>
				</tr>
				<%
		}
ps=conn.prepareStatement("select sum(service_amt) from booking");
rs=ps.executeQuery();
rs.next();
%></table>
<table>
<tr><th>Total Revenue</th><th><% out.println(rs.getFloat(1)); %></th></tr>
<%
}
catch(Exception e){
	out.println(e);
}
%>
</center>
</table>
</body>
</html>