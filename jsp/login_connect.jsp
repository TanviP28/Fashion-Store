<!DOCTYPE html>
<html>
<head>
	<title>Donor Patient Verification Time Slots</title>
</head>
<body>
	<h1>Donor Patient Verification Time Slots</h1>

	<!-- This section should be generated dynamically based on available time slots -->
	<div id="time-slots">
		<h2>Select a time slot:</h2>
		<ul id="time-slot-list">
			<!-- Time slots will be added dynamically here -->
		</ul>
	</div>

	<!-- Form for submitting patient information -->
	<form id="patient-info-form">
		<label for="name">Name:</label>
		<input type="text" id="name" name="name" required><br>

		<label for="email">Email:</label>
		<input type="email" id="email" name="email" required><br>

		<label for="phone">Phone:</label>
		<input type="tel" id="phone" name="phone" required><br>

		<label for="appointment-time">Appointment Time:</label>
		<input type="text" id="appointment-time" name="appointment-time" readonly><br>

		<input type="submit" value="Submit">
	</form>

	<script>
		// This script should retrieve available time slots from a server or database and dynamically generate the time slot buttons.
		const timeSlotList = document.getElementById("time-slot-list");

		// Sample data for available time slots
		const availableTimeSlots = [
			{ date: "Monday", time: "9:00am" },
			{ date: "Monday", time: "10:00am" },
			{ date: "Monday", time: "11:00am" },
			{ date: "Monday", time: "1:00pm" },
			{ date: "Monday", time: "2:00pm" },
			{ date: "Monday", time: "3:00pm" }
		];

		// Loop through available time slots and create buttons
		availableTimeSlots.forEach(slot => {
			const button = document.createElement("button");
			button.textContent = `${slot.date}, ${slot.time}`;
			button.addEventListener("click", () => {
				// Set the appointment time input field to the selected time
				document.getElementById("appointment-time").value = `${slot.date}, ${slot.time}`;
			});
			const listItem = document.createElement("li");
			listItem.appendChild(button);
			timeSlotList.appendChild(listItem);
		});
	</script>
</body>
</html><%@ page import ="java.sql.*"%>
<%@ page import ="db.*"%>

<html>
<body>
<form action="../jsp/profile.jsp" method="post">
<%
String sEmail=request.getParameter("input_email");
String sPwd	= request.getParameter("input_pwd");

try{
mySqlConnection_login mySqlConn = new  mySqlConnection_login();
Connection conn			  = mySqlConn.getDbConnection();
Statement stmt	= conn.createStatement();
ResultSet rs	= stmt.executeQuery("SELECT * FROM login_details where user_email = '"+sEmail+"' and user_pwd = '"+sPwd+"';");


if (rs.next())
{
	int iId =rs.getInt(1);
	session.setAttribute("ID",iId);
	out.println("Welcome " +rs.getString(2)+" !        ..............");
	out.println("Logging In Please wait"); 
	out.println("<script>setTimeout(function(){location.href = '../jsp/profile.jsp'; }, 2500);</script>");
	
}

else
{
	out.println("Invalid Username or Password ");
	out.println("Try Again!!");
	out.println("<script>setTimeout(function(){location.href = '../html/SignIn_page.html'; }, 2500);</script>");
}
	
conn.close(); 
}
catch(Exception e){ System.out.println(e);}

%>
</form>
</body>
</html>