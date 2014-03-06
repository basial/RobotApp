class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :user_id
      t.integer :transaction_id
      t.decimal :amount
      t.timestamps
    end
  end
end
