<%@ page import ="java.sql.*"%>
<%@ page import ="java.lang.Math"%>
<%@ page import ="db.*"%>

<%
String sName=request.getParameter("user_name");
String sEmail=request.getParameter("user_email");
String sCellNo=request.getParameter("cell_number");
String sPwd	= request.getParameter("user_password");

try{
mySqlConnection_login mySqlConn = new  mySqlConnection_login();
Connection conn			  = mySqlConn.getDbConnection();
Statement stmt	= conn.createStatement();
ResultSet rs	= stmt.executeQuery("SELECT * FROM login_details where user_email = '"+sEmail+"';");
if (rs.next()){
	out.println("Email-Id already exists");
	out.println("<script>setTimeout(function(){location.href = '../html/SignUpPage.html'; }, 2500);</script>");
	}
	 

else{
	mySqlConnection_login mySqlAdd = new  mySqlConnection_login();
	mySqlAdd.mySqlDbInsertlogind(sName,sEmail,sCellNo,sPwd);
	out.println("Registering Please Wait");
	out.println("<script>setTimeout(function(){location.href = '../html/Sign_up_success.html'; }, 2500);</script>");
	
}	
conn.close(); 
}
catch(Exception e){ System.out.println(e);}



%>

