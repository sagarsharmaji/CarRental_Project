<%@ page language = "java" contentType = "text/html; charset=ISO-8859-1" 
pageEncoding = "ISO-8859-1" %>
<%@ page import = "java.sql.*" %>
<%
try
{
Class.forName ("org.postgresql.Driver");
Connection conn =
    DriverManager.getConnection ("jdbc:postgresql:postgres", "postgres","postgres");
PreparedStatement ps = null;
ps = conn.prepareStatement ("select * from customer");
ResultSet rs = ps.executeQuery ();
%>
<html>
<head>
<link rel="stylesheet" href="table.css">
</head><body>
<div class="wrap">
<nav>
<div class="logo">CRMS</div>
</nav></div>
<table id="customers" border=2 > 
<h2><br><br><br><b><center> Customer Details</center></b></h2><br><br> 
<tr><th>First Name</th><th>Last Name</th><th>Email</th><th>Phone no</th><th>Address</th><th>Password</th></tr>
    
<%while(rs.next())
{      
%>
<tr> 
<td><% out.println (rs.getString (1));
      %></td> 
<td><% out.println (rs.getString (2));
      %></td> 
<td><% out.println (rs.getString (3));
      %></td> 
<td><% out.println (rs.getString (4));
      %></td> 
<td> <% out.println (rs.getString (5));
      %></td> 
<td><% out.println (rs.getString (6));
      %></td> 
<td><% out.println (rs.getString (7));
    %></td></tr> 
<%
}
}
catch (Exception e)
{
out.println (e);
}
%> 
</table> 
</body> 
</html>