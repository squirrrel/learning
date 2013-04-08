class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :limit => 10, :null => false
      t.string :hashed_password, :null => false
      t.string :name, :null => false
      t.string :position
      t.binary :ava
      t.timestamps
    end
  end
end
