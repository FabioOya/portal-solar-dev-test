class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = PowerGenerator.all
  end

  def search
    @power_generators = PowerGenerator.search(params[:q])
    #render
  end
end
