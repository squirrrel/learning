class PostsController < ApplicationController
  layout 'application'

  def index

    theme =  session[:p]== nil ? params[:parent] : session[:p]

    @pst_container = {}
    i = 0
    Post.joins(:blog).where(:blogs => {:theme => theme}).order('created_at').each do |post|

      @pst_container[i] ={
          title: post.title,
          body: post.body,
          created: post.created_at}
      i = i + 1
    end

    respond_to do |format|
      format.js { render 'index.js.erb' }
    end

  end

  def create
    #todo: there will be a blog field indicating
    p params

    blog_id = Blog.find_by_theme(params[:new][:related_blg]).id

    post = Post.new
    post.title = params[:new][:title]
    post.body = params[:html_link_content]
    post.blog_id = blog_id
    post.save

    #File.open("#{Dir.pwd}/app/views/posts/_test.html.erb", 'a+') do |plain_html|
    #  plain_html.puts params[:html_link_content]
    #end
    session[:p]= params[:new][:related_blg]
    index
  end

end
#todo: approach for getting the rich editor content/sending it to the server side:
#1. understand th way creditor works and how it is correctly used, and some other standard methods
#2. otherwise get and install all the adapters jquery.js version and see if any will work
#3. see if it is just possible go and send it the data as they are through any rails form helper on submit.


 #todo: reason the _related_post javascript still rendering body with tags is because probably it is happening within haml context.
#so: 1 try to replace the content from the users.js.coffee using its own context
# render it as an html.erb partial

