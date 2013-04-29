class BlogsController < ApplicationController

  layout 'application'

  def new
    @new_blog = Blog.new
    respond_to do |format|
      format.js { render 'new_blog.js.erb' }
    end
  end

  def create
    @topic = params[:new][:theme]

    blog = Blog.new
    blog.theme = @topic
    blog.user_id = params[:new][:usrid]
    blog.save

    respond_to do |format|
      format.js { render 'added_blog.js.erb' }
      #end
    end
  end
end

#todo: make the added link last longer))
