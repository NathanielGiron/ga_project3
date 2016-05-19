$(document).ready(function(){
  $(".submit").click(function(event) {
    PrivatePub.subscribe("/messages/new", function(data, channel) {
      $("#chat").append("<%= j render(@message) %>");
      $("#new_message")[0].reset();
      });
      location.reload()
    });
});