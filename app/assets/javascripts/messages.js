$(document).ready(function(){
  $(".submit").click(function(event) {
    PrivatePub.subscribe("/messages/new", function(data, channel) {
      $("#chat").append("<%= j render(@message) %>");
      $("#new_message")[0].reset();
      });
      location.reload()
    });
});



// PrivatePub.subscribe("/messages/new", function(data, channel) {
//   console.log('last');
//   $("#chat").append("<%= j render(@message) %>");
//   $("#new_message")[0].reset();
//   });

// PrivatePub.subscribe("/messages/new", function(data, channel) {
//   $("#chat").append(data.chat_message);
// });