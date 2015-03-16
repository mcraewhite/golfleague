class User < ActiveRecord::Base
  has_secure_password
  has_one :player

  accepts_nested_attributes_for :player, :allow_destroy => true

  validates :email, presence: true
  validates_uniqueness_of :email
end
