<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8" import="bean.Client" import="dao.DataAccessObject"%>
    <%
    	Client c = (Client)session.getAttribute("user");
    	String img="user.png";
    	String log = "Login";
    	String s="";
    	int i=0;
    	String id = null;
    	System.out.println(c);
    	if(c != null)
    	{
    		id = c.getU_id();
    		System.out.println(id);
    		if(id != null)
    		{
    			img= id+".jpg";
    			log= c.getUname();
    			while(i<log.length())
    			{
    				if(log.charAt(i) == ' ')
    					break;
    				s=s+log.charAt(i);
    				i++;
    			}
    			log = s;
    		}
    		else
    		{
    			DataAccessObject dao = new DataAccessObject();
        		Cookie[] cks = request.getCookies();
        		String u_id = null;
        		if(cks != null)
        		{
        			for(int j = 0;j < cks.length; j++)
        			{
        				if(cks[j].getName().equals("u_id"))
        				{
        					u_id = cks[j].getValue();
        				}
        			}
        		}
        		c = dao.readClientCookie(u_id);
        		session.setAttribute("user", c);
    		}
    	}
    	else if(c == null)
    	{
    		DataAccessObject dao = new DataAccessObject();
    		Cookie[] cks = request.getCookies();
    		String u_id = null;
    		if(cks != null)
    		{
    			for(int j = 0;j < cks.length; j++)
    			{
    				if(cks[j].getName().equals("u_id"))
    				{
    					u_id = cks[j].getValue();
    				}
    			}
    		}
    		c = dao.readClientCookie(u_id);
    		session.setAttribute("user", c);
    		if(c != null)
        	{
    			id=c.getU_id();
        		if(id != null)
        		{
        			img= id+".jpg";
        			log= c.getUname();
        			while(i<log.length())
        			{
        				if(log.charAt(i) == ' ')
        					break;
        				s=s+log.charAt(i);
        				i++;
        			}
        			log = s;
        		}
        	}
    	}
    %>
<jsp:useBean id="user" class="bean.Client" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">


<title>OnTrip</title>
<!-- <link rel="stylesheet" href="./css/home.css"> -->
<!-- <link rel="stylesheet" href="./css/home_mobile.css"> -->
<link rel="stylesheet" href="./css/global.css">
<link rel="stylesheet" href="./css/theme.css">
<script type="text/javascript" src="./search.js"></script>
<script type="text/javascript" src="./global.js"></script>
<script type="text/javascript" src="./login.js"></script>
<script type="text/javascript" src="./anchorScroll.js"></script>
<script type="text/javascript" src="./home.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.19/themes/cupertino/jquery-ui.css">


</head>
<body onload="load()" data-spy="scroll" data-target=".navbar" data-offset="100">
<div id="pageLoad" style="position:absolute;width:100%;height:100%;margin:0;padding:0;background:white;z-index:99999999;opacity:0.9">
	<img src="./img/sendmail_load.gif" style="width:50px;height:50px; position:absolute;top:50%;left:50%;margin-top:-25px;margin-left:-25px;">
</div>
<nav id="pageTop" class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
      		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".NavBar">
        	<span class="icon-bar"></span>
        	<span class="icon-bar"></span>
        	<span class="icon-bar"></span> 
      		</button>
      		
      		<a href="#head" class="navbar-brand btn-link" style="margin: 7px 5px 0 5px;width: 40px;height: 40px; background:url(./img/ontrip-logo-y.png) no-repeat center center;background-size:cover;"></a>
      		<a href="#head" class="navbar-brand" style="font-size: 24pt">OnTrip</a>
    	</div>
    	<div class="collapse navbar-collapse NavBar">
    		<ul class="nav navbar-nav navbar-right">
    			<li><a href="#body-con"><span class="glyphicon glyphicon-credit-card"></span> Book</a></li>
    			<li><a href="#places-anchor"><span class="glyphicon glyphicon-map-marker"></span> Places</a></li>
    			<li><a href="#about-anchor"><span class="glyphicon glyphicon-apple"></span> About us</a></li>
    			<li><a href="#contact-anchor"><span class="glyphicon glyphicon-earphone"></span> Contact</a></li>
        		<li>
        			<button id="login-btn" type="button"  class="btn btn-xs btn-link" onclick="login()">
						<img src="./profile/<%= img %>"  width="48" height="48" class="img-circle">
						<span id="log" class=""><%=log%></span>
					</button>
        		</li>
        		<li>
        			
        			<a id="userDrop" class="dropdown-toggle glyphicon glyphicon-chevron-down" data-toggle="dropdown"></a>
        			<ul class="dropdown-menu" role="menu">
        				<li><a href="profile.jsp"><span class="glyphicon glyphicon-user"></span> &nbspView profile</a></li>
    					<li><a href="manage.jsp"><span class="glyphicon glyphicon-check"></span> &nbspManage Bookings</a></li>
    					<li><a href="logout.jsp"><span class="	glyphicon glyphicon-log-out"></span> &nbspLogout</a></li>
        			</ul>

        		</li>
        		
      		</ul>
    	</div>
	</div>
