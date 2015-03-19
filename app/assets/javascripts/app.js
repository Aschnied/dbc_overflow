$(document).ready(function(){
  $('.upvote_button').on('click', function(event){
    event.preventDefault();
    var id = $('.upvote_button').attr('id')
    $.ajax({
      url: '/questions/'+ id +'/upvote',
      type: 'put',
      dataType: 'json'
    })
    .done(function(data) {
      console.log("success");
      console.log(data);
      console.log(data.upvote);
      $('.up').text(data.upvote);
      $('.score').text(data.score);
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });
  })

  $('.downvote_button').on('click', function(event){
    event.preventDefault();
    var id = $('.downvote_button').attr('id');
    console.log(id);
      $.ajax({
        url: '/questions/'+ id +'/downvote',
        type: 'put',
        dataType: 'json'
      })
      .done(function(data) {
        console.log("success");
        console.log(data);
        console.log(data.downvote);
        $('.down').text(data.downvote);
        $('.score').text(data.score);
      })
      .fail(function() {
        console.log("error");
      })
      .always(function() {
        console.log("complete");
      });

})

});