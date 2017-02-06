$(document).ready(function() {
// begin Leila Ajax
  $(".nav-bar").on("click", "#register-link", function(e){
      e.preventDefault();
      url = $(e.target).attr("href");
      $.ajax({
        method: 'get',
        url: url
      }).success(function(response){
        $("#user-auth").html(response);
      })
    });
  $(".nav-bar").on("click", "#login-link", function(e){
      e.preventDefault();
      url = $(e.target).attr("href");
      $.ajax({
        method: 'get',
        url: url
      }).success(function(response){
        $("#user-auth").html(response);
      });
    });
    $(".ask-question-form").on("click", "a", function(e){
        e.preventDefault();
        url = $(e.target).attr("href");
        $.ajax({
          method: 'get',
          url: url
        }).success(function(response){
          $(".ask-question-form").html(response);
        });
      });
//       $(".new-edit-form").on("submit", function(e){
//         e.preventDefault
//         debugger
//         url = $(e.target).attr("href");
//         $.ajax({
//           method: 'get',
//           url: url
//         }).success(function(response){
//           $(".ask-question-form").hide();
//         })
//       })
// //clear somewhere else in window hide form

    //
    // end of leila's ajax

});
