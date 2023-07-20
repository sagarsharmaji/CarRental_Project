<%@ page import="java.util.*"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*"%>

<%
if(request.getParameter("login")!=null)
{
String email=request.getParameter("cemail");
String pass=request.getParameter("pass");
 
Statement stmt=null;
Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql:postgres","postgres","postgres");
	stmt=con.createStatement();
	stmt.executeQuery("select * from customer where cemail = '"+email+"' and cpass = '"+pass+"';");
    
	session.setAttribute("cemail", email);

				out.println("<script type=\"text/javascript\">");
				out.println("alert('Now go to Booking');");
				out.println("location='booking.html';");
				out.println("</script>");
				String site=new String("http://localhost:8080/test/CRMS/booking.jsp");
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location",site);	
}
catch(Exception e){
        out.println(e);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Enter All Details');"+e);
                out.println("location='page1.jsp';");
                out.println("</script>");
}
}
else{
	out.println("<script type=\"text/javascript\">");
	out.println("alert('Press Login Button');");
	out.println("location='page1.jsp';");
	out.println("</script>"); 
}		
%>