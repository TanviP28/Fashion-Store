<%@ page import ="java.sql.*"%>
<%@ page import ="java.lang.Math"%>
<%@ page import ="db.*"%>


<%
String userid = session.getAttribute("ID").toString();
double sum=0;
String UserId="";
String Pid	 ="";
String Pname ="";
double Pprice=0;
try
{
	mySqlConnection_login mySqlConn = new  mySqlConnection_login();
	Connection conn			  = mySqlConn.getDbConnection();
	Statement stm = conn.createStatement();
	ResultSet rs = stm.executeQuery("SELECT  cart_details.cart_user,cart_details.cart_id,products_id, products_name, products_price, products_img  FROM products_details inner join cart_details on products_details.products_id=cart_details.cart_product AND (cart_details.cart_user='"+userid+"'); ");	
	do{
	UserId=rs.getString(1);
	Pid	 =rs.getString(3);
	Pname =rs.getString(4);
	Pprice=rs.getDouble(5);
	mySqlConnection_contact Insertorderd = new mySqlConnection_contact();
	Insertorderd.mySqlDbInsertcheckoutd(UserId,Pid,Pname,Pprice);
	}while(rs.next());
	}
catch(Exception e){ System.out.println(e);}


%>
	
		