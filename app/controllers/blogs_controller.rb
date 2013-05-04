class BlogsController < ApplicationController

  layout 'application'

  #def new
  #  @new_blog = Blog.new
  #  respond_to do |format|
  #    format.js { render 'new_blog.js.erb' }
  #  end
  #end

  def create

    @topic = params[:new][:theme]

    blog = Blog.new
    blog.theme = @topic
    blog.user_id = params[:new][:usrid]

    attached_img = params[:new][:picture]
    unless attached_img == nil
      Blog.save_background(attached_img)
      blog.background_pic= attached_img.original_filename
    end

    blog.save


    respond_to do |format|
      if blog.save
        format.js do
          render 'added_blog.js.erb'
        end
      end

    end
  end

end

#todo: add validations to the 'new blog' form: have to cancel submit action-> n actual way to handle validatin on the server side, have to do it using javascript
#todo: make the first blogs content seen and the nav link active once the user is logged in

#todo: add progress bar while the data are saved and until the blog's name is displayed on the nav bar'

#todo: display the newly uploaded file at the blog form!
#todo:think how would the url change depending on which block is open
#todo:forth app switch to the newly create blog's content one's the create button is clicked?

