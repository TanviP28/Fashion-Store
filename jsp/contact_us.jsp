<%@ page import ="java.sql.*"%>
<%@ page import ="java.lang.Math"%>
<%@ page import ="db.*"%>

<%
String sName=request.getParameter("first_name");
String sEmail=request.getParameter("store_email");
String sCellNo=request.getParameter("store_phone");
String sQuery	= request.getParameter("store_textarea");

try{
mySqlConnection_contact mySqlConn = new  mySqlConnection_contact();
Connection conn			  = mySqlConn.getDbConnection();
Statement stmt	= conn.createStatement();
ResultSet rs	= stmt.executeQuery("SELECT * FROM contact_details where contact_email = '"+sEmail+"';");
if (rs.next()){
	out.println("Query Already Registered");
	out.println("<script>setTimeout(function(){location.href = '../html/contact_us.html'; }, 2500);</script>");
	}
	 

else{
	mySqlConnection_contact mySqlAdd = new  mySqlConnection_contact();
	mySqlAdd.mySqlDbInsertcontactd(sName,sEmail,sCellNo,sQuery);
	out.println("<script>setTimeout(function(){location.href = '../html/contact_success.html'; }, 2500);</script>");
	
}	
conn.close(); 
}
catch(Exception e){ System.out.println(e);}



%>

