class FreightsController < ApplicationController
  require 'correios-cep'

  def show
    @freight = Freight.find(params[:id])
    @power_generator = PowerGenerator.find(params[:power_generator_id])
  end
  
  def new
    @freight = Freight.new
    @power_generators = PowerGenerator.all
    @power_generator = PowerGenerator.find(params[:power_generator_id])
  end
  
  def create
    @power_generator = PowerGenerator.find(params[:power_generator_id])
    @freight = Freight.new(params.require(:freight).permit(:state, :power_generator_id))
   # @freight.state = @freight.address
    @freight.power_generator_id = @power_generator.id
    if @freight.save
      redirect_to power_generator_freight_path(@power_generator, @freight)
    else
      render :new
    end
  end

  def get_freight
    @power_generator = PowerGenerator.find(params[:power_generator_id])
    @power_generator.calculate_cubed_weight
    finder = Correios::CEP::AddressFinder.new
    complete_address = finder.get(state)
    @freight.state = complete_address[4][1]
    #binding.pry
    @freight = Freight.new.find_freight_cost(@power_generator, @freight.state)
    render :show
  end

  private

  def freight_params
    params.require(:freight).permit(:state, :weight_min, :weight_max, :cost,
                                    :longitude, :latitude, :power_generator_id)
  end

end

