//$(document).ready(function(){
//	var car = ["abc","bas"];
//	$("#bus_from").autocomplete(function(){
//		source : car;
//	});
	
	
	
	$(function() {
		var availableTags = [
			"ActionScript",
			"AppleScript",
			"Asp",
			"BASIC",
			"C",
			"C++",
			"Clojure",
			"COBOL",
			"ColdFusion",
			"Erlang",
			"Fortran",
			"Groovy",
			"Haskell",
			"Java",
			"JavaScript",
			"Lisp",
			"Perl",
			"PHP",
			"Python",
			"Ruby",
			"Scala",
			"Scheme"
		];
		$( "#bus_from" ).autocomplete({
			source: availableTags
		});
	});
//});