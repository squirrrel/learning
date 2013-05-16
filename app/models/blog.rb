class Blog < ActiveRecord::Base
  attr_accessible :theme, :background_pic
  belongs_to :user
  has_many :posts

  validates :user_id, :presence => true
  validates :theme, :presence => true

  def self.save_background(file_obj)
    full_path = "#{Dir.pwd}/app/assets/images/" + file_obj.original_filename

    File.open(full_path, 'wb') do |f|
      f.write(file_obj.read)

    end
  end

  def self.search(param)
    #Did no find out how to apply regexp instead of the LIKE clause
    #todo: fr some reason SQL does not perform search when requesting it directly from the web page, but i can do it via plain activerecord
    search_results = {
    :first => Blog.all(:conditions => "theme LIKE '#{param}%'"),
    :second => Blog.all(:conditions => "theme LIKE '%#{param}'"),
    :third => Blog.all(:conditions => "theme LIKE '_%#{param}%'") }
    Blog.all(:conditions => "theme LIKE '#{param}%'")
    p search_results
  end

end
