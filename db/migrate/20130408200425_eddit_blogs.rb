class EdditBlogs < ActiveRecord::Migration
  def change
 remove_column :blogs, :body
 rename_column :blogs, :title, :theme
 add_column :blogs, :picture, :binary
  end
end
