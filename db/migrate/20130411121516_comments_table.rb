class CommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :your_comments, :limit => 1000
      t.references :user
      t.timestamps
    end
  end

end
