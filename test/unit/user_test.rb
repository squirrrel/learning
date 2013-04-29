require 'test_helper'

#todo: to review
class UserTest < ActiveSupport::TestCase
  fixtures :users

  setup :vcreds


    @usr_flsh = 'Username should contain 6..10 characters'
    @pass_flsh = 'Password should contain 7..15 characters and at least one capital letter'



  test 'register method' do
    assert_equal User.register(h ={:username => 'lolita', :name => 'Loli', :not_hashed_pass => 'Casablanca13'}), true

    assertions = {"#{@usr_flsh}.?#{@pass_flsh}" => "#{User.register({username: 'hmmm', name: 'Default', not_hashed_pass: 'hmmmmm'}).join('')}",
                  "Enter your username and password" => "#{User.register({username: '', name: 'Default', not_hashed_pass: ''})}",

                  "#{@pass_flsh}.?Enter your username" => "#{User.register({username: '', name: 'Default', not_hashed_pass: 'Notright'}).join('')}",
                  "#{@usr_flsh}.?Enter your password" => "#{User.register({username: 'um', name: 'Default', not_hashed_pass: ''}).join('')}",
                  "Enter your password.?'dudessa' has already been taken." => "#{User.register({username: @vuser, name: 'Default', not_hashed_pass: ''})}",
                  "#{@pass_flsh}.?'dudessa' has already been taken." => "#{User.register({username: @vuser, name: 'Default', not_hashed_pass: 'Notright'}).join('')}",
                  "Enter your username" => "#{User.register({username: '', name: 'Default', not_hashed_pass: 'Testing88'})}",
                  "Enter your password" => "#{User.register({username: 'testing', name: 'Default', not_hashed_pass: ''})}",
                  "'dudessa' has already been taken." => "#{User.register({username: @vuser, name: 'Default', not_hashed_pass: 'Testing88'})}"
    }

    assertions.each do |k, v|
      assert_match(/#{k}/, v)
    end
  end

  test 'authenticate method' do
    assert_equal User.authenticate({username: @vuser, not_hashed_pass: @vpass}), 1
    assert_equal User.authenticate({username: 'testing', not_hashed_pass: @vpass}), 'Your personal data is incorrect'
    assert_equal User.authenticate({username: @vuser, not_hashed_pass: 'Salamanca54'}), 'Your personal data is incorrect'
  end
  ##-------------------------------------------------------------------------------------------------
  #


  invalid = {
      :first => {num: 1, usr: 'umochkaumoc', pass: 'Logica22', mssg: @usr_flsh, key: 'username'},
      :second => {num: 2, usr: 'umoch', pass: 'Logica22', mssg: @usr_flsh, key: 'username'},
      :third => {num: 3, usr: 'umochka', pass: 'Passwordpasswor1', mssg: @pass_flsh, key: 'not_hashed_pass'},
      :fourth => {num: 4, usr: 'umochka', pass: 'Pass12', mssg: @pass_flsh, key: 'not_hashed_pass'},
      :fifth => {num: 5, usr: 'umochka', pass: 'passwor12', mssg: @pass_flsh, key: 'not_hashed_pass'},
      :sixth => {num: 6, usr: 'umochka', pass: 'Passwor', mssg: @pass_flsh, key: 'not_hashed_pass'}

  }

  invalid.each do |k, v|
    test "given invalid input #{v[:num]}" do


      test_usr = User.new

      test_usr.name = 'Ninok'
      test_usr.username = v[:usr]
      test_usr.not_hashed_pass= v[:pass]

      assert !test_usr.valid?, 'Invalid password'
      assert_equal test_usr.errors[v[:key]].join(''), v[:mssg]
    end
  end
  #-----------------------------------------------------------------------------------


  #with 10 too


  valid = {:first => {num: 1, usr: 'umochk', pass: 'Logica22', key: 'username'},
           :second => {num: 2, usr: 'umochkaumo', pass: 'Logica22', key: 'username'},
           :third => {num: 3, usr: 'umochka', pass: 'Pass_12', key: 'not_hashed_pass'},
           :fourth => {num: 4, usr: 'umochka', pass: 'Passwordpassw12', key: 'not_hashed_pass'},

  }

  valid.each do |k, v|
    test "given valid input #{v[:num]}" do
      test_usr = User.new

      test_usr.name = 'Ninok'
      test_usr.not_hashed_pass= v[:pass]
      test_usr.username = v[:usr]

      assert test_usr.valid?, 'Valid username'
      assert_equal test_usr.errors[v[:key]].join(''), ''
    end
  end

end

