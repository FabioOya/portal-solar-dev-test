class Freight < ApplicationRecord
  belongs_to :power_generator
  validates :state, :weight_min, :weight_max, :cost, presence: true
  geocoded_by :address
  after_validation :geocode


  def find_destination_geolocation
  end

  def origin_geolocation
    
  end

  def distance_diference_geolocation
  end

end
