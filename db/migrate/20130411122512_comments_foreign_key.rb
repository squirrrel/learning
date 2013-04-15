class CommentsForeignKey < ActiveRecord::Migration
  def change
   add_foreign_key(:comments, :users, name: 'comments_user_foreign_key')
  end

end
