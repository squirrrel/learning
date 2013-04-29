class AddSessionsTable < ActiveRecord::Migration
  def change
    create_table :session_data do |t|
      t.string :session_id, :null => false
      t.text :data
      t.timestamps
    end

    add_index :session_data, :session_id
    add_index :session_data, :updated_at
  end
end
