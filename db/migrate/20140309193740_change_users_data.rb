class ChangeUsersData < ActiveRecord::Migration
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    add_column :users, :credits, :integer, default: 2
  end
end
