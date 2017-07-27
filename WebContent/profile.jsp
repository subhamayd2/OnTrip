<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bean.*" import="dao.*" %>
    <%
    	Client c = (Client)session.getAttribute("user");
    	if(c != null)
    	{
    		String val = c.getU_id();
    		if(val == null)
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
        		if(c != null)
        		{
        			val = c.getU_id();
            		if(val == null)
        				response.sendRedirect("home.jsp");
        		}
    		}
    			
    	}
    	else
    		response.sendRedirect("home.jsp");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./css/global.css">
<link rel="stylesheet" href="./css/profile.css">
<script src="./autogrow.js"></script>

<title><%=c.getUname() %></title>
<style type="text/css">
	#profile-edit{
		margin:0;
		opacity: 0;
		position: absolute;
		right: 5px;
		z-index:999;
		transition: all 300ms;
	}
	#profile-div:hover  #profile-edit {
		opacity: 1;
	}
</style>
</head>
<body>
<div id="pageLoad" style="position:absolute;width:100%;height:100%;margin:0;padding:0;background:white;z-index:99999999;opacity:0.9">
	<img src="./img/sendmail_load.gif" style="width:50px;height:50px; position:absolute;top:50%;left:50%;margin-top:-25px;margin-left:-25px;">
</div>
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
    			<li><a href="manage.jsp">Bookings</a></li>
    			<li><a href="home.jsp#places-anchor">Places</a></li>
    			<li><a href="home.jsp#about-anchor">About us</a></li>
    			<li><a href="home.jsp#contact-anchor">Contact</a></li>
        		<li><a href="logout.jsp">Logout</a></li>      		
      		</ul>
    	</div>
	</div>
</nav>

<div id="profile-div" class="jumbotron text-center" style="margin-top: 0;padding:25px;background: url(./img/profile-bg.jpg) 50% 50% no-repeat;background-size: cover">
	<button id="profile-edit" type="button" class="btn btn-primary"><span class="glyphicon glyphicon-edit"></span>  Edit</button>
		<div class="row" style="text-shadow: 0 0 10px black;">
		<form id="edit-form" class="form-horizontal" role="form">
			<div class="col-sm-12 text-center">
				<div id="pp" class="slideanimload" >
					<img id="pimg" src="./profile/<%=c.getU_id() %>.jpg" width="200" height="200">
					<input type="file" id="uimage" name="uimage" style="display: none;">
					<button type="button" onclick="document.getElementById('uimage').click();"><span class="glyphicon glyphicon-camera" style="font-size: 30px;"></span></button>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="row">
					<div class="col-sm-12 slideanimload">
						<input id="uname" type="text" name="uname" value="<%=c.getUname() %>" readonly="readonly" required>
					</div>
					<div class="col-sm-12 slideanimload">
						<input id="u_id" type="email" name="u_id" value="<%=c.getU_id() %>" readonly="readonly" required>
					</div>
					<div class="col-sm-12 slideanimload">
						<input type="text" id="uphone" name="uphone" value="<%=c.getUphone() %>" readonly="readonly" required>
					</div>
					<div class="col-sm-12 slideanimload">
						<input type="text" id="uaddress" name="uaddress" value="<%=c.getUaddress() %>" readonly="readonly" required>
					</div>
				</div>
			</div>
			</form>
		</div>
</div>

<div class="container">
	
</div>
<script>
$(window).load(function(){
	
	$(".slideanimload").each(function(){
	      $(this).addClass("slideload");
	  });
});
$("input").autoGrowInput({minWidth: 100,maxWidth: 800, comfortZone: 10});

var isEditable = false;
$("#profile-edit").click(function(){
	if(!isEditable)
	{
		$("input").attr("readonly",false);
		$("input[type='email']").attr("readonly",true);
		$("input").css({background: 'rgba(0,0,0,0.2)'});
		$("input[type='email']").css({background: 'transparent'});
		$("#pp button").css({display: 'block'});
		this.innerHTML = "<span class='glyphicon glyphicon-save'></span>  Save";
		isEditable = true;
	}
	else
	{
		var data = new FormData();
		data.append('u_id', $("#u_id").val());
		data.append('uname', $("#uname").val());
		data.append('uphone', $("#uphone").val());
		data.append('uaddress', $("#uaddress").val());
		if($("#uimage").val() != "")
			data.append('uimage', $("#uimage")[0].files[0]);
		
		$.ajax({
			type: 'POST',
			url: 'editProfileServlet',
			data: data,
			processData: false,
			contentType: false,
			success: function(result){
				var s = result.toString();
				if(s == 1)
				{
					$("#profile-edit").html('<span class="glyphicon glyphicon-saved"></span>  Edit again');
					$("input").attr("readonly",true);
					$("input").css({background: 'transparent'});
					$("#pp button").css({display: 'none'});
					isEditable = false;
				}
			}
		});
	}
});

function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#pimg').attr('src',e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$(document).ready(function(){
	$("#pageLoad").fadeOut("slow");
	
	$("#uimage").change(function(){
	    readURL(this);
	    });
});
</script>
</body>
</html>


















