<%@ page import ="java.sql.*"%>
<%@ page import ="java.lang.Math"%>
<%@ page import ="db.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classic Curves-Order History</title>

    <link rel = "stylesheet" href = "../css/cart.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>  

</head>
<body>
<%@ include file="../html/nav-bar.html" %>
<div id = "heading">
 
<h3> <span> Previous Orders </span></h3>
</div>
    
<%
String userid = session.getAttribute("ID").toString();
try
{
	mySqlConnection_login mySqlConn = new  mySqlConnection_login();
	Connection conn			  = mySqlConn.getDbConnection();
	Statement stm = conn.createStatement();
	ResultSet rs = stm.executeQuery("SELECT * FROM order_details where order_userid='"+userid+"';");
	if(rs.next()==false){%><h3 class="text-center" style="font-family:Roboto;"> <b><span>  You haven't Placed a Order Yet</span></b></h3><%}
	else{
	do{
	%>
		
		<div id= "container">
		<div class="table-responsive" >
            <table class="table ">
                <thead class="text-center">
                    <tr>
                        <th scope="col" class="border-0 bg-light">
                            <div class="py-2 text-uppercase">Transcation ID</div>
                        </th>
                        
                        <th scope="col" class="border-0 bg-light">
                            <div class="py-2 text-uppercase">Total Amount</div>
                        </th>
                        
                        <th scope="col" class="border-0 bg-light">
                            <div class="py-2 text-uppercase">Address </div>
                        </th>

                        <th scope="col" class="border-0 bg-light">
                            <div class="py-2 text-uppercase">Pincode</div>
                        </th>
						<th scope="col" class="border-0 bg-light">
                            <div class="py-2 text-uppercase">State</div>
                        </th>
						<th scope="col" class="border-0 bg-light">
                            <div class="py-2 text-uppercase">Method of Payment</div>
                        </th><th scope="col" class="border-0 bg-light">
                            <div class="py-2 text-uppercase">Purchased Date</div>
                        </th>
						</th><th scope="col" class="border-0 bg-light">
                            <div class="py-2 text-uppercase">Receipt</div>
                        </th>
                    </tr>
                
                <tbody class="text-center">
                    <tr>
                        <td class="border-0 align-middle"><strong><%=rs.getInt(1)%></strong></td>
                        
                        <td class="border-0 align-middle"> <h5 class="mb-0">Rs <%=rs.getString(3)%> </h5> </td>                        
                        <td class="border-0 align-middle"><strong> <%=rs.getString(4)%></strong></td>                        
                        <td class="border-0 align-middle"><strong> <%=rs.getString(5)%></strong></td>                        
                        <td class="border-0 align-middle"><strong> <%=rs.getString(6)%></strong></td>                        
                        <td class="border-0 align-middle"><strong> <%=rs.getString(7)%></strong></td>  						
                        <td class="border-0 align-middle"><strong> <%=rs.getString(8)%></strong></td>  						
                        <td class="border-0 align-middle" ><strong><button onclick="document.location='../html/invoice.jsp'">Invoice</strong></button></td>  						
                    </tr> 
                </tbody>

            </table>
			
        </div>
		</div>
	<%
	}while(rs.next());
	}
	conn.close(); 
}
catch(Exception e){ System.out.println(e);}
%>