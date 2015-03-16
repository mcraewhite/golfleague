class League < ActiveRecord::Base
  has_many :playerleagues
  has_many :players, through: :playerleagues
  has_many :rounds, through: :players

  validates :name, presence: true
  
end
