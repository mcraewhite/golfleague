class League < ActiveRecord::Base
  has_many :playerleagues
  has_many :players, through: :playerleagues

  validates :name, presence: true
  
end
