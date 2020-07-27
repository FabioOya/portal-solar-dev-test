class FreightsController < ApplicationController
  require 'correios-frete'

  def show
    @freight = Freight.find(params[:id])
  end

  def new
    @freight = Freight.new
    @power_generators = PowerGenerator.all
    #@power_generator = PowerGenerator.find(params[:id])
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