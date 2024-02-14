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

<style>
	.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}

/*when hovering an item:*/
.autocomplete-items div:hover {
  background-color: #e9e9e9; 
}

/*when navigating through the items using the arrow keys:*/
.autocomplete-active {
  background-color:#e9e9e9; 
  color: red; 
}
</style>
</head>
<body>
    
   <header id = "header">        

        <nav id = "first-nav-bar">
            <div id = "left-elements">
                <ul>
                    <li> <a href="../html/index1.html"><i style="font-size:18px" class="fa">&#xf015;</i>
                        Home </a></li>
                    <li> <a href="../html/about_us.html"><i style="font-size:18px" class="fa">&#xf0c0;</i> About Us </a></li>
                </ul>
            </div>

            <div id = "logo">
                <a href = "../html/index1.html"> Classic CURVES </a> 
            </div>            
            
            <div class = "right-elements">
                <ul>
                    <li> <a href = "../html/checkwishlist.jsp"><i style="font-size:18px" class="fa">&#xf004;</i> Wishlist </a></li>                    
                    <li> <a href = "../html/checkshopcart.jsp"><i style="font-size:18px" class="fa">&#xf290;</i> Bag </a></li>
                    <li class="profile-dropdown">
                        <a href="javascript:void(0)"><i style="font-size:18px" class="fa">&#xf2bd;</i> Profile</a>
                        <div class="profile-dropdown-content">
                          <a href="../jsp/login.jsp">Profile</a>
						  <a href="../html/SignUpPage.html">Sign Up</a>
                          <a href="../html/SignIn_page.html">Sign In</a>                          
                        </div>
                    </li>                                        
                </ul>
            </div>
        </nav>  
                   
        <nav id = "second-nav-bar">
            <div id = "elements">
                <ul>
                    
                    <li class="dropdown">
                        <a href="" class="dropbtn" style="color:white;">Wear</a>
                        <div class="dropdown-content">
                          <a href="../html/western_wear.html">Western Wear</a>
                          <a href="../html/ethnic_wear.html">Ethnic Wear</a>
                          <a href="../html/formal_wear.html">Formal Wear</a>
                        </div>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:void(0)" style="color:white;">Footwear</a>
                        <div class="dropdown-content">
                          <a href="../html/Flats.html">Flats</a>
                          <a href="../html/heels.html">Heels</a>
                          <a href="../html/shoes.html">Shoes</a>
                        </div>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:void(0)" class="dropbtn" style="color:white;">Bags</a>
                        <div class="dropdown-content">
                          <a href="../html/Wallets.html">Wallets</a>
                          <a href="../html/Clutches.html">Clutches</a>
                          <a href="../html/Handbags.html">Handbags</a>
                        </div>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:void(0)" class="dropbtn" style="color:white;">Jewellery</a>
                        <div class="dropdown-content">
                          <a href="../html/earrings.html">Earrings</a>
                          <a href="../html/rings.html">Rings</a>
                          <a href="../html/bangles&bracelets.html">Bangles & Bracelets</a>
                          <a href="../html/necklace&pendants.html">Necklace & Pendants</a>
                        </div>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:void(0)" class="dropbtn" style="color:white;">Accessories</a>
                        <div class="dropdown-content">
                          <a href="../html/Sunglasses.html">Sunglasses</a>
                          <a href="../html/Stoles&Scarves.html">Scarfs & Stoles</a>
                          <a href="../html/Belts.html">Belts</a>
                          <a href="../html/Caps&Hats.html">Caps & Hats</a>
                        </div>
                    </li>                    
                 </ul>
            </div>
            
                                
            </div>
			<form autocomplete="off" action="search.jsp" method="POST">
			<div  style="width : 330px;margin-left: 50px;">
			<div class="autocomplete" style="width: 100%;position:relative;display: flex;">
			<input id="myInput" type="text" name="myInput" style="width: 100%;height: 28px;border: 2px solid #eee; border-right: none; padding: 5px; border-radius: 5px 0 0 5px; outline: none; color: black;font-size : 15px;font-weight : 600;font-family: 'Roboto';background-color: #eee;" placeholder="What are you looking for?"> 
			<button type="submit" class="searchButton" style="width: 40px;height: 28px;border: 1px solid #eee;background: #eee;text-align: center;color: black;border-radius: 0 5px 5px 0;cursor: pointer; border-left : none;">
			<a><i class="fa fa-search" style="font-size: 24px;"></i></a>
           </button>
		   </div>
		   </div>
		   </form>

<script>
function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}

