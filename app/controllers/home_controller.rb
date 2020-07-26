class HomeController < ApplicationController
  def index
    @power_generators = PowerGenerator.all
  end

  def search
    @power_generators = PowerGenerator.search(params[:q])
    #render root_path
  end
end
