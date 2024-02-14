<%@ page import ="java.sql.*"%>
<%@ page import ="java.lang.Math"%>
<%@ page import ="db.*"%>

<%
String message=request.getParameter("mess");
String userid = session.getAttribute("ID").toString();

try{
	mySqlConnection_login mySqlConn = new  mySqlConnection_login();
	Connection conn			  = mySqlConn.getDbConnection();
	PreparedStatement stm = conn.prepareStatement("INSERT INTO wish_details(wish_userid, wish_productid) VALUES(?,?);");
	stm.setString(1,userid);
	stm.setString(2,message);
	stm.executeUpdate();
	conn.close(); }
catch(Exception e){ System.out.println(e);}

response.sendRedirect("../jsp/DisplayWishlist.jsp");


%>