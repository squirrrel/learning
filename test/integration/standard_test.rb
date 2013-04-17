require 'test_helper'
class Standard < ActionDispatch::IntegrationTest
  fixtures :users

  setup :vcreds

  def test_some_stuff

    get '/users/new'
    assert_response :success
    click_link 'Sign in'
    assert_redirected_to '/users/signin'

    post_via_redirect '/users/validate', :commit => 'Sign in', :signin => {:username => @vuser, :not_hashed_pass => @vpass}
    assert_equal '/users/1', path
  end

end

#todo: complete investigation and either make it work or quit