</nav>
<div class="jumbotron text-center" id="head">
	<img src="./img/ontrip-logo-y.png" width="200" height="200" class="slideanim">
	<h1 class="slideanim">Welcome!</h1>
</div>
<!-- Body Container -->
<div id="body-con" class="container-fluid col-md-10 col-md-offset-1">
<div class="modal fade Login col-sm-offset-3" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content col-sm-6">
			<div class="modal-header">
				<h4 class="modal-title center"><span style="font-size:15pt" class="glyphicon glyphicon-lock text-center"></span> <span style="font-size:15pt" class="text-center">User account</span></h4>
			</div>
			<div class="modal-body">
				<div id="login_err_msg" class="alert alert-danger fade in hidden">
					<a href="#" class="close" aria-label="close">&times;</a>
					<p><strong>Invalid inputs!</strong></p>
				</div>
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<div class="col-sm-12">
								<input class="form-control" type="email" id="u_id" name="u_id" placeholder="Enter your email" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<input class="form-control" type="password" id="upass" name="upass" placeholder="Your password?" required>
							</div>
						</div>
						<div class="form-group"> 
    						<div class="col-sm-12">
      							<button type="button" onclick="" id="login-submit" class="col-xs-12 btn btn-default"><span class="	glyphicon glyphicon-log-in"></span>  Login</button>
    						</div>
  						</div>
  						<div class="form-group"> 
    						<div class="col-sm-12 text-center">
      							<div class="checkbox">
    								<label><input type="checkbox" id="remember"> Remember me</label>
  								</div>
    						</div>
  						</div>
					</form>
			</div>
			<div class="modal-footer">
				<a href="#" class="col-sm-12 col-xs-12">Forgot password?</a>
				<a href="register.html" class="col-sm-12 col-xs-12">New here? Register yourself</a>
			</div>
		</div>
	</div>
