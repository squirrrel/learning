# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.onload=$(-> $('li a').first().trigger('click'))

jQuery -> $( -> $("#form_wnd" ).draggable())
jQuery -> $(".boxclose").click(-> $('#form_wnd,.blackened, .alert').hide())
jQuery -> $(".blg").click(-> $('#form_wnd,.blackened').show())
jQuery -> $('li a').first().addClass('important')

jQuery -> document.getElementById('background').onchange=-> $('<h6>'+/[^\\]+\.png|gif|jpg$/.exec(this.value)+' attached.</h6>').insertAfter($('.attch_lnk'))

jQuery -> $('.form-inline').submit(->  if /\w+/.exec(window.document.getElementById('new_theme').value) is null
  off
  $('<p class="alert alert-error">You should specify your blog name</p>').insertAfter($('#background')) if $('.alert').length == 0
  $(".alert").show()

else $(".blackened, .btn").click(-> $('#form_wnd,.blackened').hide())
)

#jQuery -> $(window).resize(-> $('body').prepend('<div>' + $(window).width() + '</div>'));

#$(document).scroll(->$('body').prepend('<div>Handler for .scroll() called.</div>')
#);









#todo: add remove attachment functionality



