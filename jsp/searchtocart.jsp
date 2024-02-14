<%@ page import ="java.sql.*"%>
<%@ page import ="java.lang.Math"%>
<%@ page import ="db.*"%>



<%
String userid = session.getAttribute("ID").toString();
String message=request.getParameter("mess");
java.util.Date d = new java.util.Date();
java.text.SimpleDateFormat d1=new  java.text.SimpleDateFormat("dd-MM-yyyy");
String date1=d1.format(d);
try
{
	mySqlConnection_login mySqlConn = new  mySqlConnection_login();
	Connection con			  = mySqlConn.getDbConnection();
	PreparedStatement stmt = con.prepareStatement("INSERT INTO cart_details(cart_user, cart_product,cart_date) VALUES(?,?,?);");
	stmt.setString(1,userid);
	stmt.setString(2,message);
	stmt.setString(3,date1);
	stmt.executeUpdate();
	mySqlConnection_login mySqlCon = new  mySqlConnection_login();
	Connection conn			  = mySqlConn.getDbConnection();
	PreparedStatement stm =conn.prepareStatement("DELETE FROM `project_login`.`wish_details` WHERE `wish_productid` = '"+message+"' AND `wish_userid`='"+userid+"';");
	stm.executeUpdate();
	}
catch(Exception e){ System.out.println(e);}
response.sendRedirect("DisplayCart.jsp"); 


%>
