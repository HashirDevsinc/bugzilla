$( document ).ready(function() {
	console.log('out');
	$('#issue_issue_type').on('change', function() {
		console.log('in');
		var a = $(this).val();
		if (a == "Bug"){
			$('.bug-selecter').removeClass('hidden');
			$('.feature-selecter').addClass('hidden');
		}
		else if (a == "Feature"){
			$('.feature-selecter').removeClass('hidden');
			$('.bug-selecter').addClass('hidden');
		}	 
	});

	
	// get current URL path and assign 'active' class
	var pathname = window.location.pathname;
	$('.nav > li > a[href="'+pathname+'"]').parent().addClass('active');
});

