$(document).ready(function(){
	$("#print-btn").addClass("disabled");
	$(".close").click(function(){
		$(".alert").addClass("hidden");
	});
	$("#print-btn").click(function(){
		if($("#class_final").html() != "----" || $("#bookfor").html() != "----" || $("#passenger").html() != "----" || $("#amount").html() != "----")
		{
			window.print();
		}
	});
	
	$(window).load(function(){
		var t_class = $("#t_class_type").val().split(",");
		var sel = document.getElementById("t_class");
		for(var i = 0; i < t_class.length; i++)
		{
			var opt = document.createElement('option');
		    opt.innerHTML = t_class[i];
		    opt.value = t_class[i];
		    sel.appendChild(opt);
		}
	});
	
	$("#book-submit").click(function(){
		$(".alert").addClass("hidden");

		var t_passenger = $("#t_passenger").val();
		var t_time = $("#t_time").val();
		var t_book_for = $("#t_book_for").val();
		var t_from = $("#t_from").val();
		var t_to = $("#t_to").val();
		if(t_passenger == "" || t_book_for == "")
		{
			$("#err-msg").html("<strong>Warning!</strong> Incomplete field(s).");
			$(".alert").removeClass("alert-danger");
			$(".alert").removeClass("alert-success");
			$(".alert").addClass("alert-warning");
			$(".alert").removeClass("hidden");
			return;
		}
				
		var t_number = $("#t_number").val();
		var price = $("#price").val().split(",");
		var p="";
		var pas = parseInt(t_passenger, 10);
		var t_class = $("#t_class").val();
		for(var i=0;i < price.length;i++)
		{
			if(t_class.charAt(0) == price[i].charAt(0))
			{
				p = price[i];
				break;
			}
		}
		p = p.substring(1);
		
		var pri = parseInt(p, 10);
		var a = pas * pri;
		var t_amount = ""+a;
		var u_id = $("#u_id").val();
		var t_book_on = $("#t_book_on").val();
		alert(a);
		$.ajax({
			type: 'POST',
			url: 'flightBookServlet',
			data: {
				u_id: u_id,
				t_number: t_number,
				t_book_on: t_book_on,
				t_passenger: t_passenger,
				t_class: t_class,
				t_amount: t_amount,
				t_time: t_time,
				t_book_for: t_book_for,
				t_from: t_from,
				t_to: t_to
			},
			success: function(result){
				var s = result.toString();
				if(s == 0)
				{
					$("#err-msg").html("<strong>Error!</strong> Couldn't process your request.");
					$(".alert").removeClass("alert-warning");
					$(".alert").removeClass("alert-success");
					$(".alert").addClass("alert-danger");
					$(".alert").removeClass("hidden");
					return;
				}
				$("#bookfor").html(t_book_for);
				$("#passenger").html(t_passenger);
				$("#time").html(t_time);
				$("#amount").html(t_amount);
				$("#class_final").html(t_class);
				$("#print-btn").removeClass("disabled");
				$("#err-msg").html("<strong>Success!</strong> Happy journey.");
				$(".alert").removeClass("alert-warning");
				$(".alert").removeClass("alert-danger");
				$(".alert").addClass("alert-success");
				$(".alert").removeClass("hidden");
			}
		});
	});
});