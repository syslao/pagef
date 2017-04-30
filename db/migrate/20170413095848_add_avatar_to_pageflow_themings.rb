class AddAvatarToPageflowThemings < ActiveRecord::Migration
  def change
    add_column :pageflow_themings, :avatar, :string, :limit => 1000
  end
end
