# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  location   :string
#

class Location < ApplicationRecord
    has_many :items, :dependent => :destroy
end
