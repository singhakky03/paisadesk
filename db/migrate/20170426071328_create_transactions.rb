class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :amount
      t.date :date
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
