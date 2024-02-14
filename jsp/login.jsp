<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classic Curves-Profile</title>

    <link rel="stylesheet" href="../css/profile.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
	

	
</head>
<body>
    <%@ include file="../html/nav-bar.html" %>      
	<form action="../jsp/profile.jsp" method="post">
    <div id = "profile">
        <div id = "heading">
		
            <h1> YOUR PROFILE </h1>
       	   </div>       
		   <div id = 'content'>
<form action="../jsp/profile.jsp" method="post">

<%
if(null == session.getAttribute("ID"))
{
  %><h1 style="text-align:center;font-family:Times New Roman;">Sign In to View Profile !!      </h1>
  <%
  } 
else 
{
    out.println("<script>setTimeout(function(){location.href = '../jsp/profile.jsp'; }, 10);</script>");
}
 %>
 
 </div>
 </div>
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

 
 </form>
 </body>
 <html>