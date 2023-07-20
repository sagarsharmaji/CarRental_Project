<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*"%>

<%
float total_amt = 0;
if(request.getParameter("submit")!=null)
{
	String saddr="";
	String semail="";
	String b=session.getAttribute("bid").toString();
	int bid=Integer.parseInt(b);
/*
String bid=(String)request.getParameter("bid");
String spname=session.getAttribute("spname").toString();
String veh=session.getAttribute("veh").toString();
String date=session.getAttribute("date").toString();
String cemail=session.getAttribute("cemail").toString();*/
	String spname=request.getParameter("spname");
   // String veh=request.getParameter("veh");
	String cemail=session.getAttribute("cemail").toString();
    String date = request.getParameter("date");

Statement stmt=null;
Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql:postgres","postgres","postgres");
	stmt=con.createStatement();

	String[] car=request.getParameterValues("veh");
	String s="";
	String car_name = "";
	for(String t: car)
        { 
        	String[] arra =  t.split("!");
         	s+=arra[1]+"%,%";//for amount 
			car_name+=arra[0]+","; // for service name 
         	total_amt = total_amt+Float.parseFloat(arra[1]);
        }
	String veh_type=car_name.substring(0,car_name.length()-1); 
	String service_amt=s.substring(0,s.length()-3);
	
	PreparedStatement ps1=con.prepareStatement("Select saddr,semail from ser_pro where spname='"+spname+"'");
		rs=ps1.executeQuery();
		if(rs.next()){		
		saddr=rs.getString(1);
		semail=rs.getString(2);
		}
	stmt.executeUpdate("insert into booking (bid,veh_type,date_time,location,service_amt,cemail,semail) values('"+bid+"','"+veh_type+"','"+date+"','"+saddr+"','"+service_amt+"','"+cemail+"','"+semail+"')");
    session.setAttribute("bid", bid);
	session.setAttribute("service_amt", service_amt);
	session.setAttribute("spname",spname);
	session.setAttribute("saddr",saddr);
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Now go to Ack Page');");
				out.println("location='book_req_ack.jsp';");
				out.println("</script>");
				String site=new String("http://localhost:8080/test/CRMS/book_req_ack.jsp");
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location",site);	
}
catch(Exception e){
        out.println(e);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Enter All Details');"+e);
                out.println("location='booking.jsp';");
                out.println("</script>");
}
}
else{
	out.println("<script type=\"text/javascript\">");
	out.println("alert('Press Login Button');");
	out.println("location='booking.jsp';");
	out.println("</script>"); 
}		
%>