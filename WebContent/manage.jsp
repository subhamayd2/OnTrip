<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bean.*"%>
    
<%
	Client c = (Client)session.getAttribute("user");
	if(c.getU_id() == null)
	{
		response.sendRedirect("home.jsp");
	}
	String u_id = c.getU_id();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Manage your bookings</title>
<script src="./manage.js"></script>
<script src="./manage2.js"></script>
<link rel="stylesheet" href="./css/manage.css">
</head>
<body onload="div()">
<div id="pageLoad" style="position:absolute;width:100%;height:100%;margin:0;padding:0;background:white;z-index:99999999;opacity:0.9">
	<img src="./img/sendmail_load.gif" style="width:50px;height:50px; position:absolute;top:50%;left:50%;margin-top:-25px;margin-left:-25px;">
</div>
<div id="viewDetails" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <div class="row">
        	<div class="col-sm-8 text-left">
        		<span id="from">Kolkata</span>
        		<span style="font-size: 20px;color: darkgray;" class="glyphicon glyphicon-triangle-right"></span>
        		<span id="to">Digha</span>
        	</div>
        	<div class="col-sm-4 text-right">
        		<span id="type"><kbd>Bus</kbd></span>
        	</div>
        	
        </div>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-sm-6">
        		<p class="lbl">Vehicle number <span class="glyphicon glyphicon-triangle-right pull-right"></span></p> 
        	</div>
        	<div class="col-sm-6">
        		<p class="lbl2" id="number">A584</p>
        	</div>
        	<div class="col-sm-6">
        		<p class="lbl">Class <span class="glyphicon glyphicon-triangle-right pull-right"></span></p>
        	</div>
        	<div class="col-sm-6">
        		<p class="lbl2" id="class">SEATER</p>
        	</div>
        	<div class="col-sm-6">
        		<p class="lbl">Booked on <span class="glyphicon glyphicon-triangle-right pull-right"></span></p>
        	</div>
        	<div class="col-sm-6">
        		<p class="lbl2" id="book_on">2016-45-54</p>
        	</div>
        	<div class="col-sm-6">
        		<p class="lbl">Booked for <span class="glyphicon glyphicon-triangle-right pull-right"></span></p>
        	</div>
        	<div class="col-sm-6">
        		<p class="lbl2" id="book_for">2016-45-55</p>
        	</div>
        	<div class="col-sm-6">
        		<p class="lbl">Time <span class="glyphicon glyphicon-triangle-right pull-right"></span></p>
        	</div>
        	<div class="col-sm-6">
        		<p class="lbl2" id="time">15:00</p>
        	</div>
        	<div class="col-sm-6">
        		<p class="lbl">Passenger <span class="glyphicon glyphicon-triangle-right pull-right"></span></p>
        	</div>
        	<div class="col-sm-6">
        		<p class="lbl2" id="passenger">5</p>
        	</div>
        	<div class="col-sm-6">
        		<p class="lbl">Amount (Rs.) <span class="glyphicon glyphicon-triangle-right pull-right"></span></p>
        	</div>
        	<div class="col-sm-6">
        		<p class="lbl2" id="amount">2654</p>
        	</div>
        	<div class="col-sm-12 text-center">
        		<h1><span id="status" class="label label-success">Confirmed</span></h1>
        	</div>
        </div>
      </div>
      <div class="modal-footer">
      	<div class="row text-center">
      		<div class="col-sm-12">
      			<button type="button" id="cancelBooking" class="btn btn-danger">Cancel booking</button>
      		</div>
      		<div id="confirm" class="col-sm-6 col-sm-offset-3">
      			<div class="panel panel-info panel-sm">
      				<div class="panel-heading">
      					<h4>Are you sure?</h4>
      				</div>
      				<div class="panel-body">
      					<button type="button" id="yes-btn" class="btn btn-info">Yes</button>
      					<button type="button" id="no-btn" class="btn btn-info">No</button>
      				</div>
      			</div>
      		</div>
      		<div class="col-sm-12">
      			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      		</div>
      	</div>
      </div>
    </div>

  </div>
</div>

<input id="u_id" type="hidden" value='<%= u_id %>'>
<nav id="pageTop" class="navbar navbar-inverse navbar-static-top no-print" style="margin-bottom: 0;">
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
    			<li><a href="profile.jsp">View profile</a></li>
    			<li><a href="home.jsp#places-anchor">Places</a></li>
    			<li><a href="home.jsp#about-anchor">About us</a></li>
    			<li><a href="home.jsp#contact-anchor">Contact</a></li>
        		<li><a href="logout.jsp">Logout</a></li>    		
      		</ul>
    	</div>
	</div>
</nav>
<div class="jumbotron text-center">
	<div class="container-fluid">
		<h2>Easily manage all your bookings from here.</h2>
	</div>
</div>
<div class="container">
	<div id="result" class="well well-lg">
	<nav class="navbar navbar-inverse" style="border-radius: 5px 5px 0 0;">
		<div class="container-fluid">
    		<div class="navbar-header">
      			<a class="navbar-brand" style="color: white;"><span class="glyphicon glyphicon-credit-card" style="font-size: 15px; color: white;"></span>&nbsp&nbspYour bookings </a>
    		</div>
    	</div>
    </nav>
    <div id="items-list" class="row text-center">
    
<!-- 	<div class="panel panel-primary col-sm-2"> -->
<!-- 			<div class="panel-heading"><p>For : 29-09-2016</p></div> -->
<!-- 			<div class="panel-body"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-sm-12"><h4 class="text-primary">Kolkata</h4></div> -->
<!-- 					<div class="col-sm-12"><h4 class="text-primary">to</h4></div> -->
<!-- 					<div class="col-sm-12"><h4 class="text-primary">Digha</h4></div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="panel-footer"> -->
<!-- 				<button>View details</button> -->
<!-- 			</div> -->
<!-- 	</div> -->
	
	
	
	
		</div>
	</div>
</div>
</body>
</html>
















