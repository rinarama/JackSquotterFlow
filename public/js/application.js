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
        $("#error").remove();
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
    $("#error").remove();
  });


  // EDIT COMMENT
  // hide edit comment link and show comment form
  $(".comments-content").on("click",  ".edit-question a.edit", function(e) {
    e.preventDefault();

    $.ajax({
      url: $(e.target).attr("href"),
      method: "get"
    })
      .done(function(msg) {
        $(e.target).parent().parent().append(msg);
        $(e.target).parent().addClass("hidden");
        $(e.target).parent().siblings("p").addClass("hidden");
      });
  });

  // edit form update
  $(".comments-content").on("submit", ".new-edit-form", function(e) {
    e.preventDefault();

    $.ajax({
      url: $(e.target).attr("action"),
      method: $(e.target).attr("method"),
      data: $(e.target).serialize()
    })
      .done(function(msg) {
        $(".comment-form a").removeClass("hidden");
        $(".edit-question").removeClass("hidden");
        $(".comments").children("p").removeClass("hidden");
        $(".new-edit-form").remove();
        $("#error").remove();

        $("#comment_id_" + msg.id ).children("p").children("span.comment").html(msg.comment);
        $("#comment_id_" + msg.id ).children("p").children("span.date").html(msg.date);
      })
      .fail(function(msg) {
        $(e.target).before(msg.responseText);
      })
  })

  // edit form cancel button
  $(".comments-content").on("click", ".new-edit-form a", function(e) {
    e.preventDefault();

    $(".comment-form a").removeClass("hidden");
    $(".edit-question").removeClass("hidden");
    $(".comments").children("p").removeClass("hidden");

    $("#error").remove();
    $(".new-edit-form").remove();
  });

  // DELETE COMMENT
  $(".comments-content").on("submit", ".delete", function(e) {
    e.preventDefault();

    $.ajax({
      url: $(e.target).attr("action"),
      method: "delete"
    })
      .done(function(msg) {
        $("#comment_id_" + msg.id).siblings(".after-comment_" + msg.id).remove();
        $("#comment_id_" + msg.id).remove();
      });
  });

// END OF COMMENT AJAX
});
