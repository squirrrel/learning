class UsersController < ApplicationController

  layout 'application'


  def new
    @new = User.new
    #   request.env['HTTP_USER_AGENT']
  end

  def create

    creds_test = User.register(params[:new])

    if creds_test == true
      @id = User.find_by_username(params[:new][:username])
      redirect_to :action => 'show', :id => @id
    else
      flash[:notice] = creds_test
      render 'new'
    end

    #TODO: set it up once the app is pushed to heroku:
    # UserMailer.welcome_email(User.find(1)).deliver
  end

  def signin
    render 'signin'
  end


  def validate
    id_or_mssg = User.authenticate(params[:signin])
    id_or_mssg.class == Fixnum ? (redirect_to :action => 'show', :id => id_or_mssg) : (flash[:notice] = id_or_mssg; render 'signin')
  end


  def show
    @user_id = params[:id]
    @blogs_container = User.find(params[:id]).blogs.map { |blog| blog.theme } #SELECT bl.theme FROM blogs bl INNER JOIN users on bl.user_id = users.id WHERE users.id = params[:id]

  end

  def signout
    redirect_to '/users/new'
  end

  def search

    #todo: highlight the word found
    #todo: complete returns + add ajax/partial for it
    @searchfld_param = (params[:search].map { |k, v| v }).join('')

    @blogs_found = Blog.search(@searchfld_param)
    #+ return the user

    @posts_found = Post.search(@searchfld_param)
    #+return the body + user

    @user_found = User.search(@searchfld_param)
    #returns a hash with all the emails, user, position match. Parse it and process, also see if I can eliminate the empty 'value' arrays at the model level
    #+ return name+position+email+blogs list+posts

    respond_to do |format|
      format.js { render 'search.js.erb' }
    end


  end

end