class Group < ActiveRecord::Base
  has_many :rounds
  has_many :holescores, through: :rounds
  has_many :players, through: :rounds

  accepts_nested_attributes_for :rounds
  accepts_nested_attributes_for :holescores
  
end
