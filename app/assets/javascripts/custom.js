$( document ).ready(function() {
	console.log('out');

	var t = $('#issue_issue_type').val();
	if (t == "Feature"){
		console.log('bla bla bla');
		$("#issue_status option[value=Resolved]").text("Completed");
		$("#issue_status option[value=Resolved]").val("Completed");
	}
	$('#issue_issue_type').on('change', function() {
		console.log('in');
		var a = $(this).val();
		if (a == "Bug"){
			// $('.bug-selecter').removeClass('hidden');
			// $('.feature-selecter').addClass('hidden');
			$("#issue_status option[value=Completed]").text("Resolved");
			$("#issue_status option[value=Completed]").val("Resolved");

		}
		else if (a == "Feature"){
			// $('.feature-selecter').removeClass('hidden');
			// $('.bug-selecter').addClass('hidden');
			$("#issue_status option[value=Resolved]").text("Completed");
			$("#issue_status option[value=Resolved]").val("Completed");
		}	 
	});

	
	// get current URL path and assign 'active' class
	var pathname = window.location.pathname;
	$('.nav > li > a[href="'+pathname+'"]').parent().addClass('active');
});

