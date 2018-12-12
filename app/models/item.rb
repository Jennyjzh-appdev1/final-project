# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  seller_id   :integer
#  price       :float
#  address     :string
#  photo       :string
#  location_id :integer
#  status_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Item < ActiveRecord::Base
    mount_uploader :photo, PhotoUploader
    
    belongs_to :seller, :class_name => "User", :foreign_key => "seller_id"
    has_many :transactions, :dependent => :destroy
    has_many :comments, :dependent => :destroy
    has_many :bookmarks, :dependent => :destroy
    belongs_to :location, :class_name => "Location", :foreign_key => "location_id"
    belongs_to :status
    belongs_to :category
end
