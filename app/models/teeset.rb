class Teeset < ActiveRecord::Base
  belongs_to :course, dependent: :destroy
  has_many :tees
end