</div>
	<div id="booking">
		<div id=booking-panel>
			<ul id="tab" class="nav nav-tabs nav-default">
				<li id="bus-li" style="cursor:pointer" class="active"><a id="bus" onclick='showContent("bus",1)'>Bus</a></li>
				<li id="train-li" style="cursor:pointer"><a id="train" onclick='showContent("train",1)'>Train</a></li>
				<li id="flight-li" style="cursor:pointer"><a id="flight" onclick='showContent("flight",1)'>Flight</a></li>
			</ul>
		</div>
		<div class="row">
			<div class="col-sm-3" id="tab-content">
				<div id="bus-content" style="z-index:999;display:block;">
				<h1 class="text-info">Book a bus</h1>
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<div class="col-sm-12">
							<label class="control-label col-sm-12" for="bus_from"></label>
								<input title="Departure city" class="form-control ui-autocomplete-input" autocomplete="off" type="text" id="bus_from" name="bus_from" placeholder="Start your trip from?" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
							<label class="control-label col-sm-12" for="bus_to"></label>
								<input data-toggle="tooltip" data-placement="bottom" title="Destination city" class="form-control" type="text" id="bus_to" name="bus_to" placeholder="Destination" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-12" for="bus_depart"></label>
							<div class="col-sm-12">
								<input data-toggle="tooltip" data-placement="bottom" title="Departure time" type="time" class="form-control" id="bus_depart" name="bus_depart" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-12" for="bus_arrive"></label>
							<div class="col-sm-12">
								<input data-toggle="tooltip" data-placement="bottom" title="Arrival time" type="time" class="form-control" id="bus_arrive" name="bus_arrive" required>
							</div>
						</div>
						<div class="form-group"> 
    						<div class="col-sm-12">
      							<button type="button" id="bus-submit" class="col-xs-12 btn btn-default"><span class="glyphicon glyphicon-search"></span>  Search</button>
    						</div>
  						</div>
						
					</form>
				</div>
				<div id="train-content" style="display:none;">
				<h1 class="text-info">Book a train</h1>
				<form class="form-horizontal" role="form">
						<div class="form-group">
							<div class="col-sm-12">
								<label class="control-label col-sm-12" for="train_from"></label>
								<input type="text" data-toggle="tooltip" data-placement="bottom" title="Departure city" class="form-control" id="train_from" name="train_from" placeholder="Start your trip from?" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<label class="control-label col-sm-12" for="train_to"></label>
								<input type="text" data-toggle="tooltip" data-placement="bottom" title="Destination city" class="form-control" id="train_to" name="train_to" placeholder="Destination" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-12" for="train_depart"></label>
							<div class="col-sm-12">
								<input type="time" data-toggle="tooltip" data-placement="bottom" title="Departure time" class="form-control" id="train_depart" name="train_depart" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-12" for="train_arrive"></label>
							<div class="col-sm-12">
								<input type="time" data-toggle="tooltip" data-placement="bottom" title="Arrival time" class="form-control" id="train_arrive" name="train_arrive" required>
							</div>
						</div>
						<div class="form-group"> 
    						<div class="col-sm-12">
      							<button type="button" id="train-submit" class="col-xs-12 btn btn-default"><span class="glyphicon glyphicon-search"></span>  Search</button>
    						</div>
  						</div>
						
					</form>
				</div>
				<div id="flight-content" style="display:none;">
				<h1 class="text-info">Book a flight</h1>
				<form class="form-horizontal" role="form">
						<div class="form-group">
							<div class="col-sm-12">
							<label class="control-label col-sm-12" for="flight_from"></label>
								<input type="text" data-toggle="tooltip" data-placement="bottom" title="Departure city" class="form-control" id="flight_from" name="flight_from" placeholder="Start your trip from?" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
							<label class="control-label col-sm-12" for="flight_to"></label>
								<input type="text" data-toggle="tooltip" data-placement="bottom" title="Destination city" class="form-control" id="flight_to" name="flight_to" placeholder="Destination" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
							<label class="control-label col-sm-12" for="flight_depart"></label>
								<input type="time" data-toggle="tooltip" data-placement="bottom" title="Departure time" class="form-control" id="flight_depart" name="flight_depart" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
							<label class="control-label col-sm-12" for="flight_arrive"></label>
								<input type="time" data-toggle="tooltip" data-placement="bottom" title="Arrival time" class="form-control" id="flight_arrive" name="flight_arrive" required>
							</div>
						</div>
						<div class="form-group"> 
    						<div class="col-sm-12">
      							<button type="button" id="flight-submit" class="col-xs-12 btn btn-default"><span class="glyphicon glyphicon-search"></span>  Search</button>
    						</div>
  						</div>
						
					</form>
				
				</div>
			</div>
			<div class="col-sm-9" id="search">
			<p id="search-placeholder"><span class="glyphicon glyphicon-flag"></span> Let us know about your plan</p>
			<p id="err-msg"></p>
				<ul id="search-header">
					<li><input value="Name/No." readonly="readonly"></li><li><input value='Available' readonly='readonly'></li><li><input value='Departure' readonly='readonly'></li><li><input value='Arrival' readonly='readonly'></li><li><input value='Price' readonly='readonly'></li><li><input value='Class/Type' readonly='readonly'></li>
				</ul>
			</div>
			</div>
	</div>
	<div id="places-anchor" class="page-header"><h1>Few interesting places</h1></div>
	<div class="jumbotron slideanim" style="background: transparent;">
		<div class="row">
			<div class="col-sm-6 col-xs-12 col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading"><h4 class="text-info">Goa</h4></div>
					<div class="panel-body">
						<div id="goaCarousel" class="carousel slide" data-ride="carousel" data-interval="4000" data-pause="false">
							<ol class="carousel-indicators">
    							<li data-target="#goaCarousel" data-slide-to="0" class="active"></li>
    							<li data-target="#goaCarousel" data-slide-to="1"></li>
    							<li data-target="#goaCarousel" data-slide-to="2"></li>
  							</ol>
  							<div class="carousel-inner" role="listbox">
  								<div class="item active">
      								<img src="./img/places/goa/goa1.jpg" alt="goa">
    							</div>
    							<div class="item">
      								<img src="./img/places/goa/goa2.jpg" alt="goa">
    							</div>
    							<div class="item">
      								<img src="./img/places/goa/goa3.jpg" alt="goa">
    							</div>
  							</div>
						</div>
					</div>
					<div class="panel-footer"><a href="http://www.goatourism.gov.in/" target="_blank">Goa Tourism</a></div>
				</div>
			</div>
			<div class="col-sm-6 col-xs-12 col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading"><h4 class="text-info">Kashmir</h4></div>
					<div class="panel-body">
						<div id="kashmirCarousel" class="carousel slide" data-ride="carousel" data-interval="4000" data-pause="false">
							<ol class="carousel-indicators">
    							<li data-target="#kashmirCarousel" data-slide-to="0" class="active"></li>
    							<li data-target="#kashmirCarousel" data-slide-to="1"></li>
    							<li data-target="#kashmirCarousel" data-slide-to="2"></li>
  							</ol>
  							<div class="carousel-inner" role="listbox">
  								<div class="item active">
      								<img src="./img/places/kashmir/kashmir1.jpg" alt="Kashmir">
    							</div>
    							<div class="item">
      								<img src="./img/places/kashmir/kashmir2.jpg" alt="Kashmir">
    							</div>
    							<div class="item">
      								<img src="./img/places/kashmir/kashmir3.jpg" alt="Kashmir">
    							</div>
  							</div>
						</div>
					</div>
					<div class="panel-footer"><a href="http://jktourism.org/" target="_blank">Kashmir Tourism</a></div>
				</div>
			</div>
			<div class="col-sm-6 col-xs-12 col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading"><h4 class="text-info">Kerala</h4></div>
					<div class="panel-body">
						<div id="keralaCarousel" class="carousel slide" data-ride="carousel" data-interval="4000" data-pause="false">
							<ol class="carousel-indicators">
    							<li data-target="#keralaCarousel" data-slide-to="0" class="active"></li>
    							<li data-target="#keralaCarousel" data-slide-to="1"></li>
    							<li data-target="#keralaCarousel" data-slide-to="2"></li>
  							</ol>
  							<div class="carousel-inner" role="listbox">
  								<div class="item active">
      								<img src="./img/places/kerala/kerala1.jpg" alt="Kerala">
    							</div>
    							<div class="item">
      								<img src="./img/places/kerala/kerala2.jpg" alt="Kerala">
    							</div>
    							<div class="item">
      								<img src="./img/places/kerala/kerala3.jpg" alt="Kerala">
    							</div>
  							</div>
						</div>
					</div>
					<div class="panel-footer"><a href="https://www.keralatourism.org/" target="_blank">Kerala Tourism</a></div>
				</div>
			</div>
			<div class="col-sm-6 col-xs-12 col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading"><h4 class="text-info">Kolkata</h4></div>
					<div class="panel-body">
						<div id="kolkataCarousel" class="carousel slide" data-ride="carousel" data-interval="4000" data-pause="false">
							<ol class="carousel-indicators">
    							<li data-target="#kolkataCarousel" data-slide-to="0" class="active"></li>
    							<li data-target="#kolkataCarousel" data-slide-to="1"></li>
    							<li data-target="#kolkataCarousel" data-slide-to="2"></li>
  							</ol>
  							<div class="carousel-inner" role="listbox">
  								<div class="item active">
      								<img src="./img/places/kolkata/kolkata1.jpg" alt="Kolkata">
    							</div>
    							<div class="item">
      								<img src="./img/places/kolkata/kolkata2.jpg" alt="Kolkata">
    							</div>
    							<div class="item">
      								<img src="./img/places/kolkata/kolkata3.jpg" alt="Kolkata">
    							</div>
  							</div>
						</div>
					</div>
					<div class="panel-footer"><a href="http://www.kolkata.org.uk/tourist-attractions/" target="_blank">Kolkata Tourism</a></div>
				</div>
			</div>
			<div class="col-sm-6 col-xs-12 col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading"><h4 class="text-info">Mumbai</h4></div>
					<div class="panel-body">
						<div id="mumbaiCarousel" class="carousel slide" data-ride="carousel" data-interval="4000" data-pause="false">
							<ol class="carousel-indicators">
    							<li data-target="#mumbaiCarousel" data-slide-to="0" class="active"></li>
    							<li data-target="#mumbaiCarousel" data-slide-to="1"></li>
    							<li data-target="#mumbaiCarousel" data-slide-to="2"></li>
  							</ol>
  							<div class="carousel-inner" role="listbox">
  								<div class="item active">
      								<img src="./img/places/mumbai/mumbai1.jpg" alt="Mumbai">
    							</div>
    							<div class="item">
      								<img src="./img/places/mumbai/mumbai2.jpg" alt="Mumbai">
    							</div>
    							<div class="item">
      								<img src="./img/places/mumbai/mumbai3.jpg" alt="Mumbai">
    							</div>
  							</div>
						</div>
					</div>
					<div class="panel-footer"><a href="http://www.maharashtratourism.gov.in/destination/mumbai" target="_blank">Mumbai Tourism</a></div>
				</div>
			</div>
			<div class="col-sm-6 col-xs-12 col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading"><h4 class="text-info">Rajasthan</h4></div>
					<div class="panel-body">
						<div id="rajasthanCarousel" class="carousel slide" data-ride="carousel" data-interval="4000" data-pause="false">
							<ol class="carousel-indicators">
    							<li data-target="#rajasthanCarousel" data-slide-to="0" class="active"></li>
    							<li data-target="#rajasthanCarousel" data-slide-to="1"></li>
    							<li data-target="#rajasthanCarousel" data-slide-to="2"></li>
  							</ol>
  							<div class="carousel-inner" role="listbox">
  								<div class="item active">
      								<img src="./img/places/rajasthan/rajasthan1.jpg" alt="Rajasthan">
    							</div>
    							<div class="item">
      								<img src="./img/places/rajasthan/rajasthan2.jpg" alt="Rajasthan">
    							</div>
    							<div class="item">
      								<img src="./img/places/rajasthan/rajasthan3.jpg" alt="Rajasthan">
    							</div>
  							</div>
						</div>
					</div>
					<div class="panel-footer"><a href="http://www.rajasthaninfo.org/" target="_blank">Rajasthan Tourism</a></div>
				</div>
			</div>
		</div>
	</div>
