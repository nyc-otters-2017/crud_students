$(document).ready(function() {
  $('.all-books').on('click', function(e){
    e.preventDefault();
    // console.log('ckick event on link')
    var url = $(e.target).attr('href')
    debugger
    $.ajax({
      type: 'get',
      url: url
    }).success(function(response){
      // console.log(response);
      $(e.target).parent().append(response)
    }).fail(function(error){
      console.log(error)
    })
  })
});
