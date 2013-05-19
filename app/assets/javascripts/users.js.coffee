# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery -> window.onload=$(-> $('li a').first().trigger('click'))
jQuery -> link =/\w+/.exec($("#jquery_ajax_testing").text());$("#jquery_ajax_testing").click(-> $.ajax({type: "GET",url: "http://localhost:3000/posts/",data:{parent: link},dataType: "script"}))



jQuery -> $( -> $("#create_blog, #create_post" ).draggable())
jQuery -> $(".boxclose,.blackened").click(-> $('#create_post,#create_blog,.blackened, .alert').hide())
jQuery -> $(".blg").click(-> $('#create_blog,.blackened').show())
jQuery -> $(".pst").click(-> $('#create_post,.blackened').show())
jQuery -> $('li a').first().addClass('important')

jQuery -> document.getElementById('background').onchange=-> $('<h6>'+/[^\\]+\.png|gif|jpg$/.exec(this.value)+' attached.</h6>').insertAfter($('.attch_lnk'))

jQuery -> $('.form-inline').submit(->  if /\w+/.exec(window.document.getElementById('new_theme').value) is null
  off
  $('<p class="alert alert-error">You should specify your blog name</p>').insertAfter($('#background')) if $('.alert').length == 0
  $(".alert").show()
 else
  $('#create_blog,.blackened').hide())

jQuery -> $( 'div.ckeditor' ).ckeditor(-> skin:'Moono')




#jQuery -> $(window).resize(-> $('body').prepend('<div>' + $(window).width() + '</div>'));

#$(document).scroll(->$('body').prepend('<div>Handler for .scroll() called.</div>')
#);

#jQuery -> $('.tooltip_tagged').simpleTooltip({title: 'me is a tooltip'})


#





#todo: add remove attachment functionality



