<%@ page import ="java.sql.*"%>
<%@ page import ="java.lang.Math"%>
<%@ page import ="db.*"%>

<%
String message=request.getParameter("mess");

session.setAttribute("Productid",message);

String userid = session.getAttribute("ID").toString();

java.util.Date d = new java.util.Date();
java.text.SimpleDateFormat d1=new  java.text.SimpleDateFormat("dd-MM-yyyy");
String date1=d1.format(d);

try{
	mySqlConnection_login mySqlConn = new  mySqlConnection_login();
	Connection conn			  = mySqlConn.getDbConnection();
	PreparedStatement stm = conn.prepareStatement("INSERT INTO cart_details(cart_user, cart_product,cart_date) VALUES(?,?,?);");
	stm.setString(1,userid);
	stm.setString(2,message);
	stm.setString(3,date1);
	stm.executeUpdate();
	conn.close(); }
catch(Exception e){ System.out.println(e);}

response.sendRedirect("../jsp/DisplayCart.jsp");




%>


