class Blog < ActiveRecord::Base
  attr_accessible :theme, :background_pic
  belongs_to :user
  has_many :posts

  validates :user_id, :presence => true

  def self.save_background(file_obj)
    full_path = "#{Dir.pwd}/app/assets/images/" + file_obj.original_filename

    File.open(full_path, 'wb') do |f|
      f.write(file_obj.read)

    end



  end

end
