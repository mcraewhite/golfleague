class Round < ActiveRecord::Base
  has_one :course
  belongs_to :player
end
