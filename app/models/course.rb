class Course < ActiveRecord::Base
  has_many :holes
  belongs_to :round
end
