$(document).ready(function() {
  $("#register-link").on("click", function(e){
      e.preventDefault();
      url = $(e.target).attr("href");
      $.ajax({
        method: 'get',
        url: url
      }).success(function(response){
        $("#user-auth").html(response);
      });
    });
    $(".standard-form").on("submit", function(e){
        e.preventDefault();
        url = $(e.target).attr("action");
        $.ajax({
          method: 'get',
          url: url
        }).success(function(response){
          $(".box").hide()
        });
      });
});
