class BookingsController < ApplicationController
  before_action :find_alpaca

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking

    @booking.user = current_user
    @booking.alpaca = @alpaca
    # raise
    if @booking.save
      redirect_to alpaca_path(@alpaca)
    else
      render :new
    end
  end

  private

  def find_alpaca
    @alpaca = Alpaca.find(params[:alpaca_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
