package db;

import java.sql.*;

public class mySqlConnection_cart
{
	public mySqlConnection_cart()
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
	
		
		public void mySqlDbcartd(String userid,String Pid){
		
		try(Connection conn = this.getDbConnection();                                   
                PreparedStatement stm = conn.prepareStatement("DELETE FROM `project_login`.`order_details` WHERE `order_userid`='"+userid+"' and `order_productid`='"+Pid+"';")){
			//if more than one? in Sql Query its is used
			stm.executeUpdate();
			conn.close(); 
			 			
		}
		catch(Exception e){ System.out.println(e);}
		}
		
		public void mySqlDbwishtoc(String sUserid,String Pid){
		
		try(Connection conn = this.getDbConnection();
                PreparedStatement stm = conn.prepareStatement("INSERT INTO cart_details(cart_user, cart_product) VALUES(?,?);");){
			//if more than one? in Sql Query its is used
			stm.setString(1,sUserid);
			stm.setString(2,Pid);
			stm.executeUpdate();
			conn.close();  			
		}
		catch(Exception e){ System.out.println(e);}
		}
		
		
}


      