$(document).ready(function() {
  $("#login-link").on("click", function(e){
      e.preventDefault();
      url = $(e.target).attr("href")
      $this = $(this)
      $.ajax({
        method: 'get',
        url: url
      }).success(function(response){
        $("#new-note-form").append(response);
        $this.hide()
      });
    });
});
