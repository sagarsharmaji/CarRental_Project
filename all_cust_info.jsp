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
<form method="post">
<h2><b><center>All Customer Details</center></b></h2>
<table border="2">
<tr>
<th>First Name</th>
<th>Last Name</th>
<th>Email</th>
<th>Phone No</th>
<th>Address</th>
<th>Password</th>
</tr>
<%
try
{
Class.forName("org.postgresql.Driver");

String query="select * from customer";
Connection conn=DriverManager.getConnection("jdbc:postgresql:postgres","postgres","postgres");

Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{
%>  
<tr>
    <td><%=rs.getString("fname") %></td>
    <td><%=rs.getString("lname") %></td>
    <td><%=rs.getString("cemail") %></td>
    <td><%=rs.getString("cmob") %></td>
    <td><%=rs.getString("caddr") %></td>
    <td><%=rs.getString("cpass") %></td>
</tr>
<%
}
%>
    </table>
    <%
    rs.close();
    stmt.close();
    conn.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }
%>
</form>
</div>
</body>
</html> 