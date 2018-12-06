class AlpacasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @alpacas = policy_scope(Alpaca).order(created_at: :desc)
  end

  def show
    @alpaca = Alpaca.find(params[:id])
    authorize @alpaca
    @booking = Booking.new

    # @geolocated_alpaca = Alpaca.where.not(latitude: nil, longitude: nil)
    @markers = [{
            lng: @alpaca.longitude,
            lat: @alpaca.latitude
            # infoWindow: { content: render_to_string(partial: "/alpacas/map_window", locals: { flat: flat }) }
        }]
  end
end