<div id="about-anchor" class="page-header"><h1>Get to know us</h1></div>
<div class="jumbotron slideanim" style="background: transparent;">
	<div class="row text-center" id="about-con">
		<div class="col-sm-12">
			<h3>What we offer :</h3>
		</div>
		<div class="col-sm-4">
      <span class="glyphicon glyphicon-off"></span>
      <h4>POWER</h4>
      <p>Browse through variety of options.</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-heart"></span>
      <h4>CARE</h4>
      <p>We provide 24x7 customer support to all.</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-lock"></span>
      <h4>JOB DONE</h4>
      <p>We ensure that everybody's wish is fulfilled.</p>
    </div>
    <br><br>
  <div class="row">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-flash"></span>
      <h4>FAST</h4>
      <p>We are lightning fast since you are busy.</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-certificate"></span>
      <h4>CERTIFIED</h4>
      <p>You can absolutely trust us with your plans.</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-wrench"></span>
      <h4>HARD WORK</h4>
      <p>We ensure to provide the best user-experience.</p>
    </div>
	</div>
</div>
<div class="page-header"></div>
<div class="well well-md">
	<blockquote>
		<p style="font-size:12pt"><kbd>India's number 1</kbd> online ticketing platform, was founded in 2015 . We take pride in providing bus,train and flight tickets with zero booking charges.  Created to empower the Indian travellers with instant booking and comprehensive choices. It aimed to offer a range of best-value products and services along with cutting-edge technology and dedicated round-the-clock customer support.<br>
     OnTrip provides you a wonderful opportunity to customize your holidays. So you can now plan your holiday right down to the minutest of detail.<br>
     The people behind OnTrip are a set of highly skilled and trained individuals with an exceptional knowledge base in their respective fields. Just relax the next time you are booking with OnTrip.com, you're in good hands. So don't let this opportunity to be part of India's biggest travel bazaar pass you by, take the leap and open up a world of options for yourself.
     </p>
		<footer>OnTrip.com</footer>
	</blockquote>
