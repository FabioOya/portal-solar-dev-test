class Freight < ApplicationRecord
  belongs_to :power_generator
  validates :state, :weight_min, :weight_max, :cost, presence: true
end
