class Post < ActiveRecord::Base
   attr_accessible :title, :body
  belongs_to :blog

  validates :blog_id, :presence => true


end
