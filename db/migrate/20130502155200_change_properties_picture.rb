class ChangePropertiesPicture < ActiveRecord::Migration
  def self.up
    change_column :blogs, :picture, :string
  end

end
