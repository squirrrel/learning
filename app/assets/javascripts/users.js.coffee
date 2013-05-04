# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


jQuery -> $( -> $("#form_wnd" ).draggable())
jQuery -> $(".boxclose, .blackened, .btn").click(-> $('#form_wnd,.blackened').hide())
jQuery -> $(".blg").click(-> $('#form_wnd,.blackened').show())

jQuery -> $('.form-inline').submit(-> $('<p>Test</p>').insertAfter($('#background')));

