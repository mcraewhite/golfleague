class Hole < ActiveRecord::Base
  belongs_to :course, dependent: :destroy
  has_many :holescores
  has_many :rounds, through: :holescores

  validates :par, numericality: { only_integer: true }
  validates :yards, numericality: { only_integer: true }
  validates :handicap, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 18 }
  validates :number, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 18 }
  validates :handicap, uniqueness: { scope: :course, message: "Each hole should have a different handicap." }
  validates :number, uniqueness: { scope: :course, message: "Each hole should have a different number." }

end
