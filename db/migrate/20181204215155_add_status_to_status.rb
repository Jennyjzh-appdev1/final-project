class AddStatusToStatus < ActiveRecord::Migration[5.1]
  def change
    add_column :statuses, :status, :string
  end
end
