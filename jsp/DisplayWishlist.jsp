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
        <h3> <span> WISHLIST </span></h3>
    </div> 
<%
String userid = session.getAttribute("ID").toString();
try
{
	mySqlConnection_login mySqlConn = new  mySqlConnection_login();
	Connection conn			  = mySqlConn.getDbConnection();
	Statement stm = conn.createStatement();
	ResultSet rs = stm.executeQuery("SELECT  wish_details.wish_userid,wish_details.wish_id,products_id, products_name, products_price, products_img  FROM products_details inner join wish_details on products_details.products_id=wish_details.wish_productid AND (wish_details.wish_userid='"+userid+"'); ");
	if(rs.next()==false){
	%><div class = "container">
        <<h3 class="text-center" style="font-family:Roboto;"> <b><span> YOUR WISHLIST IS EMPTY !!</span></b></h3> 
	   </div>
	<%
	}
	else{
	%><br>
		
		
		<div class = "container" style = "text-align: left;">
        <div class = "row">
		<%
	do{
		String Pname=rs.getString(4);
		double Pprice=rs.getDouble(5);
		%>
		
		
            <div class = "col" style="padding-bottom:200px;">
                <div class="card h-100" style="width: 300px; height: 350px;">
                    <img src="<%=rs.getString(6)%>" class="card-img-top" alt="..." style="width: 300px; height: 350px;">
                    <div class="card-body bg-dark text-center text-light">
                        <h5 class="card-title"><%=rs.getString(4)%> </h5>
                        <p class="card-text">Rs <%=rs.getDouble(5)%></p>
                        <a class="btn btn-info" href="wishlisttocart.jsp?mess=<%=rs.getString(3)%>">ADD TO CART</a>
                    </div>
                </div>
            </div>
            
          
            
		<%
	}while(rs.next());
	}
	
}
catch(Exception e){ System.out.println(e);}


%>
</div>
</div>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer id = "footer">
        <div id = "products">             
            <h3> Products </h3>            
            <ul style="margin-left:8px;">    
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