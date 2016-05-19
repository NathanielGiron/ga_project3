$(document).ready(function(){
 $(".submit").on("click", function(event) {
  console.log(event)
  PrivatePub.subscribe("/messages/new", function(data, channel) {
    console.log(data);
    $("#chat").append(data.message);
  });

  });
});

 