</div>
<div class="page-header"></div>
<div class="jumbotron" style="overflow: auto;background: transparent;">
<ul class="nav nav-tabs">
		<li id="faq-li" class="active" style="cursor: pointer;"><a onclick="showContent('faq',2)">FAQs</a></li>
		<li id="privacy-li" style="cursor: pointer;"><a onclick="showContent('privacy',2)">Privacy Policy</a></li>
		<li id="user-li" style="cursor: pointer;"><a onclick="showContent('user',2)">User Agreement</a></li>
	</ul>
	<div style="position:relative;margin: 0; padding: 0; height: 350px">
		<div id="faq-content" style="position:absolute;margin: 0; padding: 5px; z-index: 999;display:block;">
			<div class="row">
				<div class="col-sm-12">
					<h4 style="border-bottom: 2px solid dimgray;">Question 1</h4>
					<p>Answer to question 1 is this</p>
				</div>
				<div class="col-sm-12">
					<h4 style="border-bottom: 2px solid dimgray;">Question 2</h4>
					<p>Answer to question 2 is this</p>
				</div>
			</div>
		</div>
		<div id="privacy-content" style="position:absolute;margin: 0; padding: 5px; z-index: 99;display:none;">
			<h4 style="border-bottom: 2px solid dimgray;">Our privacy policy</h4>
			<p>Website, mobile site and mobile app contain links to other websites. Please note that when you click on one of these links, you are entering another website for which OnTrip has no responsibility. We encourage you to read the privacy statements of all such sites as their policies may be materially different from this Privacy Policy. Of course, you are solely responsible for maintaining the secrecy of your passwords, and your membership account information. Please be very careful, responsible, and alert with this information, especially whenever you're online.<br><br>
