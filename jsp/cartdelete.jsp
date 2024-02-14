<%@ page import ="java.sql.*"%>
<%@ page import ="java.lang.Math"%>
<%@ page import ="db.*"%>


<%
String userid = session.getAttribute("ID").toString();
try
{
	mySqlConnection_login mySqlConn = new  mySqlConnection_login();
	Connection con			  = mySqlConn.getDbConnection();
	PreparedStatement stmt = con.prepareStatement("DELETE FROM `project_login`.`cart_details` WHERE `cart_user`='"+userid+"';");
	stmt.executeUpdate();
	
}
catch(Exception e){ System.out.println(e);}
response.sendRedirect("../html/index1.html"); 


%>
	