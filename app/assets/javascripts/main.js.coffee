# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#start, #end').datepicker
    dateFormat: 'yy-mm-dd'
  $('input[type="submit"]').click ->
    $(this).attr('disabled', 'disabled')
    $(this).parents('form').submit()