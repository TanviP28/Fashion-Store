<%@ page import ="java.sql.*"%>
<%@ page import ="java.lang.Math"%>
<%@ page import ="db.*"%>


<%
String userid = session.getAttribute("ID").toString();
String message=request.getParameter("mess");
try
{
	mySqlConnection_login mySqlConn = new  mySqlConnection_login();
	Connection con			  = mySqlConn.getDbConnection();
	PreparedStatement stmt = con.prepareStatement("DELETE FROM `project_login`.`cart_details` WHERE `cart_product` = '"+message+"' AND `cart_user`='"+userid+"';");
	stmt.executeUpdate();
	
}
catch(Exception e){ System.out.println(e);}
response.sendRedirect("DisplayCart.jsp"); 


%>
	