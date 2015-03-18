class Course < ActiveRecord::Base
  has_many :holes, dependent: :destroy
  has_many :rounds, dependent: :destroy
  has_many :players, through: :rounds

  accepts_nested_attributes_for :holes
  
end
