package db;

import java.sql.*;

public class mySqlConnection_contact
{
	public mySqlConnection_contact()
	{}
	
	public Connection getDbConnection()
	{
		String DriverType = "com.mysql.jdbc.Driver";
		String dbUrl	  = "jdbc:mysql://localhost:3306/project_login";
		String dbUser	  = "root";
		String dbPwd	  = "tanvi123";
		Connection conn	  = null;

		try{
			Class.forName(DriverType);
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPwd);	
		}
		catch(Exception e){ System.out.println(e);}
		return conn;
		
	}
	
	
	public void mySqlDbInsertcontactd(String sName,String sCellNo,String sEmail,String sQuery){
		
		try(Connection conn = this.getDbConnection();
                PreparedStatement stm = conn.prepareStatement("INSERT INTO contact_details(contact_name, contact_email, contact_cell,contact_query) VALUES(?,?,?,?);")){
			//if more than one? in Sql Query its is used
			stm.setString(1,sName);
			stm.setString(2,sCellNo);
			stm.setString(3,sEmail);
			stm.setString(4,sQuery);
			stm.executeUpdate();
			
			conn.close(); 
			 			
			
		}
		catch(Exception e){ System.out.println(e);}
	
		
		}
		
		public void mySqlDbInsertcheckoutd(String sUserid,String Pid,String sPname,double Pprice){
		
		try(Connection conn = this.getDbConnection();
                PreparedStatement stm = conn.prepareStatement("INSERT INTO order_details(order_userid, order_productid,order_productname,order_productprice) VALUES(?,?,?,?);")){
			//if more than one? in Sql Query its is used
			stm.setString(1,sUserid);
			stm.setString(2,Pid);
			stm.setString(2,sPname);
			stm.setDouble(3,Pprice);
			stm.executeUpdate();
			conn.close(); 
			 			
		}
		catch(Exception e){ System.out.println(e);}
		}


}







      