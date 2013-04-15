class RenameUserColumn < ActiveRecord::Migration
  def change
  rename_column :users, :hased_pass, :hashed_pass

  end
end
