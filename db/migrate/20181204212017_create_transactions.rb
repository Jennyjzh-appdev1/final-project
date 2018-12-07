class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.integer :item_id
      t.float :sale_price
      t.string :notes

      t.timestamps
    end
  end
end
