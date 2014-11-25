

$(document).on('ready page:load', function() {
  $('#search-form').submit(function(event) {
  	event.preventDeafault();
  	var searchValue = $('#search').val();

  	$.getScript('/products?search=' + searchValue);
  		
  });
});