/*An array containing all the country names in the world:*/
var countries = ["Yellow White Lehengas","Yellow Silk Lehenga","Yellow Shrug Lehenga","Yellow Scarf","Yellow Plazzo Lehenga","Yellow Long Dress","Yellow Lehenga","Yellow Grey Lehenga","Yellow Floral Lehenga","Yellow Flats","Yellow Belt","Woolen Stole","White Stylish Cap","White Stripped Shirt","White Stole","White Silk Shirt","White Polka Dress","White Pearl Jhumkas","White Mini Dress","White Leather Belt","White Half Shirt","White Full Shirt","White Formal Shirt","White Floral Dress","White Floral Dress","White Cap","White Cap","White Ballon Shirt","Traingle Beads Chain","Traditional Flat Sandals","Thin Red Belt","Thin Leather Belt","Thin Leather Belt","Stylish Sunglass","Stylish Sunglass","Stylish Stole","Stylish Scarf","Stylish Scarf","Stylish Flats","Stylish Cap","Stylish Belt","Straw Hat","Sterling Diamond Ring","Star Pendant Chain","Star Bracelet","Square Sunglass","Square Sunglass","Square Frame Sunglass","Square Buckel Belt","Square Black Ring","Square Black Earrings","Sphere Earrings","Solid Round Cap","Snowflake Pendant","Single Strap Flats","Single Strap Flats","Single Strap Flats","Single Strap Flats","Single Strap Flats","Simple Silver Ring","Silver Ring","Silver Platted Chain","Silver Plated Earrings","Silver Plated Bangles","Silver Lined Bangles","Silver Gold Ring","Silver Earrings","Silver Diamond Ring","Silver Black Studs","Silk Stole","Silk Stole","Silk Scarf","Silk Scarf","Shrug Dress","Self Knot Belt","Royal Diamond Ring","Royal Designed Ring","Royal Blue Lehengas","Royal Blue Lehenga","Round Toe Flats","Round Toe Flats","Round Toe Flat Shoes","Round Toe Flat Sandles","Round Metal Sunglass","Round Frame Sunglass","Round Frame Sunglass","Red White Lehenga","Red Stole","Red Silk Shirt","Red Silk Lehenga","Red Shirt Dress","Red Scarf","Red Polka Dress","Red Moti Bangles","Red Lehenga","Red Formal Shirt","Red Floral Lehenga","Red Flare Dress","Red Earrings","Red Designer Lehengas","Red Cap","Red Belt","Red Belt","Rectangular Ring","Purple Lense Sunglass","Printed Black Shirt","Pointed Toe Flats","Pointed Toe Flats","Pink White Lehenga","Pink Sunglass","Pink Sunglass","Pink Sunglass","Pink Stripped Shirt","Pink Stole","Pink Scarf","Pink Scarf","Pink Scarf","Pink Scarf","Pink Plated Ring","Pink Pearl Ring","Pink Party Dress","Pink Net Lehenga","Pink Leather Belt","Pink Heart Earrings","Pink Hat","Pink Hat","Pink Gold Ring","Pink Gold Bangles","Pink Gold Bangles","Pink Formal Trousers","Pink Flats","Pink Flats","Pink Flare Lehenga","Pink Flare Dress","Pink Diamond Ring","Pink Diamond Bracelet","Pink Designer Lehenga","Pink Cap","Pink Cap","Pearled Studs","Pearled Necklace","Pearled Jhumkas ","Pearled Bracelet","Pearl Pendant","Pearl Bangles","Peacock Earrings","Peacock Bracelet","Peach Round Toe Flats","Peach Pointed Toe Flats","Peach Party Dress","Peach Long Dress","Peach Jumpsuit","Peach Dress","Peach Comfy Flats","Patterned Ring","Pattern Necklace Set","Oxidized Pearl Choker","Oxidized Jhumkas","Oxidized Jhumkas","Oxidized Earrings","Oxidized Choker","Orange Leather Belt","Off-White Trousers","Off-White Silk Shirt","Navy Blue Shirt","Multiline Ring","Mirror Earrings","Miror Jhumkas","Metal Frame Sunglass","Metal Frame Sunglass","Long Grey Trousers","Light Purple Shirt","Light Pink Shirt","Light Grey Trousers","Light Grey Trousers","Light Blue Shirt","Light Blue Half Shirt","Light Blue Half Shirt","Light Blue Full Shirt","Light Blue 3/4 Shirt","Light Beige Trousers","Layered Ring","Infinity Silver Ring","Infinity Pendant","Heartcrafted Set","Heartbeat Chain","Heart Pendant Chain","Heart Layered Chain","Heart Bracelet","Handcrafted Ring","Grey Wide Trousers","Grey Trousers","Grey Sunglass","Grey Straight Trousers","Grey Stole","Grey Stole","Grey Staright Trousers","Grey Single Strap Flats","Grey Scarf","Grey Formal Trousers","Grey Formal Trousers","Grey Formal Shirt","Grey Fitted Trousers","Grey Earrings","Grey Checks Trousers","Grey Checks Trousers","Grey Cap","Grey Cap","Grey Avitor Sunglass","Green Polka Dress","Green Plated Dress","Green Pearled Bangles","Green Flare Lehenga","Green Brimmed Hat","Green Bangles Set","Goto Flats","Golden Nude Lehenga","Gold Silver Bracelet","Gold silver Bangles","Gold Plated Ring","Gold Plated Necklace","Gold Plated Bangles","Gold Necklace Set","Gold Necklace Set","Gold Layered Necklace","Gold Heart Pendant","Gold Earrings","Gold Diamond Bangles","Gold Designed Bracelet","Gold Choker Set","Gold Butterfly Chain","Gold Bangles Set","Gold Bangles Set","Gold 2-Set Bangles","Floral Stoned Bracelet","Floral Silver Ring","Floral Designed Bangle","Flat Sandals","Flat Sandals","Fabric Belt","Fabric Belt","Eyelet Detailed Belt","Double Lined Ring","Diamond Stoned Ring","Diamond Square Ring","Diamond Set","Diamond Ring","Diamond Necklace","Diamond Fall Necklace","Diamond Fall Earrings","Diamond Earrings","Diamond Chocker","Diamond Bracelet","Diamond Beaded Chain","Diamond Bangles","Designer Lehenga","Designed Scarf","Designed Ring","Designed Pendant","Designed Bracelet","Denim Cap","Denim Belt","Dark Grey Trousers","Dark Formal Trousers","Dark Blue Trousers","Dark Blue Shirt","Dark Beige Trousers","Cream Leather Belt","Cream Formal Trousers","Cream Formal Shirt","Cream Flats","Cream Cap","Cream Brimmed Hat","Circle Stoned Bracelet","Circle Pendant Chain","Circle Pattern Bracelet","Circle Oxidized Earrings","Circle Gold Earrings","Checks Stole","Checks Scarf","Cat Eye Sunglass","Cat Eye Sunglass","Casual Tan Belt","Butterfly Necklace","Brown Trousers","Brown Stoned Ring","Brown Leather Belt","Brown Frame Sunglass","Brown Formal Trousers","Brown Flats","Brown Earrings","Brown Broad Belt","Brown Belt","Broad Leather Belt","Broad Leather Belt","Brimmed Hat","Brimmed Cap","Brass Necklace","Blue White Lehengas","Blue Stoned Ring","Blue Silk Shirt","Blue Silk Half Shirt","Blue Shirt","Blue Scarf","Blue Scarf","Blue Polka Dress","Blue Party Lehenga","Blue Party Dress","Blue Maxi Dress","Blue Green Lehenga","Blue Golden Lehenga","Blue Frame Sunglass","Blue Formal Trousers","Blue Formal Shirt","Blue Earrings","Blue Brimmed Hat","Blue Beige Shirt","Black Wide Trousers","Black Trousers","Black Sunglass","Black Sunglass","Black Stylish Flats","Black Styled Earrings","Black Stripped Trousers","Black Strap Dress","Black Stoned Ring","Black Skater Dress","Black Silver Ring","Black Silver Earrings","Black Silk Shirt","Black Scarf","Black Round Toe Flats","Black Polka Dress","Black Pointed Toe Flats","Black Party Lehengas","Black Party Dress","Black Nude Lehenga","Black Net Lehenga","Black Mini Dress","Black Long Dress","Black Leather Belt","Black Kite Earrings","Black Gown Dress","Black Golden Lehenga","Black Gold Earrings","Black Frame Sunglass","Black Formal Trousers","Black Formal Shirt","Black Floral Dress","Black Flats","Black Earrings","Black Drop Earrings","Black Cap","Black Brimmed Hat","Black Belt Dress","Black Bangles Set","Blace Flare Dress","Beige Formal Trousers","Beige Dotted Shirt","Bamboo Hat","Bamboo Hat","Baby Pink Lehenga","Artificial Leather Belt","Artificial Leather Belt","Artificial Leather Belt","Arrow Pattern Bracelet","Ankle Strap Flats","3/4 Formal Trousers","3/4 Checks Trousers","2-Set Ring"];

/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), countries);
</script>

        </nav>
    </header>       

<div id = "heading">
 
<h3> <span> Search Result</span></h3>
</div>
    
        
<%

try
{
	String message=request.getParameter("myInput");
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
 <footer id = "footer" style="margin:0;max-width:100%;">
        <div id = "products">             
            <h3> Products </h3>            
            <ul>    
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
            <ul>
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

        
    