# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bookmark < ApplicationRecord
    belongs_to :user
    belongs_to :item
end
