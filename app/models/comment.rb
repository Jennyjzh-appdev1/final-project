# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment    :string
#

class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :item
    
    validates :user_id, presence: true
    validates :comment, presence: true
end
