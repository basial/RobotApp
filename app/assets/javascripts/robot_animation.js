$(document).ready(function() {
  var robot = $("#robot");

  $("#forward").on("click", function(e) {
    e.preventDefault();
    robot.animate({ top: "+=100" }, 500);
  });

  $("#backward").on("click", function(e) {
    e.preventDefault();
    robot.animate({ top: "-=100" }, 500);
  });

  $("#left").on("click", function(e) {
    e.preventDefault();
    robot.animate({ left: "-=100" }, 500);
  });

  $("#right").on("click", function(e) {
    e.preventDefault();
    robot.animate({ left: "+=100" }, 500);
  });

  $("#s_forward").on("click", function(e) {
    e.preventDefault();
    robot.animate({ top: "+=100" }, 1500);
  });

  $("#s_backward").on("click", function(e) {
    e.preventDefault();
    robot.animate({ top: "-=100" }, 1500);
  });

  $("#run").on("click", function(e) {
    e.preventDefault();
    robot.animate({ top: "+=200" }, 500);
  });

  $("#attack").on("click", function(e) {
    e.preventDefault();
    robot.animate({ top: "+=50", width: "+=50", height: "+=50" }, 500);
  });
});