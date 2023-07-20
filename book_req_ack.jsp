<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
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
<h2><b><center>INVOICE RECEIPT</center></b></h2>

<%
Double amount = 0.0;
String final_amt="";
int invoice=0;

if(request.getParameter("submit")!=null){

try{
    String total="",veh_type="",r_date="",service_amt="",date_time="",semail="",cemail="",spname="",smob="",saddr="",fname="",lname="",caddr="",cmob="";

	ResultSet rs1=null,rs2=null,rs3=null,rs4=null;
	Statement stmt1=null,stmt2=null,stmt3=null;
	PreparedStatement ps1=null,ps2=null;
	Class.forName("org.postgresql.Driver");
    Connection conn= DriverManager.getConnection("jdbc:postgresql:postgres","postgres","");
	
	String bid=session.getAttribute("bid").toString();
	final_amt=session.getAttribute("service_amt").toString();
	//int bid=Integer.parseInt(b);

	stmt1=conn.createStatement();
	rs1 = stmt1.executeQuery("select bid,veh_type,date_time,location,service_amt,cemail,semail from booking where bid="+bid+"");
	
    if(rs1.next()){
		bid=rs1.getString(1).toString();
		veh_type=rs1.getString(2);
		date_time=rs1.getString(3);
		caddr=rs1.getString(4);
		service_amt=rs1.getString(5);
		cemail=rs1.getString(6);
        semail=rs1.getString(7);
	}
    out.print(veh_type);
	String[] type=veh_type.split(",");
	String[] amt=service_amt.split(",");
	String[] arra=date_time.split(" ");
	String date=arra[0];
	String time="";

	stmt2=conn.createStatement();
	rs2= stmt2.executeQuery("select spname,smob,saddr from ser_pro where semail='"+semail+"'");
	
    if(rs2.next()){
		spname=rs2.getString(1);
		smob=rs2.getString(2);
		saddr=rs2.getString(3);
	}

	stmt3=conn.createStatement();
	rs3=stmt3.executeQuery("select fname,lname,cmob,caddr from customer where cemail='"+cemail+"'");
	
    if(rs3.next()){
                fname=rs3.getString(1);
                lname=rs3.getString(2);
                cmob=rs3.getString(3);
                caddr=rs3.getString(4);
    }

	total=request.getParameter("total_amt");
	float tot_amt=Float.parseFloat(total);
	ps1=conn.prepareStatement("insert into reciept(r_date,tot_pay,bid) values(?,?,?)");//,Statement.RETURN_GENERATED_KEYS);
	ps1.setString(1,r_date);
	ps1.setFloat(2,tot_amt);
	ps1.setString(3,bid);
	ps1.executeUpdate();
	/*rs4=ps1.getGeneratedKeys();
    if(rs4.next()){
		invoice=rs4.getInt(1);	
	}*/

%>

<b><font>Invoice no: <%=invoice%></font></b><br><br>
<table>
<tr>
<td>
<font color="white">SP Details</font>
<br>
<hr>
</td>
<td>
<font color="white">Customer Details</font>
<br>
<hr>
</td>
</tr>

<tr>
<td>
<table>
<font color="black">
SP Name: <%out.print(spname);%><br>
SP Address: <%out.print(smob);%><br>
Contact: <%out.print(saddr);%></font><br>
</table>
<hr>
</td>
<td>
<table>
<font color="black">
Customer First Name: <%out.print(fname);%><br>
Customer Last Name: <%out.print(lname);%><br>
Customer Address: <%out.print(caddr);%><br>
Contact: <%out.print(cmob);%></font><br>
</table>
<hr>
</td>
</tr>
</table>
<h1><center><font color="white">Service Details<font></center></h1>

<table width="100%">
<tr>
<th><font color="white">Vehicle Type<font</th>
<th><font color="white">Service Amount<font </th>
</tr>
<%	
	out.print(type[0]);
	for(int i=0;i<type.length;i++){
	amount = amount+Double.parseDouble(amt[i]);
%>
<tr>
<td>
<center><font color="white">
<%out.print(veh_type);%>
</font></center>
</td>
<td>
<center>
<font color="white">
<%out.print(amt[i]);%>
</font>
</center>
</td>
</tr>
<%
}
}
catch(Exception ie){
    out.print(ie);
}
}
%>
</table>
<center><h1>For Booking ID"<%= session.getAttribute("bid").toString()%>" Total amount Payable : <%= session.getAttribute("service_amt")%></h1><center> 
<br><br>
<center><h1>To : <%= session.getAttribute("spname")%></h1><center> 
<center><h1>At : <%= session.getAttribute("saddr")%></h1><center>
<br> 
<center><h1>Thank You!</h1>
<a href="http://localhost:8080/test/CRMS/homepage.html">LOGOUT</a>
</center>
</font>
</div>
</body>
</html>