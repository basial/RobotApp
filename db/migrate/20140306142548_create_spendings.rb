class CreateSpendings < ActiveRecord::Migration
  def change
    create_table :spendings do |t|
      t.integer :amount
      t.integer :user_id

      t.timestamps
    end
  end
end
