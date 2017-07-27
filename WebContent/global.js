$(document).ready(function(){
	var mode=0;
	
	$(".close").click(function(){
		$(".alert").addClass("hidden");
	});
	
	$(window).load(function(){
		$("#pageLoad").fadeOut();
		$("#head img, #head h1").addClass("slide");
		var width = $(window).width();
		var height = $(window).height();
		if(width > height)
		{
			if(width < 960 && height < 500)
			{
				$("#pageTop").css({position: 'absolute',top: '0'});
				mode=1;
			}
		}
		else
		{
			$("#pageTop").stop().css({position: 'fixed', width: '100%',top: '0'});
			mode = 0;
		}
		
		$(".slideanimload").each(function(){
		      $(this).addClass("slideload");
		  });
	});
	$(window).resize(function(){
		var width = $(window).width();
		var height = $(window).height();
		if(width > height)
		{
			if(width < 960 && height < 500)
			{
				$("#pageTop").css({position: 'absolute',top: '0'});
				mode=1;
			}
			else
			{
				$("#pageTop").stop().css({position: 'fixed', width: '100%',top: '0'});
				mode = 0;
			}
		}
		else
		{
			$("#pageTop").stop().css({position: 'fixed', width: '100%',top: '0'});
			mode = 0;
		}
		
	});
	
	
	$('[data-toggle="tooltip"]').tooltip();
	
	
	$(window).scroll(function (){
		if(mode == 0)
		{
			$("#pageTop").stop().css({position: 'fixed', width: '100%',top: '0'});
		}
		if($(window).scrollTop() > 400)
		{
			$("a[href='#head'").stop().css({opacity: '1'});
			$(".navbar").stop().css({background: '#2a2a2a'});
			//$(".navbar-toggle").stop().css({background: '#0d0d0d'});
		}
		else if($(window).scrollTop() <= 400)
		{
			$("a[href='#head'").stop().css({opacity: '0'});
			$(".navbar").stop().css({background: 'transparent'});
			//$(".navbar-toggle").stop().css({background: 'transparent'});
		}
		
		$(".slideanim").each(function(){
		    var pos = $(this).offset().top;

		    var winTop = $(window).scrollTop();
		    if (pos < winTop + 600) {
		      $(this).addClass("slide");
		    }
		  });
		
    });
	$("#view_menu").click(function(){
		if(document.getElementById("menu").style.display == 'none')
			document.getElementById("menu").style.display = 'block';
		else
			document.getElementById("menu").style.display = 'none';
	});
	
	$("#query-submit").click(function(){
		var v_id = $("#v_id").val();
		var v_query = $("#v_query").val();
		var reg = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		if(v_id == "")
		{
			$("#v_id_field").removeClass("has-warning");
			$("#v_id_feed").removeClass("glyphicon-warning-sign");
			$("#v_id_field").removeClass("has-success");
			$("#v_id_feed").removeClass("glyphicon-ok");
			$("#v_id_feed").addClass("glyphicon-remove");
			$("#v_id_field").addClass("has-feedback");
			$("#v_id_field").addClass("has-error");
			return;
		}
		if(!reg.test(v_id))
		{
			$("#v_id_field").removeClass("has-error");
			$("#v_id_feed").removeClass("glyphicon-remove");
			$("#v_id_field").removeClass("has-success");
			$("#v_id_feed").removeClass("glyphicon-ok");
			$("#v_id_feed").addClass("glyphicon-warning-sign");
			$("#v_id_field").addClass("has-feedback");
			$("#v_id_field").addClass("has-warning");
			return;
		}
		if(v_query == "")
		{
			$("#v_query_field").removeClass("has-success");
			$("#v_query_feed").removeClass("glyphicon-ok");
			$("#v_query_feed").addClass("glyphicon-remove");
			$("#v_query_field").addClass("has-feedback");
			$("#v_query_field").addClass("has-error");
			return;
		}
		$.ajax({
			type: 'POST',
			url: 'feedbackServlet',
			data: {
				u_id: v_id,
				u_query: v_query
			},
			success: function(result){
				var s = result.toString();
				if(s == 1)
				{
					$("#v_id_field").removeClass("has-warning");
					$("#v_id_field").removeClass("has-error");
					$("#v_id_feed").removeClass("glyphicon-warning-sign");
					$("#v_id_feed").removeClass("glyphicon-remove");
					$("#v_id_field").addClass("has-success");
					$("#v_id_field").addClass("has-feedback");
					$("#v_id_feed").addClass("glyphicon-ok");
					
					$("#v_query_field").removeClass("has-warning");
					$("#v_query_field").removeClass("has-error");
					$("#v_query_feed").removeClass("glyphicon-warning-sign");
					$("#v_query_feed").removeClass("glyphicon-remove");
					$("#v_query_field").addClass("has-success");
					$("#v_query_field").addClass("has-feedback");
					$("#v_query_feed").addClass("glyphicon-ok");
				}
				else
					alert("We experienced some error.");
			}
		});
		
	});
	$("#v_id").keypress(function(){
		$("#v_id_field").removeClass("has-warning");
		$("#v_id_field").removeClass("has-error");
		$("#v_id_field").removeClass("has-feedback");
		$("#v_id_feed").removeClass("glyphicon-warning-sign");
		$("#v_id_feed").removeClass("glyphicon-remove");
		
	});
	$("#v_query").keypress(function(){
		$("#v_query_field").removeClass("has-warning");
		$("#v_query_field").removeClass("has-error");
		$("#v_query_field").removeClass("has-feedback");
		$("#v_query_feed").removeClass("glyphicon-warning-sign");
		$("#v_query_feed").removeClass("glyphicon-remove");
	});
});




