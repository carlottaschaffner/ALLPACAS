class AlpacasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @alpacas = policy_scope(Alpaca).order(created_at: :desc)
    @flats = Flat.where.not(latitude: nil, longitude: nil)

    @markers = @flats.map do |flat|
      {
        lng: flat.longitude,
        lat: flat.latitude
      }
    end
  end

  def show
    @alpaca = Alpaca.find(params[:id])
    authorize @alpaca
    @booking = Booking.new
  end
end
