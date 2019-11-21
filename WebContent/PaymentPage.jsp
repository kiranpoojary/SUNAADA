<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Make Payment</title>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

<style type="text/css">
body {
	background-image:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAaCAYAAACpSkzOAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEgAACxIB0t1+/AAAABZ0RVh0Q3JlYXRpb24gVGltZQAxMC8yOS8xMiKqq3kAAAAcdEVYdFNvZnR3YXJlAEFkb2JlIEZpcmV3b3JrcyBDUzVxteM2AAABHklEQVRIib2Vyw6EIAxFW5idr///Qx9sfG3pLEyJ3tAwi5EmBqRo7vHawiEEERHS6x7MTMxMVv6+z3tPMUYSkfTM/R0fEaG2bbMv+Gc4nZzn+dN4HAcREa3r+hi3bcuu68jLskhVIlW073tWaYlQ9+F9IpqmSfq+fwskhdO/AwmUTJXrOuaRQNeRkOd5lq7rXmS5InmERKoER/QMvUAPlZDHcZRhGN4CSeGY+aHMqgcks5RrHv/eeh455x5KrMq2yHQdibDO6ncG/KZWL7M8xDyS1/MIO0NJqdULLS81X6/X6aR0nqBSJcPeZnlZrzN477NKURn2Nus8sjzmEII0TfMiyxUuxphVWjpJkbx0btUnshRihVv70Bv8ItXq6Asoi/ZiCbU6YgAAAABJRU5ErkJggg==);
}

.error-template {
	padding: 40px 15px;
	text-align: center;
}

.error-actions {
	margin-top: 15px;
	margin-bottom: 15px;
}

