class AlpacasController < ApplicationController

  def index
    # @alpacas = Alpaca.all
    @alpacas = policy_scope(Alpaca).order(created_at: :desc)
  end

  def show
    @alpaca = Alpaca.find(params[:id])
    authorize @alpaca
  end
end
