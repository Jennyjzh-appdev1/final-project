# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string
#

class Status < ApplicationRecord
    has_many :items, :dependent => :destroy
end
