$(document).ready(function(){
	$("#login-submit").click(function(){
		$("#login_err_msg").addClass("hidden");
		var reg = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		var u_id = document.getElementById("u_id").value;
		var upass = document.getElementById("upass").value;
		var remember = document.getElementById("remember").checked;
		if(u_id == "" || upass == "")
		{
			$("#login_err_msg").removeClass("alert-danger");
			$("#login_err_msg").addClass("alert-warning");
			$("#login_err_msg p").html("<strong>Incomplete input(s)!</strong>");
			$("#login_err_msg").removeClass("hidden");
			return;
		}
		if(!reg.test(u_id))
		{
			$("#login_err_msg").removeClass("alert-danger");
			$("#login_err_msg").addClass("alert-warning");
			$("#login_err_msg p").html("<strong>Check your e-mail!</strong>");
			$("#login_err_msg").removeClass("hidden");
			return;
		}
		$.ajax({
			type: 'POST',
			url: "loginServlet",
			data: {
				u_id: u_id,
				upass: upass,
				remember: remember
			},
			success: function(result){
				var s = result.toString();
				if(s == 1)
				{
					window.location.assign("home.jsp");
				}
				else
				{
					$("#login_err_msg").addClass("alert-danger");
					$("#login_err_msg").removeClass("alert-warning");
					$("#login_err_msg p").html("<strong>Invalid credentials!</strong>");
					$("#login_err_msg").removeClass("hidden");
				}
			}
		});
	});
});
//function u_login()
//	{
//		$("#login_err_msg").addClass("hidden");
//		var reg = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
//		var u_id = document.getElementById("u_id").value;
//		var upass = document.getElementById("upass").value;
//		if(!reg.test(u_id))
//		{
//			$("#login_err_msg").removeClass("hidden");
//			return;
//		}
//		$.ajax({
//			type: 'POST',
//			url: "loginServlet",
//			data: {
//				u_id: u_id,
//				upass: upass
//			},
//			success: function(result){
//				var s = result.toString();
//				if(s == 1)
//				{
//					window.location.assign("home.jsp");
//				}
//				else
//					alert("Invalid");
//			}
//		});
//	}