ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "webrat"
require 'webrat/core/matchers'



class ActiveSupport::TestCase
  include Webrat::Methods
  include Webrat::Matchers
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  def vcreds
    @vuser = users(:dudessa).username
    @vpass = users(:dudessa).not_hashed_pass
    @vname = users(:dudessa).name

  end

  Webrat.configure do |config|
    config.mode = :rails
  end


  # Add more helper methods to be used by all tests here...
end



