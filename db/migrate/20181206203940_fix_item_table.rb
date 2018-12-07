class FixItemTable < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :category_id, :integer
    remove_column :items, :item_type_id
  end
end
