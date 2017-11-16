//= require underscore
//= require gmaps/google
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary

// app/assets/javascripts/init_attachinary.js
$(document).ready(function() {
  $('.attachinary-input').attachinary();
});
