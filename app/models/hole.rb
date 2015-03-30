class Hole < ActiveRecord::Base
  belongs_to :course, dependent: :destroy
  has_many :holescores
  has_many :rounds, through: :holescores
  has_many :tees
  has_many :teesets, through: :tees

  validates :number, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 18 }
  validates :number, uniqueness: { scope: :course, message: "Each hole should have a different number." }

  accepts_nested_attributes_for :tees

end
