$(document).ready(function() {

// AJAX for comments

  // NEW COMMENT
  // hide new comment link and show comment form
  $(".comment-form a").on("click", function(e) {
    e.preventDefault();

    $.ajax({
      url: $(e.target).attr("href"),
      method: "get"
    })
      .done(function(msg) {
        $(e.target).addClass("hidden");
        $(e.target).parent().append(msg);
      });
  });

  // new form submit
  $(".comment-form").on("submit", ".new-edit-form", function(e) {
    e.preventDefault();

    $.ajax({
      url: $(e.target).attr("action"),
      method: $(e.target).attr("method"),
      data: $(e.target).serialize()
    })
      .done(function(msg) {
        $(".comments-content").append(msg);
        $(e.target).children("textarea").val("");
      })
      .fail(function(msg) {
        $(e.target).before(msg.responseText);
      })
  })

  // new form cancel button
  $(".comment-form").on("click", ".new-edit-form a", function(e) {
    e.preventDefault();

    $(".comment-form a").removeClass("hidden");
    $(".new-edit-form").remove();
  });
  
// END OF COMMENT AJAX

});
