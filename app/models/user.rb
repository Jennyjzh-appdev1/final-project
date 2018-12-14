# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :items, :foreign_key => "seller_id", :dependent => :destroy
  has_many :bookmarks, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :purchases, :class_name => "Transaction", :foreign_key => "buyer_id", :dependent => :destroy
  has_many :sales, :class_name => "Transaction", :foreign_key => "seller_id", :dependent => :destroy
  
  validates :username, presence: true
  validates :username, uniqueness: {
    scope: :email,
    message: "should be unique with respect to email"
  }
  
end
