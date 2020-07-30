class Freight < ApplicationRecord
  require 'correios-cep'
  require 'geocoder'
  
  belongs_to :power_generator
  validates :state, presence: true
  #geocoded_by :address
  #after_validation :geocode

  # def address
  #   finder = Correios::CEP::AddressFinder.new
  #   complete_address = finder.get(state)
  #   address = complete_address.to_a[4][1]
  # end
  
  def find_freight_cost(power_generator, state)
    if power_generator.weight > power_generator.calculate_cubed_weight
      @freight = Freight.find_by('state = ? AND (weight_min <= ? AND weight_max >= ?)',
                                  state, power_generator.weight, power_generator.weight) 
    else
      @freight = Freight.find_by('state = ? AND (weight_min <= ? AND weight_max >= ?)', 
                                  state, power_generator.cubed_weight, power_generator.cubed_weight)
    end
  end
end
