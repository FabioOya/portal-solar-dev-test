class FreightsController < ApplicationController
  require 'correios-cep'
  require 'geocoder'

  def show
    @freight = Freight.find(params[:id])
    finder = Correios::CEP::AddressFinder.new
    destiny_adress = finder.get(Freight.state)
    city = adress.to_a[2][1]
    destiny_geolocation = Geocoder.search(city)
    destiny_coordinates = destiny_geolocation.first.coordinates
  end
  
  def new
    @freight = Freight.new
    @power_generators = PowerGenerator.all
  end
  
  def create
    @freight = Freight.new(params.require(:freight).permit(:state))
    @freight.save
    if @freight.save
      redirect_to @freight
    else
      render :new
    end
  end
end