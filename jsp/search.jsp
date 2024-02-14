<%@ page import ="java.sql.*"%>
<%@ page import ="java.lang.Math"%>
<%@ page import ="db.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Result</title>

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
 
<h3> <span> Search Result</span></h3>
</div>
    
        
<%

try
{
	String message=request.getParameter("mess");
	mySqlConnection_login mySqlConn = new  mySqlConnection_login();
	Connection conn			  = mySqlConn.getDbConnection();
	Statement stm = conn.createStatement();
	ResultSet rs = stm.executeQuery("SELECT * from products_details where products_name='"+message+"';");
	if(rs.next()==false){}
	else{
	
	do{
		%>
		
		<div id= "container">
		<div class="table-responsive" >
            <table class="table ">
                <thead class="text-center">
                    <tr>
                        <th scope="col" class="border-0 bg-light">
                            <div class="py-2 text-uppercase">PRODUCT ID</div>
                        </th>
                        <th scope="col" class="border-0 bg-light">
                            <div class="p-2 px-3 text-uppercase">PRODUCT IMAGE</div>
                        </th>
                        <th scope="col" class="border-0 bg-light">
                            <div class="py-2 text-uppercase">PRODUCT NAME</div>
                        </th>
                        
                        <th scope="col" class="border-0 bg-light">
                            <div class="py-2 text-uppercase">PRICE</div>
                        </th>

                        <th scope="col" class="border-0 bg-light">
                            <div class="py-2 text-uppercase">Add To Wishlist</div>
                        </th>
						<th scope="col" class="border-0 bg-light">
                            <div class="py-2 text-uppercase">Add To Cart</div>
                        </th>
                    </tr>
                
                <tbody class="text-center">
                    <tr>
                        <td class="border-0 align-middle"><strong><%=rs.getString(1)%></strong></td>
                        <td class="border-0 align-middle" style="width:230px;">  <img src="<%=rs.getString(4)%>" alt="" width="120" class="img-fluid rounded shadow-sm"> </td>
                        <td class="border-0 align-middle"> <h5 class="mb-0"> <%=rs.getString(2)%> </h5> </td>                        
                        <td class="border-0 align-middle"><strong>Rs <%=rs.getDouble(3)%></strong></td>                        
                        <td><a class="btn btn-danger " href="cart.jsp?mess=<%=rs.getString(1)%>" style="margin-top:50px;">ADD TO WISHLIST</a></td>
						<td><a class="btn btn-info" href="searchtocart.jsp?mess=<%=rs.getString(1)%>" style="margin-top:50px;">ADD TO CART</a></td>
                    </tr>					
                </tbody>
            </table>
        </div>
		</div>
		<%
	}while(rs.next());
	}
	
	
}
catch(Exception e){ System.out.println(e);}


%>
<br><br><br>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer id = "footer" class="container" style="max-width: 100%;margin-bottom:0;">
        <div id = "products">             
            <h3> Products </h3>            
            <ul>    
                <li> <a href="western_wear"> Western Wear </a></li>
                <li> <a href="ethnic_wear"> Ethnic Wear </a></li>
                <li> <a href="formal_wear"> Formal Wear </a></li>
                <li> <a href="footwear"> Footwear </a></li>
                <li> <a href="bags"> Bags </a></li>
                <li> <a href="jewellery"> Jewellery </a></li>
                <li> <a href="accessories"> Accessories </a></li>                   
            </ul>              
        </div>

        <div id = "useful_links"> 
            <h3> Useful Links </h3>            
            <ul>
                <li> <a href="index.html"> Home </a></li>
                <li> <a href="about_us.html"> About Us </a></li>
                <li> <a href="contact_us.html"> Contact Us </a></li>                
            </ul>           
            <p id = "copyright">copyright © 2021 – explored</p>
        </div>

        <div id = "stay_in_touch">
            <h3> Stay In Touch </h3>            
            <ul>
                <li><a href="https://www.instagram.com" target="_blank"><i style="font-size:26px" class="fab 5x fa-instagram"></i></a></li>
                <li><a href="https://www.facebook.com" target="_blank"><i style="font-size:26px" class="fab 5x fa-facebook-f"></i></a></li>
                <li><a href="https://www.twitter.com" target="_blank"><i style="font-size:26px" class="fab 5x fa-twitter"></i></a></li>
                <li><a href="https://www.pinterest.com" target="_blank"><i style="font-size:26px" class="fab 5x fa-pinterest"></i></a></li>
            </ul>
        </div>    
    </footer>  
</body>
</html>

        
    