package db;

import java.sql.*;

public class mySqlConnection_login
{
	public mySqlConnection_login()
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
	
	
	public void mySqlDbInsertlogind(String sName,String sCellNo,String sEmail,String sPwd){
		
		try(Connection conn = this.getDbConnection();
                PreparedStatement stm = conn.prepareStatement("INSERT INTO login_details(user_name, user_email, user_cellno, user_pwd) VALUES(?,?,?,?);")){
			//if more than one? in Sql Query its is used
			stm.setString(1,sName);
			stm.setString(2,sCellNo);
			stm.setString(3,sEmail);
			stm.setString(4,sPwd);
			stm.executeUpdate();
			
			conn.close(); 
			 			
			
		}
		catch(Exception e){ System.out.println(e);}
	
		
		}
		


}







      