class Holescore < ActiveRecord::Base
  belongs_to :hole, dependent: :destroy
  belongs_to :round, dependent: :destroy
end
