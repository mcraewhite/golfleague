class Round < ActiveRecord::Base
  belongs_to :course
  belongs_to :player
  has_many :holescores

  validates :course_handicap, numericality: { only_integer: true }
end
