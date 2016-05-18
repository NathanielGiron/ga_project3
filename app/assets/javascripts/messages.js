# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$("#chat").append("<%= j render(@message) %>");
$("#new_message")[0].reset();