class AlpacasController < ApplicationController

  def index
    @alpacas = Alpaca.all
    authorize @alpacas
  end

  def show
    @alpaca = Alpaca.find(params[:id])
    authorize @alpaca
  end
end
