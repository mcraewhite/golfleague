class Tee < ActiveRecord::Base
  belongs_to :teeset, dependent: :destroy
  belongs_to :hole, dependent: :destroy

  validates :par, numericality: { only_integer: true }
  validates :yards, numericality: { only_integer: true }
  validates :handicap, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 18 }
  validates :handicap, uniqueness: { scope: :teeset, message: "Each hole should have a different handicap." }
end
