require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  fixtures :users

  setup :vcreds


  def teardown
    @vuser, @vpass = nil
  end

  test 'Initial page is rendered, related contents is tested' do
    get :new
    assert_response :success

    assert_select 'body' do
      assert_select 'a', {:text => 'Sign in'}
    end

    assert_select 'form' do
      assert_select 'input[placeholder=New username...]'
      assert_select 'input[placeholder=New password...]'
      assert_select 'input[placeholder=Your name...]'
      assert_select 'input[value=Get Registered!]'
    end
  end
  #---------------------------------------------------------------

  test 'Sign in page is rendered, related contents is tested' do
    get :signin
    assert_response :success

    assert_select 'form' do
      assert_select 'input[placeholder=Your username...]'
      assert_select 'input[placeholder=Your password...]'
      assert_select 'input[value=Sign in]'
    end
  end
  #---------------------------------------------------------------

  test 'Valid user registration' do
    post :create, :new => {:username => 'umochka', :not_hashed_pass => 'Umochka56', :name => 'Umka'}
    assert_redirected_to '/users/3'

    post :create, :new => {:username => 'lampara', :not_hashed_pass => 'Lampara22', :name => 'Lampa'}
    assert_redirected_to '/users/4'
  end
  #---------------------------------------------------------------

  test 'Invalid user registration' do
    post :create, :new => {:username => '', :not_hashed_pass => '', :name => ''}
    assert_template 'new'

    #knowledge base: flash[:notice] is set to nil after the actual template/view is rendered
    #knowledge base: so not testing it directly, but inspecting the html-structure
    assert_select 'div', :text => 'Enter your username and password'
  end
  #---------------------------------------------------------------

  test 'Valid user authenticated' do

    post :validate, :signin => {:username => @vuser, :not_hashed_pass => @vpass}
    assert_redirected_to '/users/1'
  end
  #---------------------------------------------------------------

  test 'Invalid user is blocked' do
    post :validate, :signin => {:username => '', :not_hashed_pass => ''}
    assert_template 'signin'
    assert_select 'div', :text => 'Your personal data is incorrect'
  end
  #---------------------------------------------------------------

  test 'Existing user homepage is rendered' do
    get :show, :id => 1
    assert_response :success

    get :show, :id => 2
    assert_response :success
  end

end




