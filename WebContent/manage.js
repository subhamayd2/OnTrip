$(document).ready(function(){
	
	$(window).load(function(){
		$("#pageLoad").fadeOut("slow");
	});
	
	
	$("#confirm").hide();
	var u_id = $("#u_id").val();
	//alert(u_id);
	$.ajax({
		type: 'POST',
		url: 'manageServlet',
		data: {
			u_id: u_id
		},
		dataType: "json",
		success: function(result){
			if(result.Messages.length)
			{
				$.each(result.Messages, function(i,result)
				{
					if(result.t_status == "CANCELLED")
						createItem(i, result.t_book_for, result.t_from, result.t_to, result.t_type, result.t_time, "danger");
					else
						createItem(i, result.t_book_for, result.t_from, result.t_to, result.t_type, result.t_time, "primary");
				});
			}
		}
	});
	
	
	$("#cancelBooking").click(function(){
		$("#confirm").show("slow");
	});
	$("#no-btn").click(function(){
		$("#confirm").hide("slow");
	});
	
	$("#yes-btn").click(function(){
		var u_id = $("#u_id").val();
		var t_type = $("#type").text();
		var t_time = $("#time").text();
		var t_book_for = $("#book_for").text();
		$.ajax({
			type: 'POST',
			url: 'cancelBookingServlet',
			data: {
				u_id: u_id,
				t_type: t_type,
				t_time: t_time,
				t_book_for: t_book_for
			},
			success: function(result){
				var s = result.toString();
				if(s == 1)
				{
					$("#status").removeClass("label-success");
					$("#status").addClass("label-danger");
					$("#status").html("Cancelled");
					$("#confirm").hide("slow");
					window.location.reload();
				}
				else
					alert("error");
			}
		});
		
	});
	
		$("#result").on("click", "button", function(){
			var cls = this.className;
			cls = cls.charAt(cls.length - 1);
			var a = {};
			var i = 0;
			$("input[class*='"+cls+"']").each(function(){
				a[i++] = $(this).val();
			});
			var u_id = $("#u_id").val();
			var t_type = a[0];
			var t_time = a[1];
			var t_book_for = a[2];
			$.ajax({
				type: 'POST',
				url: 'manageDetailsServlet',
				data: {
					u_id: u_id,
					t_type: t_type,
					t_time: t_time,
					t_book_for: t_book_for
				},
				dataType: "json",
				success: function(result){
					if(result.Messages.length)
					{
						$.each(result.Messages, function(i,result)
						{
							$("#from").html(result.t_from);
							$("#to").html(result.t_to);
							$("#type").html("<kbd>"+result.t_type+"</kbd>");
							$("#number").html(result.t_number);
							$("#class").html(result.t_class);
							$("#book_on").html(result.t_book_on);
							$("#book_for").html(result.t_book_for);
							$("#time").html(result.t_time);
							$("#passenger").html(result.t_passenger);
							$("#amount").html(result.t_amount);
							$("#status").html(result.t_status);
							$("#confirm").hide();
							if($("#status").text() == "CANCELLED")
							{
								$("#status").removeClass("label-success");
								$("#status").addClass("label-danger");
								document.getElementById("cancelBooking").disabled = true;
							}
							else
							{
								$("#status").removeClass("label-danger");
								$("#status").addClass("label-success");
								document.getElementById("cancelBooking").disabled = false;
							}
							$("#viewDetails").modal();
						});
					}
				}
			});
		});
		
		
	});



function createItem(i, t_book_for, t_from, t_to, t_type, t_time, color)
{
	
	var list = document.getElementById("items-list");
	
	var panel = document.createElement("div");
	panel.className = "panel panel-"+ color +" col-sm-2 "+i;
	
	var phead = document.createElement("div");
	phead.className="panel-heading";
	phead.innerHTML = "<p>"+ t_type +" for : "+ t_book_for +"</p>";
	panel.appendChild(phead);
	
	var pbody = document.createElement("div");
	pbody.className = "panel-body";
	var bodyrow = document.createElement("div");
	bodyrow.className = "row";
	var row1 = document.createElement("div");
	row1.className = "col-sm-12";
	var row2 = document.createElement("div");
	row2.className = "col-sm-12";
	var row3 = document.createElement("div");
	row3.className = "col-sm-12";
	
	row1.innerHTML = "<h4 class='text-"+ color +"'>"+ t_from +"</h4>";
	row2.innerHTML = "<h4 class='text-"+ color +"'>to</h4>";
	row3.innerHTML = "<h4 class='text-"+ color +"'>"+ t_to +"</h4>";
	
	bodyrow.appendChild(row1);
	bodyrow.appendChild(row2);
	bodyrow.appendChild(row3);
	
	pbody.appendChild(bodyrow);
	panel.appendChild(pbody);
	
	var pfooter = document.createElement("div");
	pfooter.className = "panel-footer";
	
	var b = document.createElement("button");
	b.className = "view-details panelButton-"+color+" "+i;
	b.innerHTML = "View details";
	pfooter.appendChild(b);
	
	var t1 = document.createElement("input");
	t1.className = i;
	t1.setAttribute('type', 'hidden');
	t1.value = t_type;
	var t2 = document.createElement("input");
	t2.className = i;
	t2.setAttribute('type', 'hidden');
	t2.value = t_time;
	var t3 = document.createElement("input");
	t3.className = i;
	t3.setAttribute('type', 'hidden');
	t3.value = t_book_for;
	
	panel.appendChild(t1);
	panel.appendChild(t2);
	panel.appendChild(t3);
	
	panel.appendChild(pfooter);
	
	list.appendChild(panel);
}









