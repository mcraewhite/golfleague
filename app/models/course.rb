class Course < ActiveRecord::Base
  has_many :holes, dependent: :destroy
  has_many :rounds, dependent: :destroy
  has_many :players, through: :rounds
  has_many :teesets, dependent: :destroy
  has_many :tees, through: :holes

  accepts_nested_attributes_for :holes
  accepts_nested_attributes_for :teesets
  accepts_nested_attributes_for :tees

  #validates :num_holes, inclusion: { in: [9, 18], message: "A course must have 9 or 18 holes." }
  
end
