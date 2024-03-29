<%@ page import ="java.sql.*"%>
<%@ page import ="java.lang.Math"%>
<%@ page import ="db.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classic Curves-CART</title>

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
 
<h3> <span> CART </span></h3>
</div>
    
        
<%
String userid = session.getAttribute("ID").toString();
double sum=0;
try
{
	mySqlConnection_login mySqlConn = new  mySqlConnection_login();
	Connection conn			  = mySqlConn.getDbConnection();
	Statement stm = conn.createStatement();
	ResultSet rs = stm.executeQuery("SELECT  cart_details.cart_user,cart_details.cart_id,products_id, products_name, products_price, products_img,cart_details.cart_date  FROM products_details inner join cart_details on products_details.products_id=cart_details.cart_product AND (cart_details.cart_user='"+userid+"'); ");
	if(rs.next()==false){%><h3 class="text-center" style="font-family:Roboto;"> <b><span> YOUR CART IS EMPTY !!</span></b></h3> <%}
	else{
	
	do{
		String Pname=rs.getString(4);
		double Pprice=rs.getDouble(5);
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
                            <div class="py-2 text-uppercase">ADDED ON</div>
                        </th>
                        <th scope="col" class="border-0 bg-light">
                            <div class="py-2 text-uppercase">REMOVE</div>
                        </th>
						
                    </tr>
                
                <tbody class="text-center">
                    <tr>
                        <td class="border-0 align-middle"><strong><%=rs.getInt(3)%></strong></td>
                        <td class="border-0 align-middle" style="width:230px;">  <img src="<%=rs.getString(6)%>" alt="" width="120" class="img-fluid rounded shadow-sm"> </td>
                        <td class="border-0 align-middle"> <h5 class="mb-0"> <%=rs.getString(4)%> </h5> </td>                        
                        <td class="border-0 align-middle"><strong>Rs <%=rs.getDouble(5)%></strong></td>                       
						<td class="border-0 align-middle"><strong><%=rs.getString(7)%></strong></td> 
						<td class="border-0 align-middle"><a href="cartremove.jsp?mess=<%=rs.getString(3)%>" class="text-dark"><i class="fa fa-trash"></i></a></td>
					</tr> 
                </tbody>

            </table>
        </div>
		</div>
		<%sum=sum+rs.getDouble(5);
	}while(rs.next());
	}
	
	
}
catch(Exception e){ System.out.println(e);}


%>

<div class="text-center" style="padding:50px 0px;margin:50px 140px;font-family:'Roboto';border:2px solid black;background-color:#404040;">
<h2 style="padding-bottom:15px;font-weight:600;color:#eee">Want DISCOUNT?</h2>
<a href="../html/quiz.html"><button class="btn btn-light btn-lg text-text-light"><b>PLAY AND EARN</b></button></a>

</div>
<div class="col-lg-6" style="margin-left:370px;margin-top:50px;margin-bottom:50px;width:100%;border:2px solid black;padding:20px;" >
            <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold text-center" style="font-size:22px;">ORDER SUMMARY</div>
            <div class="p-4">                
                <ul class="list-unstyled mb-4" style="font-size:19px">
                    <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Order Subtotal </strong><strong>Rs <%=sum%></strong></li>
                    <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Shipping and Handling</strong><strong>Rs 10.0</strong></li>
                    <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Discount</strong><strong>Rs 0.0</strong></li>
					<li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tax</strong><strong>Rs 0.0</strong></li>
                    <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total</strong>
                    <%sum=sum+10;
					session.setAttribute("total",sum);
					%>
					<h5 class="font-weight-bold">Rs <%=sum%></h5>
                    </li>
                </ul><a href="#" class="btn btn-dark rounded-pill py-2 btn-block" onclick="location.href='../html/address_payment.html'">Procceed to checkout</a>
            </div>
        </div> 
         

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer id = "footer">
        <div id = "products">             
            <h3> Products </h3>            
            <ul style="margin-left:10px;">    
                <li> <a href="../html/western_wear.html"> Western Wear </a></li>
                <li> <a href="../html/ethnic_wear.html"> Ethnic Wear </a></li>
                <li> <a href="../html/formal_wear.html"> Formal Wear </a></li>
                <li> <a href="../html/index1.html"> Footwear </a></li>
                <li> <a href="../html/index1.html"> Bags </a></li>
                <li> <a href="../html/index1.html"> Jewellery </a></li>
                <li> <a href="../html/index1.html"> Accessories </a></li>                   
            </ul>              
        </div>

        <div id = "useful_links"> 
            <h3> Useful Links </h3>            
            <ul style="margin-left:10px;">
                <li> <a href="../html/index1.html"> Home </a></li>
                <li> <a href="../html/about_us.html"> About Us </a></li>
                <li> <a href="../html/contact_us.html"> Contact Us </a></li>                
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

        
    