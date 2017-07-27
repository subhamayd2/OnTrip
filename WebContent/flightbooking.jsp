<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bean.Client"%>
    <%
	Client c = (Client)session.getAttribute("user");
	String u_id = null; 
	if(c != null)
	{
		u_id = c.getU_id();
		if(u_id == null)
		{
			response.sendRedirect("login.html");
		}
		else
		{
			String name = c.getUname();
		}
	}
	else
	{
		response.sendRedirect("login.html");
	}
	String t_type = request.getParameter("t_type");
	String t_number = request.getParameter("flight_no");
	String t_class = request.getParameter("class_type");
	String from = request.getParameter("flight_from");
	String to = request.getParameter("flight_to");
	String price = request.getParameter("price");
	String name = request.getParameter("name");
	String t_time = request.getParameter("depart"); 
	int d = new java.util.Date().getDate();
	int m = new java.util.Date().getMonth()+1;
	int y = new java.util.Date().getYear()+1900;
	String t_book_on = "" + d+"-"+m+"-"+y;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Flight booking confirmation</title>
<style type="text/css">
	@media print
	{
		.no-print{display:none};
	}
</style>
</head>
<body>
<nav id="pageTop" class="navbar navbar-inverse navbar-static-top no-print">
	<div class="container-fluid">
		<div class="navbar-header">
      		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".NavBar">
        	<span class="icon-bar"></span>
        	<span class="icon-bar"></span>
        	<span class="icon-bar"></span> 
      		</button>
      		
      		<a href="#" class="navbar-brand btn-link" style="margin: 7px 5px 0 5px;width: 40px;height: 40px; background:url(./img/ontrip-logo.png) no-repeat center center;background-size:cover;"></a>
      		<a href="home.jsp" class="navbar-brand" style="font-size: 24pt">OnTrip</a>
    	</div>
    	<div class="collapse navbar-collapse NavBar">
    		<ul class="nav navbar-nav navbar-right">
    			<li><a href="home.jsp#places-anchor">Places</a></li>
    			<li><a href="about.html">About us</a></li>
    			<li><a href="home.jsp#contact-anchor">Contact</a></li>
        		<li><a href="profile.jsp">${user.uname}</a></li>      		
      		</ul>
    	</div>
	</div>
</nav>
<div class="well well-md no-print">
<div class="row">
<div class="col-sm-12 col-md-8" style="margin-bottom:5px;">
	<form class="form-inline" role="form">
		<div class="form-group">
    		<label for="t_passenger">Passenger:</label>
      		<input type="number" class="form-control" id="t_passenger" name="t_passenger">
  		</div>
  		<div class="form-group">
    		<label for="t_book_for">Date:</label>
      		<input type="date" class="form-control" id="t_book_for" name="t_book_for">
  		</div>
  		<div class="form-group">
  			<label for="t_class">Class:</label>
  			<select id="t_class" class="form-control">
  				
  			</select>
  		</div>
  		<input type="hidden" value='<%=t_number%>' id="t_number">
  		<input type="hidden" value='<%=price %>' id="price">
  		<input type="hidden" value='<%=u_id %>' id="u_id">
  		<input type="hidden" value='<%=t_book_on %>' id="t_book_on">
  		<input type="hidden" value='<%=t_time %>' id="t_time">
  		<input type="hidden" value='<%=t_class %>' id="t_class_type">
  		<input type="hidden" value='<%=from %>' id="t_from">
  		<input type="hidden" value='<%=to %>' id="t_to">
  		<button id="book-submit" type="button" class="btn btn-default">Submit</button>
	</form>
</div>
	<div class="col-sm-12 col-md-4">
  			<div class="alert alert-danger fade in hidden">
  			<a href="#" class="close" aria-label="close">&times;</a>
  				<p id="err-msg"></p>
  			</div>
  		</div>
  	</div>
</div>

<div class="container print">
<div class="panel panel-default">
	<div class="panel-heading">
		<h1 class="text-center">Ontrip.com Booking Ticket</h1>
		<h3 class="text-center">Flight Ticket</h3>
	</div>
	<div class="panel-body">
	<div class="col-sm-10 col-sm-offset-1">
	<div class="row">
		<div class="col-xs-6">
			<h5>Name :</h5><h4>${user.uname}</h4>
		</div>
		<div class="col-xs-6">
			<h5>Address :</h5><h4>${user.uaddress}</h4>
		</div>
		<div class="col-xs-6">
			<h5>Email :</h5><h4><%= u_id %></h4>
		</div>
		<div class="col-xs-6">
			<h5>Status :</h5><h4 id="status">Confirmed</h4>
		</div>
		<div class="col-sm-6">
			<h5>Flight airline :</h5><h4><%=name %></h4>
		</div>
		<div class="col-sm-6">
			<h5>Flight number :</h5><h4><%=t_number %></h4>
		</div>
		<div class="col-sm-6">
			<h5>From :</h5><h4><%=from %></h4>
		</div>
		<div class="col-sm-6">
			<h5>To :</h5><h4><%=to %></h4>
		</div>
		<div class="col-sm-6">
			<h5>Booked on :</h5><h4 id="bookon"><%=t_book_on %></h4>
		</div>
		<div class="col-sm-6">
			<h5>Booked for :</h5><h4 id="bookfor">----</h4>
		</div>
		<div class="col-sm-6">
			<h5>Time :</h5><h4 id="t_time"><%=t_time %></h4>
		</div>
		<div class="col-sm-6">
			<h5>Class :</h5><h4 id="class_final">----</h4>
		</div>
		<div class="col-sm-6">
			<h5>Passenger :</h5><h4 id="passenger">----</h4>
		</div>
		<div class="col-sm-6">
			<h5>Amount :</h5><h4 id="amount">----</h4>
		</div>
		<div class="col-xs-12 col-sm-12 no-print">
			<button type="button" id="print-btn" class="btn btn-default center-block">Print the ticket</button>
		</div>
	</div>
	</div>
	</div>
	<div class="panel-footer">
		<p class="text-info text-center">Please don't misuse or tamper this printed ticket. You could be arrested and hanged until deaf. Yes, deaf.</p>
	</div>
</div>
</div>
<script src="flightbooking.js"></script>
</body>
</html>



