.error-actions .btn {
	margin-right: 10px;
}
</style>
</head>
<body>
	<form action="PaymentServlet" method="post">
		<div style="text-align: left;">

			<a href="Home.jsp" class="btn btn-primary btn-lg"><span
				class="glyphicon glyphicon-home"></span> Take Me Home </a>
		</div>
		<%
			if (((String) session.getAttribute("currentSessionUser")).equals("Login")) {
		%>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="error-template">
						<h1>Oops!</h1>
						<h2>Login Required,Please Login To Rent</h2>
						<div class="error-actions">
							<a href="Home.jsp" class="btn btn-primary btn-lg"><span
								class="glyphicon glyphicon-home"></span> Take Me Home </a><a
								href="Login.jsp" class="btn btn-primary btn-lg"><span
								class="glyphicon glyphicon-log-in"></span> Login Now </a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%
			} else {

				String dbUrl = "jdbc:mysql://localhost/sunada";
				String driverName = "com.mysql.jdbc.Driver";
				Class.forName(driverName);
				Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");

				String selectedInstrument = (String) session.getAttribute("selectedInstrument");
				int qty = Integer.parseInt(session.getAttribute("reqQ").toString());

				//***Stock 
				PreparedStatement getStockStatement = (PreparedStatement) connection
						.prepareStatement("SELECT AvailQuantity FROM instruments where Instrument_Name=?");
				getStockStatement.setString(1, selectedInstrument);

				ResultSet qtyRS = getStockStatement.executeQuery();

				qtyRS.next();
				int oldqty = qtyRS.getInt(1);
				int newqty = oldqty - qty;
				if (newqty < 0) {
		%>
		<script type="text/javascript">
			alert('Avail Quantity is less than Requested');
			location = 'Home.jsp';
		</script>;


		<%
			} else {

					PreparedStatement ps = (PreparedStatement) connection
							.prepareStatement("SELECT WalletBalance FROM users where UserID=?");
					ps.setString(1, (String) session.getAttribute("currentSessionUser"));
					ResultSet rs = ps.executeQuery();
					rs.next();
					float bal = rs.getFloat(1);

					session.setAttribute("balance", bal);
					SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
					String strFrom = (String) session.getAttribute("from");
					Date from = formatter2.parse(strFrom);

					System.out.print((String) session.getAttribute("currentSessionUser"));

					String strTo = (String) session.getAttribute("to");
					Date to = formatter2.parse(strTo);

					session.setAttribute("sFrom", from);
					session.setAttribute("sTo", to);
					long diff = to.getTime() - from.getTime();
					int totaldays = (int) (TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS));
					double Disc = (double) session.getAttribute("discount");

					int reqQuantity = (int) session.getAttribute("reqQ");
					session.setAttribute("qty", reqQuantity);

					double totalDisc = Disc * totaldays * reqQuantity;

					double fare = (double) session.getAttribute("fare");
					double totalpay = fare * reqQuantity * totaldays;

					session.setAttribute("totpay", totalpay);

					if (bal < totalpay) {
		%>
		<br> <br> <br>

		<div class="container">
			<h4 style="color: red">No Sufficient Wallet Balance.</h4>

			<br>
			<ul class="nav nav-pills nav-stacked" style="width: 555px">
				<li class="active"><a href="#"><span
						class="badge pull-right"><span class="fas fa-rupee-sign"></span><%=bal%></span>
						Wallet Balance</a></li>
			</ul>
			<ul class="nav nav-pills nav-stacked" style="width: 555px">
				<li class="active"><a href="#"><span
						class="badge pull-right"><span class="fas fa-rupee-sign"></span><%=totalpay - bal%></span>
						Shortage of Amount</a></li>
			</ul>
			<hr>

			<div class="row">
				<aside class="col-sm-6"> <article class="card">
				<div class="card-body p-5">
					<p>
						<i class="fa fa-credit-card"></i> Credit/Debit Card</a>
					</li>

					</p>




					<div class="form-group">
						<label for="username">Full name (on the card)</label>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fa fa-user"></i></span>
							</div>
							<input type="text" class="form-control" name="username"
								placeholder="" required="">
						</div>
						<!-- input-group.// -->
					</div>
					<!-- form-group.// -->

					<div class="form-group">
						<label for="cardNumber">Card number</label>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i
									class="fa fa-credit-card"></i></span>
							</div>
							<input type="text" class="form-control"
								pattern="[1234567890][0-9]{12}" name="cardNumber"
								placeholder="Card Number" required>
						</div>
						<!-- input-group.// -->
					</div>
					<!-- form-group.// -->

					<div class="row">
						<div class="col-sm-8">
							<div class="form-group">
								<label><span class="hidden-xs">Expiration</span> </label>
								<div class="form-inline">
									<select class="form-control" style="width: 45%">
										<option>MM</option>
										<option>01 - January</option>
										<option>02 - February</option>
										<option>03 - March</option>
										<option>01 - April</option>
										<option>02 - May</option>
										<option>03 - June</option>
										<option>01 - July</option>
										<option>02 - August</option>
										<option>03 - September</option>
										<option>01 - October</option>
										<option>02 - November</option>
										<option>03 - December</option>
									</select> <span style="width: 10%; text-align: center"> / </span> <select
										class="form-control" style="width: 45%">
										<option>YY</option>
										<option>2019</option>
										<option>2020</option>
										<option>2021</option>
										<option>2022</option>
										<option>2023</option>
										<option>2024</option>
										<option>2025</option>
										<option>2026</option>
									</select>
								</div>
							</div>
						</div>

						<div class="col-sm-4">
							<div class="form-group">
								<label data-toggle="tooltip" title=""
									data-original-title="3 digits code on back side of the card">CVV
									<i class="fa fa-question-circle"></i>
								</label> <input class="form-control" required="" type="password">
							</div>
							<!-- form-group.// -->
						</div>
					</div>

					<div class="form-group">
						<label for="cardNumber"></label>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i
									class="fas fa-rupee-sign"></i> </span>
							</div>
							<input type="text" class="form-control" name="Amount"
								placeholder="Add Amount" value=<%=totalpay - bal%>>
						</div>
						<!-- input-group.// -->
					</div>
					<!-- row.// -->

					<button type="submit" name="clicked" value="addmoney"
						class="subscribe btn btn-primary btn-block">Add Money</button>
				</div>
				</article> </aside>
			</div>
		</div>
		<%
			} else {
		%>





		<br>
		<button class="subscribe btn btn-primary btn-block" type="button">
			<span class="badge pull-right"></span> Payment And Delivery Details
		</button>
		<br>
		<div class="container">
			<ul class="nav nav-pills nav-stacked" style="width: 555px">
				<li class="active"><a href="#"><span
						class="badge pull-right"><span style="margin-left: 20px"
							class="fas fa-rupee-sign"></span><%=bal%></span> Your Current Wallet
						balance</a></li>
			</ul>
		</div>
		<br>
		<div class="container">
			<h4">Bill Details</h4>

			<br>
			<ul class="nav nav-pills nav-stacked" style="width: 555px">
				<li class="active"><a href="#"><span
						class="badge pull-right"><span class="fas fa-rupee-sign"></span><%=totalpay%></span>
						Gross Pay Amount</a></li>
			</ul>
			<ul class="nav nav-pills nav-stacked" style="width: 555px">
				<li class="active"><a href="#"><span
						class="badge pull-right"><span class="fas fa-rupee-sign"></span style="margin-left: 20px"><%=totalDisc%></span>
						Total Discount Amount</a></li>
			</ul>
			<ul class="nav nav-pills nav-stacked"
				style="width: 555px; margin-top: 5px">
				<li class="active"><a href="#"><span
						class="badge pull-right"><span class="fas fa-rupee-sign"></span style="margin-left: 20px"><%=totalpay - totalDisc%></span>
						Net Pay Amount</a></li>
				<%
					session.setAttribute("finalpay", totalpay - totalDisc);
				%>
			</ul>
		</div>




		<div class="container">
			<div class="row">
				<form class="form-horizontal">
					<fieldset>
						<!-- Address form -->

						<h2>Delivery Details</h2>

						<!-- full-name input-->
						<div class="control-group">
							<label class="control-label">Full Name</label>
							<div class="controls">
								<input id="full-name" name="fname" id="fname" type="text"
									placeholder="full name" class="form-control"
									style="width: 250px">
								<p class="help-block"></p>
							</div>
						</div>
						<!-- address-line1 input-->
						<div class="control-group">
							<label class="control-label">Address</label>
							<div class="controls">
								<input id="address-line1" name="region2" type="text"
									placeholder="address line 1" class="form-control"
									style="width: 250px">
								<p class="help-block">Street address, P.O. box, company
									name, c/o</p>
							</div>
						</div>
						<!-- address-line2 input-->
						<div class="control-group">
							<label class="control-label">Mobile Number</label>
							<div class="controls">
								<input id="address-line2" name="mobile" type="text"
									placeholder="Mobile Number" class="form-control"
									style="width: 250px">

							</div>
						</div>
						<!-- city input-->
						<div class="control-group">
							<label class="control-label">City / Town</label>
							<div class="controls">
								<input id="city" name="city" type="text" placeholder="city"
									class="form-control" style="width: 250px">
								<p class="help-block"></p>
							</div>
						</div>
						<!-- region input-->
						<div class="control-group">
							<label class="control-label">State / Province / Region</label>
							<div class="controls">
								<input id="region" name="region" type="text"
									placeholder="state / province / region" class="form-control"
									style="width: 250px">
								<p class="help-block"></p>
							</div>
						</div>
						<!-- postal-code input-->
						<div class="control-group">
							<label class="control-label">Zip / Postal Code</label>
							<div class="controls">
								<input id="postal-code" name="post" type="text"
									placeholder="zip or postal code" class="form-control"
									style="width: 250px">
								<p class="help-block"></p>
							</div>
						</div>

						<br> <br> <a href="InsertRent.jsp" name="clicked"
							value="finalSubmit" class="subscribe btn btn-primary btn-block">Make
							Payment</a>
<!-- 
						<button type="submit" name="clicked" value="finalSubmit"
							class="subscribe btn btn-primary btn-block">Make Payment</button>
 -->
					</fieldset>
				</form>
				<br> <br> <br> <br>

			</div>
		</div>
		<%
			}
				}
			}
		%>
	</form>
</body>
</html>