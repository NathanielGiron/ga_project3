// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap-datepicker
//= require_tree .


  $(function() {
    // If your Heroku application is within the EU region,
    // uncomment the following lines
    // Pusher.host = 'ws-eu.pusher.com';
    // Pusher.sockjs_host = 'sockjs-eu.pusher.com';

    var pusher = new Pusher('a26a43a4d594161cec60'); // Replace with your app key
    var channel = pusher.subscribe('private-'+<%= current_user.id %>);

    // Some useful debug msgs
    pusher.connection.bind('connecting', function() {
      $('div#status').text('Connecting to Pusher...');
    });
    pusher.connection.bind('connected', function() {
      $('div#status').text('Connected to Pusher!');
    });
    pusher.connection.bind('failed', function() {
      $('div#status').text('Connection to Pusher failed :(');
    });
    channel.bind('subscription_error', function(status) {
      $('div#status').text('Pusher subscription_error');
    });
  });