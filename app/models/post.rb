class Post < ActiveRecord::Base
  attr_accessible :title, :body
  belongs_to :blog

  validates :blog_id, :presence => true


  def self.search(param)

    title_found = Post.select { |m| m.title =~ /#{param}/i }

    if title_found.empty?
      post_found = Post.select { |m| m.body =~ /#{param}/i }
      post_found.empty? ? (false) : post_found.map { |post| post.title }
    else
      #records-found array
      title_found.map { |ttl| ttl.title }

    end

#it return en empty array otherwise
  end

end
