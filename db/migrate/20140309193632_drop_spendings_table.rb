class DropSpendingsTable < ActiveRecord::Migration
  def change
    drop_table :spendings
  end
end
