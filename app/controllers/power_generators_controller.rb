class PowerGeneratorsController < ApplicationController
  require 'correios-frete'

  def index
    @power_generators = PowerGenerator.all
  end

  def show
    @power_generator = PowerGenerator.find(params[:id])
    # @freight = Freight.new
    # @frete = Correios::Frete::Calculador.new(:cep_origem => "04094-050",
    # :cep_destino => @freight.state,
    # :valor_declarado => @power_generator.price,
    # :peso => @power_generator.weight,
    # :comprimento => @power_generator.lenght,
    # :largura => @power_generator.width,
    # :altura => @power_generator.height)
  end

  def search
    @power_generators = PowerGenerator.search(params[:q])
  end
end
