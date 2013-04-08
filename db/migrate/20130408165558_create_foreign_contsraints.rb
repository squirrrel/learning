class CreateForeignContsraints < ActiveRecord::Migration
  def up
  add_foreign_key(:blogs, :users, name: 'blogs_user_foreign_key')
  end

  def down
  remove_foreign_key(:blogs, name: 'blogs_user_foreign_key')
  end
end
