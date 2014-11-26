$(document).on('ready page:load', function() {
  $('#search-form').submit(function(event) {
  	event.preventDeafault();
  	var searchValue = $('#search').val();

  	$.getScript('/products?search=' + searchValue);
  		
  });

  $(window).scroll(function() {
    var url = $('.pagination span.next').children().attr('href');
    if (url && $(window).scrollTop() > ($(document).height() - $(window).height() - 50)) {

      console.log(url);
      $('.pagination').text("Fetching more products...");
      $.getScript(url);
    }
  });

  //incase the browser takes a while saving the comment we disable the button temorarily.
  $('#new_review').on('ajax:beforeSend', function() {
    $('input[type=submit]').val('Saving....').attr('disabled', 'disabled');
  });

  $('#new_review').on('ajax:complete', function() {
    $('input[type=submit]').val('Create Review').removeAttr('disabled');
  });
});

