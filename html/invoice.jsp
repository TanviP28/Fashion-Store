<!DOCTYPE html>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.lang.Math"%>
<%@ page import ="db.*"%>

<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Invoice</title>
	<link rel="stylesheet" href="../css/invoice.css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
        
<%
String userid = session.getAttribute("ID").toString();
try
{
	mySqlConnection_login mySqlConn = new  mySqlConnection_login();
	Connection conn			  = mySqlConn.getDbConnection();
	Statement stm = conn.createStatement();
	ResultSet rs = stm.executeQuery("SELECT order_id,order_address,order_pin,order_state,order_mop,order_date,order_productprice FROM order_details WHERE order_id='60' AND order_userid='2';");
	while (rs.next())
			{
	
%>	
<body>
	<div class="container-fluid">
		<div id="bill-display">
			<!-- ----- HEADER ---- -->
			<table class="table table-bordered">
				<p class="text-center">RETAIL INVOICE <small class="pull-right">(original)</small></p>
				<tr>
					<td colspan="3" rowspan="3">
						<div class="box-title">
							CLASSIC CURVES LIMITED
						</div>
						<div class="box-content">
							Mumbai,<br>
							Maharashtra 400 064<br>
							Phone number : 1800-000-000<br>
							Email : customercare@classiccurves.com
						</div>
					</td>
					<td colspan="2">
						<div class="box-title">Invoice No</div>
						<div class="box-content">4<%=rs.getInt(1)%></div>
					</td>
					<td colspan="2">
						<div class="box-title">Dated</div>
						<div class="box-content"><%=rs.getString(6)%></div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="box-title">Delivery Note</div>
						<div class="box-content">967</div>
					</td>
					<td colspan="2">
						<div class="box-title">Mode of Payment</div>
						<div class="box-content"><%=rs.getString(5)%></div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="box-title">Dispatch Document</div>
						<div class="box-content"></div>
					</td>
					<td colspan="2">
						<div class="box-title">Dated</div>
						<div class="box-content"><%=rs.getString(6)%></div>
					</td>
				</tr>
				<tr>
					<td colspan="3" rowspan="3">
						<div class="box-title">Buyer</div>
						<div class="box-content">
							<b>Stella</b><br>
							<b>stella28.1999@gmail.com</b><br>
							<%=rs.getString(2)%>,<%=rs.getString(3)%>,<%=rs.getString(4)%><br>
							M: 9898979796
						</div>
					</td>
					<td colspan="4">
						<div class="box-title">Terms of Delivery</div>
						<div class="box-content"></div>
					</td>
				</tr>
				<tr></tr>
				<tr></tr>
				<!-- ----- BODY ---- -->
				<tr class="heading-row v-row">
					<td>Sr<br>No.</td>
					<td>Product Name</td>
					<td>Product Id</td>
					<td>Quantity</td>					
					<td>Amount</td>
				</tr>
				<%
				
				
				%>
				<tr class="v-row">
					<td class="text-center">1</td>
					<td class="text-center">Floral Dress</td>
					<td class="text-center">001</td>
					<td class="text-center">1</td>					
					<td class="text-center">2000.00</td>
				</tr>
				<tr class="v-row">
					<td class="text-center">2</td>
					<td class="text-center">Mirror Earrings</td>
					<td class="text-center">002</td>
					<td class="text-center">1</td>					
					<td class="text-center">1200.00</td>
				</tr>
				<tr class="v-row">
					<td class="text-center">3</td>
					<td class="text-center">Crimson Balloon Top</td>
					<td class="text-center">301</td>
					<td class="text-center">1</td>					
					<td class="text-center">1500.00</td>
				</tr>
				<tr class="total-row v-row">
					<td colspan="3" class="text-right">Total</td>
					<td class="text-center">3</td>					
					<td class="text-center"><%=rs.getString(7)%></td>
				</tr>
				<!-- ----- FOOTER ---- -->
				<tr>
					<td colspan="3">
						<div class="box-content">Amount Chargeable(in words)</div>
						<div class="box-title" id="amountword"></div>
					</td>
					<td colspan="4"></td>
				</tr>
				<tr>
					<td colspan="3">
						Declaration:<br>
						We declare that this invoice shows the actual price of the goods described and that all
						particulars are true and correct.
					</td>
				</tr>
				<tr>
					<td colspan="7" class="text-center">
						SUBJECT TO SC CREATIVES LIMITED<br>
						This is a Computer Generated Invoice.
					</td>
				</tr>
			</table>
		</div>
		<button class="btn btn-default .print-btn" onclick="jsvascript:window.print()">Print Invoice</button>
	</div>
<script type="text/javascript" src="nts.js"></script>

<script>  

    document.getElementById("amountword").innerHTML = numberToEnglish(<%=rs.getString(7)%>)+" Only ";
</script>

<%
			}
			
			conn.close(); 
			}
			catch(Exception e){ System.out.println(e);}
		%> 

</body>

</html>