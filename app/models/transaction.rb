# == Schema Information
#
# Table name: transactions
#
#  id         :integer          not null, primary key
#  buyer_id   :integer
#  seller_id  :integer
#  item_id    :integer
#  sale_price :float
#  notes      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Transaction < ApplicationRecord
    belongs_to :buyer, :class_name => "User"
    belongs_to :seller, :class_name => "User"
    belongs_to :item
end
