# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
 window.onload=$(-> $('li a').first().trigger('click'))
 link =/\w+/.exec($("#jquery_ajax_testing").text());$("#jquery_ajax_testing").click(-> $.ajax({type: "GET",url: "http://localhost:3000/posts/",data:{parent: link},dataType: "script"}))

#$(".editor_form").submit(-> content = CKEDITOR.instances.editor1.getData(); $.ajax({type: "get",url: "http://localhost:3000/posts/create",data:{parent: content,dataType: "script"}}))
 $( -> $("#create_blog, #create_post" ).draggable())
 $(".boxclose,.blackened").click(-> $('#create_post,#create_blog,.blackened, .alert').hide())
 $(".blg").click(-> $('#create_blog,.blackened').show())
 $(".pst").click(-> $('#create_post,.blackened').show())
 $('li a').first().addClass('important')
 #$('a.random').click(-> CKEDITOR.instances.editor1.getData())
 document.getElementById('background').onchange=-> $('<h6>'+/[^\\]+\.png|gif|jpg$/.exec(this.value)+' attached.</h6>').insertAfter($('.attch_lnk'))

 $("form").submit((e) ->
  target_id = e.target.id
  if target_id is 'small_form'
   id = 'new_theme'; after ='background'; flash_injection = 'your blog'
  else
   id = 'rel_blog'; after = 'rel_blog'; flash_injection = 'related blog'
  if /\w+/.exec(window.document.getElementById(id).value) is null
   off
   $("<p class='alert alert-error'>You should specify #{flash_injection} name</p>").insertAfter($('#'+ after)) if $('.alert').length == 0
  else
   $('#create_blog,.blackened').hide())



#jQuery -> $(window).resize(-> $('body').prepend('<div>' + $(window).width() + '</div>'));

#$(document).scroll(->$('body').prepend('<div>Handler for .scroll() called.</div>')
#);

#jQuery -> $('.tooltip_tagged').simpleTooltip({title: 'me is a tooltip'})
#todo: extend the last jquery functionality to flash-notice all of the post form fields
#todo: add remove attachment functionality