In addition to the circumstances described above, OnTrip may disclose the member information if required to do so by law, court order, as requested by other government or law enforcement authority, or in the good faith belief that disclosure is otherwise necessary or advisable including, without limitation, to protect the rights or properties of OnTrip or any or all of its affiliates, associates, employees, directors or officers or when we have reason to believe that disclosing the information is necessary to identify, contact or bring legal action against someone who may be causing interference with our rights or properties, whether intentionally or otherwise, or when anyone else could be harmed by such activities. In addition, if OnTrip or substantially all of its assets are acquired, our customer information will most likely also be transferred in connection with such acquisition.<br><br>
We review our Privacy Policy from time to time, and we may make periodic changes to the policy in connection with that review. Therefore, you may wish to bookmark this page and/or periodically review this page to make sure you have the latest version.<br><br>
You may always submit concerns regarding this Privacy Policy via email to ontrip.corps@gmail.com. OnTrip will respond to all reasonable concerns or inquiries.
</p>
		</div>
		<div id="user-content" style="position:absolute;margin: 0; padding: 5px; z-index: 99;display:none;">
			<h4 style="border-bottom: 2px solid dimgray;">Our user agreement</h4>
			<p>MMT may send booking confirmation, itinerary information, cancellation, payment confirmation, refund status, schedule change or any such other information relevant for the transaction, via SMS or by voice call on the contact number given by the User at the time of booking; MMT may also contact the User by voice call, SMS or email in case the User couldn’t or hasn’t concluded the booking, for any reason what so ever, to know the preference of the User for concluding the booking and also to help the User for the same.<br><br>The User hereby unconditionally consents that such communications via SMS and/ or voice call by MMT is (a) upon the request and authorization of the User, (b) ‘transactional’ and not an ‘unsolicited commercial communication’ as per the guidelines of Telecom Regulation Authority of India (TRAI) and (c) in compliance with the relevant guidelines of TRAI or such other authority in India and abroad. The User will indemnify MMT against all types of losses and damages incurred by MMT due to any action taken by TRAI, Access Providers (as per TRAI regulations) or any other authority due to any erroneous compliant raised by the User on MMT with respect to the intimations mentioned above or due to a wrong number or email id being provided by the User for any reason whatsoever.
			</p>
		</div>
	</div>
