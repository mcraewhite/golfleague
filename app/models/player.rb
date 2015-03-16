class Player < ActiveRecord::Base
  has_many :rounds
  has_many :courses, through: :rounds
  has_many :playerleagues, dependent: :destroy
  has_many :leagues, through: :playerleagues
  belongs_to :user

end
