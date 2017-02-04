$(document).ready(function() {
// begin Leila Ajax
  $("#register-link").click(function(e){
      e.preventDefault();
      url = $(e.target).attr("href");
      $.ajax({
        method: 'get',
        url: url
      }).success(function(response){
        $("#user-auth").html(response);
      });
    });
  $("#login-link").click(function(e){
      e.preventDefault();
      url = $(e.target).attr("href");
      $.ajax({
        method: 'get',
        url: url
      }).success(function(response){
        $("#user-auth").html(response);
      });
    });
    $(".ask-question").on("click", function(e){
        e.preventDefault();
        url = $(e.target).attr("href");
        $.ajax({
          method: 'get',
          url: url
        }).success(function(response){
          $(".ask-question").html(response);
        });

      });




    //
    // end of leila's ajax

});
