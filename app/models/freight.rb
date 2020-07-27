class Freight < ApplicationRecord
  belongs_to :power_generator
  validates :state, :weight_min, :weight_max, :cost, presence: true

  def find_destination_geolocation
  end

  def origin_geolocation
  end

  def distance_diference_geolocation
  end
end
