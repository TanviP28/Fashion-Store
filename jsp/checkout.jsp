<%@ page import ="java.sql.*"%>
<%@ page import ="java.lang.Math"%>
<%@ page import ="db.*"%>

<%
String sAddress=request.getParameter("inadress");
String sPin=request.getParameter("pincode");
String sState=request.getParameter("state");
String sPhone	= request.getParameter("phone");
String sPayment	= request.getParameter("payment");
String sDate	= request.getParameter("currentDate");

String userid = session.getAttribute("ID").toString();
String sum = session.getAttribute("total").toString();
java.util.Date d = new java.util.Date();
java.text.SimpleDateFormat d1=new  java.text.SimpleDateFormat("dd-MM-yyyy");
String date1=d1.format(d);


try{
	mySqlConnection_login mySqlConn = new  mySqlConnection_login();
	Connection conn			  = mySqlConn.getDbConnection();
	
	
	PreparedStatement stmt = conn.prepareStatement("INSERT INTO order_details (order_userid,order_productprice,order_address,order_pin,order_state,order_mop,order_date) VALUES (?,?,?,?,?,?,?);");
	stmt.setString(1,userid);
	stmt.setString(2,sum);
	stmt.setString(3,sAddress);
	stmt.setString(4,sPin);
	stmt.setString(5,sState);
	stmt.setString(6,sPayment);
	stmt.setString(7,date1);
	stmt.executeUpdate();
	
	
	out.println("<script>alert('Your Order has been Placed')</script>");
	out.println("<script>setTimeout(function(){location.href = '../jsp/cartdelete.jsp'; }, 2500);</script>");
	conn.close(); 
}
catch(Exception e){ System.out.println(e);}



%>

	
		