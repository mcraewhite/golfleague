class Round < ActiveRecord::Base
  belongs_to :course
  belongs_to :player
  belongs_to :league
  belongs_to :group
  has_many :holescores
  has_many :holes, through: :holescores
  has_many :tees, through: :holescores

  accepts_nested_attributes_for :holescores

  validates :course_handicap, numericality: { only_integer: true }
end
