class DropCreditsTable < ActiveRecord::Migration
  def change
    drop_table :credits
  end
end
