$(function() {
	$('.icon-stop').click( function(event) {
	var moduleId = $(event.target).parent().parent().attr('id');
	var path = $(event.target).parent().parent().attr('path');
    alert(path);
	$.ajax({
		async : false,
		type : "GET",
		url : path,
		dataType : "text",
		success : function(data) {
			alert(data);
		}
		
	});
	});
	
});

function createStopModuleDialog() {
	
}
