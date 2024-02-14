package db;

import java.sql.*;

public class mySqlConnection_orderproduct
{
	public mySqlConnection_orderproduct()
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
	
	
	public void mySqlDborderproduct(int iorder_id,int iproduct_id,String sproduct_name,String sproduct_price){
		
		try(Connection conn = this.getDbConnection();
                PreparedStatement stm = conn.prepareStatement("INSERT INTO order_product(order_id, products_id, products_name, products_price) VALUES(?,?,?,?);")){
			//if more than one? in Sql Query its is used
			stm.setInt(1,sName);
			stm.setInt(2,sCellNo);
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







      