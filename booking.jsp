<%@ page import="java.util.*"%>
<%@ page import="java.time.*"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.servlet.*"%>

<html>
<head>
<title>Customer Booking Page</title>
    <link rel="stylesheet" type="text/css" href="style.css">
<ul>
  <li><a class="active" href="homepage.html">Home</a></li>
  <li><a href="process.html">Process</a></li>
  <li><a href="contact.html">Contact us</a></li>
  <li><a href="aboutus.html">About</a></li>
</ul>
</head>
<p id="demo"></p>
<script>
    function validate()
        {
            var val=document.form.value.value;
            var date=document.form.dt.value;
        
        if(val=="" || date=="")
        {
            document.getElementById('mydiv').innerHTML="Please enter correct info!";
            return false;
        }
}

function myFunction() {
  let text = "Confirm Before You Proceed For Payment!";
  
  if (confirm(text) == true)
  {
    text = "You pressed Submit!";
  } else 
  {
    text = "You canceled!";
    return;
  }
  document.getElementById("mydiv").innerHTML = text;
}
</script>

<%
    int id = (int)(Math.random() * 101)+1000;
    session.setAttribute("bid", id);

    String sp=request.getParameter("spname");
    session.setAttribute("spname",sp);

    String veh=request.getParameter("veh");
    session.setAttribute("veh",veh);

    String date = request.getParameter("date");
    session.setAttribute("date", date);
%>
<body>
<div class="loginbox">
<form action="booking2.jsp" name="form" id="send_req" method="post" onSubmit='return validate()'>
    <h1>Welcome"<%= session.getAttribute("cemail").toString()%>"</h1>
    <br> <br>
    <p>Booking Id = <%= id %></p>  
    <br><br><br>
    <center><b>Select Below Option to Place Booking Request</b></center>
      <br><br>&emsp; &emsp; &emsp;&emsp;
    <div class="dropdown">
    <select class="dropbtn" name="spname">Select SP
    <div class="dropdown-content">
          <option value="BG SERVICE" name="bg">BG Rental Service - Chinchwad</option>
          <option value="ABCD" name="ab">ABCD Service - Pimpri</option>
          <option value="QWERT" name="qw">QWERT Service - Yamunanagar</option>
      </select>
      </div>
      <%session.setAttribute("value", id);%>

      <br><br><br>
      &emsp; &emsp; &emsp;&emsp;
      <select class="dropbtn" name="veh">Select Vehicle
      <div class="dropdown-content">
          <option value="Mini Sedan!2000" name="veh">Mini Sedan (Rs 2000)</option>
          <option value="Premium Sedan!3500" name="veh">Premium Sedan (Rs 3500)</option>
          <option value="SUV!5000" name="veh">SUV (Rs 5000)</option>
          <option value="Travellar!8000" name="veh">Travellar (Rs 8000)</option>
          </select>
      <br><br><br>&emsp; &emsp; &emsp;&emsp;
      <span class="date">Date:</span>
      <input type="datetime-local" id="date" value="dt" name="date">
      <br><br><br>
        <center><font color="red"><div id='mydiv'></div></font></center>
              <input type="submit" onclick="myFunction()" name="submit" value="Submit Booking Request"><br>
        </div>
      </div>  
    </div>
    </form>
  </body>
</html>

<style>
.dropbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: rgb(230, 111, 37);;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
  display: block;
}

.dropdown:hover .dropbtn {
  background-color: #3e8e41;
}

.loginbox span {
      font-size: 18px;
      font-weight: 600;
      color: white;
      padding: 8px;
   }

.date{
 background-color: #4caf50;
}
</style>