class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :hased_pass, :string
  end
end
