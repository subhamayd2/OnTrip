$(document).ready(function(){

	var header="<ul id='search-header'><li><input value='Name/No.' readonly='readonly'></li><li><input value='Available' readonly='readonly'></li><li><input value='Departure' readonly='readonly'></li><li><input value='Arrival' readonly='readonly'><li><input value='Price' readonly='readonly'><li><input value='Class/Type' readonly='readonly'></li></li></li></ul>";
	$("#bus-submit").click(function(){
		$("#search-placeholder").css({'display':'none'});
		
		if($("#bus_from").val() == "")
		{
			$("#err-msg").html("<span class='glyphicon glyphicon-exclamation-sign'></span> Please tell us from where you want to start").animate({opacity: '1'}).delay(4000);
			return;
		}
		if($("#bus_to").val() == "")
		{
			$("#err-msg").html("<span class='glyphicon glyphicon-exclamation-sign'></span> Please tell us where you want to go").animate({opacity: '1'}).delay(4000);
			return;
		}
		$("#search").css({'overflow':'auto'});
		$("#search").html("<p id='result-loading'><span class='glyphicon glyphicon-refresh'></span> Loading your results</p>");
		var from = $("#bus_from").val();
		from = from.toUpperCase().trim();
		var to = $("#bus_to").val();
		to = to.toUpperCase().trim();
		var depart = "%";
		var arrive = "%";		
		if( $("#bus_depart").val() != "" )
		{
			depart = $("#bus_depart").val().toString();
		}
		if($("#bus_arrive").val() != "")
		{
			arrive = $("#bus_arrive").val().toString();
		}
		$.ajax({
			type: 'POST',
			url: "busSearchServlet",
			data: {
				bus_from: from,
				bus_to: to,
				bus_depart: depart,
				bus_arrive: arrive
			},
			dataType: "json",
			success: function(result){
				if(result.Messages.length)
				{
					$("#search").html("");
					$(header).appendTo("#search");
					$("#search-header").css({'display':'block'});
					$.each(result.Messages, function(i,result)
					{
						var data = "<div class='result'><form method='post' action='busbooking.jsp'><input name='bus_from' type='hidden' value='"+ result.bus_from +"'><input name='bus_to' type='hidden' value='"+ result.bus_to +"'><input name='license' type='hidden' value='"+ result.bus_license +"'><input name='t_type' type='hidden' value='bus'><input class='name' name='bus_no' readonly='readonly' value='"+result.bus_no+"'><input class='seat_avail' name='seat_avail' readonly='readonly' value='"+result.seat_avail+"'><input class='depart' name='depart' readonly='readonly' value='"+result.bus_depart+"'><input class='arrive' name='arrive' readonly='readonly' value='"+result.bus_arrive+" ("+result.bus_days+" day(s))'><input class='price' name='price' readonly='readonly' value='Rs. "+result.bus_price+"'><input class='class_type' name='class_type' readonly='readonly' value='"+result.bus_type+"'><button type='submit'>Book</button></form></div>";
						$(data).appendTo("#search");
					});
				}
				else
				{
					$("#search").html("<p id='no-result'><span class='glyphicon glyphicon-remove-sign'></span> No result</p>");
				}
			}
		});
	});
	
	$("#train-submit").click(function(){
		$("#search-placeholder").css({'display':'none'});
		
		if($("#train_from").val() == "")
		{
			$("#err-msg").html("<span class='glyphicon glyphicon-exclamation-sign'></span> Please tell us from where you want to start").animate({opacity: '1'}).delay(4000);
			return;
		}
		if($("#train_to").val() == "")
		{
			$("#err-msg").html("<span class='glyphicon glyphicon-exclamation-sign'></span> Please tell us where you want to go").animate({opacity: '1'}).delay(4000);
			return;
		}
		$("#search").css({'overflow':'auto'});
		$("#search").html("<p id='result-loading'><span class='glyphicon glyphicon-refresh'></span> Loading your results</p>");
		var from = $("#train_from").val();
		from = from.toUpperCase().trim();
		var to = $("#train_to").val();
		to = to.toUpperCase().trim();
		var depart = "%";
		var arrive = "%";
		if( $("#train_depart").val() != "" )
		{
			depart = $("#train_depart").val().toString();
		}
		if($("#train_arrive").val() != "")
		{
			arrive = $("#train_arrive").val().toString();
		}
		$.ajax({
			type: 'POST',
			url: "trainSearchServlet",
			data: {
				train_from: from,
				train_to: to,
				train_depart: depart,
				train_arrive: arrive
			},
			dataType: "json",
			success: function(result){
				if(result.Messages.length)
				{
					$("#search").html("");
					$(header).appendTo("#search");
					$("#search-header").css({'display':'block'});
					$.each(result.Messages, function(i,result)
					{
						var data = "<div class='result'><form method='post' action='trainbooking.jsp'><input name='train_no' type='hidden' value='"+ result.train_no +"'><input name='train_from' type='hidden' value='"+ result.train_from +"'><input name='train_to' type='hidden' value='"+ result.train_to +"'><input name='t_type' type='hidden' value='train'><input class='name' name='name' readonly='readonly' value='"+result.train_name+"'><input class='seat_avail' name='seat_avail' readonly='readonly' value='"+result.train_avail+"'><input class='depart' name='depart' readonly='readonly' value='"+result.train_depart+"'><input class='arrive' name='arrive' readonly='readonly' value='"+result.train_arrive+" ("+result.train_days+" day(s))'><input class='price' name='price' readonly='readonly' value='"+result.train_fare+"'><input class='class_type' name='class_type' readonly='readonly' value='"+result.train_class+"'><button type='submit'>Book</button></form></div>";
						$(data).appendTo("#search");
					});
				}
				else
				{
					$("#search").html("<p id='no-result'><span class='glyphicon glyphicon-remove-sign'></span> No result</p>");
				}
			}
		});
		
	});
	$("#flight-submit").click(function(){
		$("#search-placeholder").css({'display':'none'});
		
		if($("#flight_from").val() == "")
		{
			$("#err-msg").html("<span class='glyphicon glyphicon-exclamation-sign'></span> Please tell us from where you want to start").animate({opacity: '1'}).delay(4000);
			return;
		}
		if($("#flight_to").val() == "")
		{
			$("#err-msg").html("<span class='glyphicon glyphicon-exclamation-sign'></span> Please tell us where you want to go").animate({opacity: '1'}).delay(4000);
			return;
		}
		$("#search").css({'overflow':'auto'});
		$("#search").html("<p id='result-loading'><span class='glyphicon glyphicon-refresh'></span> Loading your results</p>");
		var from = $("#flight_from").val();
		from = from.toUpperCase().trim();
		var to = $("#flight_to").val();
		to = to.toUpperCase().trim();
		var depart = "%";
		var arrive = "%";		
		if( $("#flight_depart").val() != "" )
		{
			depart = $("#flight_depart").val().toString();
		}
		if($("#flight_arrive").val() != "")
		{
			arrive = $("#flight_arrive").val().toString();
		}
		$.ajax({
			type: 'POST',
			url: "flightSearchServlet",
			data: {
				flight_from: from,
				flight_to: to,
				flight_depart: depart,
				flight_arrive: arrive
			},
			dataType: "json",
			success: function(result){
				if(result.Messages.length)
				{
					$("#search").html("");
					$(header).appendTo("#search");
					$("#search-header").css({'display':'block'});
					$.each(result.Messages, function(i,result)
					{
						var data = "<div class='result'><form method='post' action='flightbooking.jsp'><input name='flight_no' type='hidden' value='"+ result.flight_no +"'><input name='flight_from' type='hidden' value='"+ result.flight_from +"'><input name='flight_to' type='hidden' value='"+ result.flight_to +"'><input name='t_type' type='hidden' value='flight'><input class='name' name='name' readonly='readonly' value='"+result.flight_airline+"'><input class='seat_avail' name='seat_avail' readonly='readonly' value='"+result.flight_avail+"'><input class='depart' name='depart' readonly='readonly' value='"+result.flight_depart+"'><input class='arrive' name='arrive' readonly='readonly' value='"+result.flight_arrive+" ("+result.flight_days+" day(s))'><input class='price' name='price' readonly='readonly' value='"+result.flight_price+"'><input class='class_type' name='class_type' readonly='readonly' value='"+result.flight_type+"'><button type='submit'>Book</button></form></div>";
						$(data).appendTo("#search");
					});
				}
				else
				{
					$("#search").html("<p id='no-result'><span class='glyphicon glyphicon-remove-sign'></span> No result</p>");
				}
			}
		});
	});
	//end of document
});



























