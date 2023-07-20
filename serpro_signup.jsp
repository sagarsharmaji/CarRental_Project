<%@ page import="java.util.*"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*"%>

<%
if(request.getParameter("sp")!=null)
{
String spname=request.getParameter("spname");
String semail=request.getParameter("email");
String smob=request.getParameter("mobnum");
String saddr=request.getParameter("add");
String spass=request.getParameter("pass");
Statement stmt=null;
Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql:postgres","postgres","postgres");
	stmt=con.createStatement();
	stmt.executeUpdate("insert into ser_pro values('"+spname+"','"+semail+"','"+smob+"','"+saddr+"','"+spass+"');");
	
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Now go to login');");
				out.println("location='serprologin.jsp';");
				out.println("</script>");
				String site=new String("http://localhost:8080/test/CRMS/serprologin.html");
				response.setStatus(response.SC_MOVED_TEMPORARILY);
				response.setHeader("Location",site);	
}
catch(Exception e){
        out.println(e);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Enter All Details');"+e);
                out.println("location='serpro_sign.jsp';");
                out.println("</script>");
}
}
else{
	out.println("<script type=\"text/javascript\">");
	out.println("alert('Press SignUp Button');");
	out.println("location='serpro_sign.jsp';");
	out.println("</script>"); 
}		
%>