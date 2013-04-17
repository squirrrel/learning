class User < ActiveRecord::Base
  attr_accessible :ava, :name, :position, :username, :not_hashed_pass, :email
  has_many :blogs
  has_many :comments

  #todo: to find out how to override the fact that i am checking the pass for a valid?, hash it and write it to the hashed_pass
  validates :not_hashed_pass,
            :format => {:with => /^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*_?).{7,15}$/, :message =>
                'Password should contain 7..15 characters and at least one capital letter'}


  validates :username,
            :format => {:with => /^(?=.*[a-z]).{6,10}$/, :message => 'Username should contain 6..10 characters'}


     #todo: add validations for missing name
  def self.register(creds={})

    web_input = User.new
    web_input.username = creds[:username]
    web_input.not_hashed_pass = creds[:not_hashed_pass]
    web_input.name=creds[:name]

    @user__found = User.find_by_username(creds[:username])
    #workaround
    #if pass_num == 1, add additional str to pass when hashing it
    hash_pass = Digest::SHA1.hexdigest(creds[:not_hashed_pass])


    pass_num = User.count(:conditions => "not_hashed_pass = '#{hash_pass}'")
    usr_num = User.count(:conditions => "username = '#{creds[:username]}'")

    if web_input.valid? == true && @user__found == nil && (pass_num + usr_num) == 0
      #workaround: -------------------
      #todo: later on to add some chars to the users that take the already existing pass, sign in them always adding these chars, too?
      #todo: add a flag and set it to true for the 'second used pass' users
      #do something if pass_num == 1
      #-------------------------------
      web_input.hashed_pass = hash_pass
      web_input.save
      return true
    else

      if  web_input.username.empty? && web_input.not_hashed_pass.empty? #t
        'Enter your username and password'
      elsif  !web_input.errors[:not_hashed_pass].empty? && web_input.username.empty? #t
        web_input.errors[:not_hashed_pass] << 'Enter your username'
      elsif !web_input.errors[:username].empty? && web_input.not_hashed_pass.empty? #t
        web_input.errors[:username] << 'Enter your password'

      elsif web_input.not_hashed_pass.empty? && usr_num == 1 #t
        'Enter your password' + "'#{web_input.username}' has already been taken."

      elsif  !web_input.errors[:not_hashed_pass].empty? && usr_num == 1 #t
        web_input.errors[:not_hashed_pass] << "'#{web_input.username}' has already been taken."

      elsif  web_input.username.empty? #t
        'Enter your username'
      elsif web_input.not_hashed_pass.empty? #t
        'Enter your password'

      elsif usr_num == 1 #t
        "'#{web_input.username}' has already been taken."

      elsif web_input.valid? == false
        return web_input.errors[:username] + web_input.errors[:not_hashed_pass] #t
      end

    end

  end

  #todo: if it is a special 'with-flag' user, set them additional str to their pass when signing them in
  def self.authenticate(creds={})
    #nil if not found
    if  User.exists?(:username => creds[:username]) == false
      'Your personal data is incorrect'

    else
      usr = User.find_by_username(creds[:username])

      Digest::SHA1.hexdigest(creds[:not_hashed_pass]) == usr.hashed_pass ? usr.id : 'Your personal data is incorrect'

    end
  end

end

#todo: not to let db save not_hashed password
#todo: override the input data resetting when rendering views with flash[:notice]
#todo: make nput not chache the previously entered data!