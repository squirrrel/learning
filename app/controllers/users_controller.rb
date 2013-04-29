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


  #def signout
  #  redirect_to('new')
  #end
  #todo: rewrite the links iterator

  def show
    @user_id = params[:id]
    respond_to do |format|
      format.html {
        @blogs_container = User.find(params[:id]).blogs.map { |blog| blog.theme } #SELECT bl.theme FROM blogs bl INNER JOIN users on bl.user_id = users.id WHERE users.id = params[:id]
      }
      format.js { render ''}
    end
  end

end
