<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import ="java.lang.Math"%>
<%@ page import ="db.*"%>  
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page import ="java.text.ParseException"%>
<%@ page import ="java.util.Date"%>
<%
java.util.Date d = new java.util.Date();
java.text.SimpleDateFormat d1=new  java.text.SimpleDateFormat("yyyy-MM-dd");
String date1=d1.format(d);

try{mySqlConnection_login mySqlConn = new  mySqlConnection_login();
Connection conn			  = mySqlConn.getDbConnection();
Statement stm = conn.createStatement();
ResultSet rs = stm.executeQuery("SELECT order_detatocal,order_userid FROM project_login.order_details WHERE order_id='11';"); 
if (rs.next()){String date2 = rs.getString(1);}


ResultSet rs1 = stm.executeQuery("SELECT DATEDIFF('"+date2+"','"+date1+"');");
if (rs1.next())
{
	out.println("hello");
}
	
}
catch (Exception e){ System.out.println(e);}
%> 