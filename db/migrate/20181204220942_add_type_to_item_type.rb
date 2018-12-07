class AddTypeToItemType < ActiveRecord::Migration[5.1]
  def change
    add_column :item_types, :type, :string
  end
end