</div>
<div id="contact-anchor" class="page-header"></div>	
</div>
</div>
<footer class="row-footer">
        <div class="container">
            <div class="row">
                <div class="col-xs-2 col-xs-offset-1 col-sm-3 slideanim">
                	<h4 style="color:darkgray;">Links :</h4>
                    <ul class="list-unstyled">
                        <li><a href="#">Home</a></li>
                        <li><div class="page-header" style="padding:0;margin:5px 0;"></div></li>
                        <li><a href="#about-anchor">Know more about us</a></li>
                        <li><div class="page-header" style="padding:0;margin:5px 0;"></div></li>
                        <li><a href="https://www.irctc.co.in">IRCTC Homepage</a></li>
                    </ul>
                </div>
                <div class="col-xs-6 col-xs-offset-1 col-sm-3 slideanim">
                    <h4 style="color:darkgray;">Find us at :</h4>
                    <address>
		              221B, Baker Street<br>
		              Clear Water Bay, Waston<br>
		              London<br>
		              <span class="glyphicon glyphicon-phone"></span>: +91 1234 5678<br>
		              <span class="glyphicon glyphicon-print"></span>: +91 8765 4321<br>
		              <span class="glyphicon glyphicon-envelope"></span>: <a href="mailto:ontrip.corps@gmail.com">ontrip.corps@gmail.com</a>
		           </address>
                </div>
                <div class="col-xs-10 col-xs-offset-1 col-sm-3 slideanim">
                <h4 style="color:darkgray;">Have a question?</h4>
                	<form class="form-horizontal" role="form">
                		<div class="form-group" id="v_id_field">
                			<input type="email" class="form-control" name="v_id" id="v_id" placeholder="Your E-mail ID?" required>
                			<span id="v_id_feed" class="glyphicon form-control-feedback"></span>
                		</div>
                		<div class="form-group" id="v_query_field">
                			<textarea class="form-control col-sm-12 col-xs-12" name="v_query" id="v_query" placeholder="Your query?" required></textarea>
                			<span id="v_query_feed" class="glyphicon form-control-feedback"></span>
                		</div>
                		<div class="form-group">
                			<button style="background: transparent;border: 1px solid darkgray;" class="btn col-sm-12 col-xs-12" type="button" id="query-submit">Submit</button>
                		</div>
                	</form>
                </div>
                <div class="col-xs-10 col-xs-offset-1 col-sm-3">
                    <div id="socialLink" class="nav navbar-nav nav-primary" style="padding: 40px 10px;">
						<a href="#"><img src="./img/social/fb.png" width="40" height="40"></a>
						<a href="#"><img src="./img/social/twitter.png" width="40" height="40"></a>
						<a href="#"><img src="./img/social/google-plus.png" width="40" height="40"></a>
                    </div>
                </div>
                <div class="col-xs-12 text-center">
                	<a href="#head" class="btn" data-toggle="tooltip" data-placement="bottom" title="Go to top"><span style="font-size:25px;font-weight: bold;" class="glyphicon glyphicon-menu-up"></span></a>
                </div>
                
                <div class="col-xs-12">
                    <p style="padding:10px;"></p>
                    <p align="center" style="color:darkgray;">© Copyright <%= new java.util.Date().getYear()+1900 %> OnTrip.com</p>
                </div>
            </div>
        </div>
    </footer>

<script>
function load()
{
	if(document.getElementById("log").innerHTML == "Login")
	{
		document.getElementById("userDrop").style.display='none';
		
	}
	else
	{
		document.getElementById("userDrop").style.display='block';
	}
}
function showContent(ch,k)
{
	var arr1 = ["bus","train","flight"];
	var arr2 = ["faq","privacy","user"];
	var arr = null;
	if(k == 1)
		arr = arr1;
	else if(k == 2)
		arr = arr2;
	var i = 0;
	while(i < arr.length)
	{
		document.getElementById(arr[i]+"-content").style.zIndex = "99";
		document.getElementById(arr[i]+"-content").style.display = "none";
		document.getElementById(arr[i]+"-li").className = "";
		i++;
	}
	var content = document.getElementById(ch+"-content");
	content.style.zIndex = "999";
	content.style.display = "block";
	document.getElementById(ch+"-li").className = "active";
}
	function login()
	{
		if(document.getElementById("log").innerHTML != "Login")
		{
			window.location.assign("profile.jsp");
		}
		else
		{
			$(".Login").modal();
		}
	}
</script>
</body>
</html>