class CreateBlogs < ActiveRecord::Migration
  def up
    create_table :blogs do |t|
      t.string :title, :null => false
      t.text :body, :null => false
      t.references :user
      t.timestamps
    end

  end

  def down

  end
end
