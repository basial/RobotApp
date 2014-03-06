class AddIsUsedFieldToCredit < ActiveRecord::Migration
  def change
    add_column :credits, :is_used, :boolean
  end
end
