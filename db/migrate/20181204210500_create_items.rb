class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.integer :seller_id
      t.float :price
      t.string :address
      t.string :photo
      t.integer :location_id
      t.integer :status_id
      t.integer :item_type_id

      t.timestamps
    end
  end
end
