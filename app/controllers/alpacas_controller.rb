class AlpacasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @alpacas = policy_scope(Alpaca).order(created_at: :desc)
  end

  def show
    @alpaca = Alpaca.find(params[:id])
    authorize @alpaca
    @booking = Booking.new
  end

  def alpaca_params
    params.require(:alpaca).permit(:name, :color, :age, :price, :photo)
  end
end
