

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
});



// (document).on('page:load ready', function() {
//   $('#search-form').submit(function(event) {
//     event.preventDefault();
//     var searchValue = $('#search').val();

//     $.getScript('/products?search=' + searchValue);
//   });

//   $(window).scroll(function() {
//     var url = $('.pagination span.next').children().attr('href');
//     if (url && $(window).scrollTop() > ($(document).height() - $(window).height() - 50)) {

//       console.log(url);
//       $('#product-pagination').text("Fetching more products...");
//       $.getScript(url);
//     }
//   });