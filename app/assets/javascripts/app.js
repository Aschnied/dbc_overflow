$(document).ready(function(){
  $('.upvote_button').on('click', function(event){
    event.preventDefault();
    var id = $(this).attr('id');
    console.log(id);
    $.ajax({
      url: '/questions/'+ id +'/upvote',
      type: 'put',
      dataType: 'json'
    })
    .done(function(data) {
      console.log("success");
      var upvote_column = $('.' + id).find('.up');
      upvote_column.text(data.upvote);
      var score_column = $('.' + id).find('.score');
      score_column.text(data.score);
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
    var id = $(this).attr('id');
    console.log(id);
      $.ajax({
        url: '/questions/'+ id +'/downvote',
        type: 'put',
        dataType: 'json'
      })
      .done(function(data) {
        console.log("success");
        console.log(data);
        var downvote_column = $('.' + id).find('.down');
        downvote_column.text(data.downvote);
        var score_column = $('.' + id).find('.score');
        score_column.text(data.score);
      })
      .fail(function() {
        console.log("error");
      })
      .always(function() {
        console.log("complete");
      });

})

});