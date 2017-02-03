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
  $("#login-link").on("click", function(e){
      e.preventDefault();
      url = $(e.target).attr("href");
      $.ajax({
        method: 'get',
        url: url
      }).success(function(response){
        $("#user-auth").html(response);
      });
    });
});
