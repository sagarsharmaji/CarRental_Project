<%@ page import="java.util.*"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*"%>

<%
if(request.getParameter("signUp")!=null)
{
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String cemail=request.getParameter("email");
String cmob=request.getParameter("mobnum");
String caddr=request.getParameter("add");
String cpass=request.getParameter("pass");
Statement stmt=null;
Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql:postgres","postgres","postgres");
	stmt=con.createStatement();
	stmt.executeUpdate("insert into customer(fname,lname,cemail,cmob,caddr,cpass) values('"+fname+"','"+lname+"','"+cemail+"','"+cmob+"','"+caddr+"','"+cpass+"')");
	
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Now go to home page to login');");
				out.println("location='page1.jsp';");
				out.println("</script>");
				String site=new String("http://localhost:8080/test/CRMS/page1.jsp");
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location",site);	
}
catch(Exception e){
        out.println(e);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Enter All Details');");
                out.println("location='sign.jsp';");
                out.println("</script>");
}
}
else{
	out.println("<script type=\"text/javascript\">");
	out.println("alert('Please Enter All Details');");
	out.println("location='sign.jsp';");
	out.println("</script>"); 
}		
%>