class League < ActiveRecord::Base
  has_many :playerleagues, dependent: :destroy
  has_many :players, through: :playerleagues
  
end
