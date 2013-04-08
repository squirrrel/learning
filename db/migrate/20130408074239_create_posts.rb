class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :blog
      t.timestamps
    end
    add_foreign_key(:posts, :blogs, name: 'post_blog_foreign_key')
  end
end
