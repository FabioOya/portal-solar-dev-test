class AdvancedSearchesController < ApplicationController
  def new
    @advanced_search = AdvancedSearch.new
    @structures = PowerGenerator.all.uniq.pluck(:structure_type).uniq
    @manufacturers = PowerGenerator.all.uniq.pluck(:manufacturer).uniq
  end

  def create 
    @advanced_search = AdvancedSearch.create(search_params)
    redirect_to @advanced_search
  end

  def show
    @advanced_search = AdvancedSearch.find(params[:id])
  end

  private

  def search_params
    params.require(:advanced_search).permit(:keywords, :structure_type, :manufacturer,
                                   :min_price, :max_price, :kwp)
  end
end