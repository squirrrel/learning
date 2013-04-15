require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  fixtures :users

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

 test 'Invalid user registration' do
   post :create, :new => {:username => '', :not_hashed_pass => '', :name => '' }
   assert_template 'new'
   #todo: see why test does not see the flash[:notice], even though it is on the page
   #assert_equal 'Enter your username and password', flash[:notice]
   assert_select 'div', :text => 'Enter your username and password'
 end


end




