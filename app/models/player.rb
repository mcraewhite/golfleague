class Player < ActiveRecord::Base
  has_many :rounds
  has_many :courses, through: :rounds
  has_many :playerleagues
  has_many :leagues, through: :playerleagues

end
