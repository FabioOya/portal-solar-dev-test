class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = PowerGenerator.all
  end

  def show
    @power_generator = PowerGenerator.find(params[:id])
  end

  def search
    @power_generators = PowerGenerator.search(params[:q])
  end
end
