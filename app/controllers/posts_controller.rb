class PostsController < ApplicationController
  layout 'application'

  def index

    @pst_container = {}
    i = 0
    Post.joins(:blog).where(:blogs => {:theme => params[:parent]}).order('created_at').each do |post|

      @pst_container[i] ={
      title:  post.title,
      body:   post.body,
      created: post.created_at   }
    i = i + 1
    end

    respond_to do |format|
      format.js { render 'index.js.erb' }
    end

  end

end

