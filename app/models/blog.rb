class Blog < ActiveRecord::Base
   attr_accessible :theme
  belongs_to :user
  has_many :posts

   validates :user_id, :presence => true
end
