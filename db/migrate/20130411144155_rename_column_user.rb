class RenameColumnUser < ActiveRecord::Migration
  def change
    rename_column :users, :hashed_password, :not_hashed_pass
  end

end
