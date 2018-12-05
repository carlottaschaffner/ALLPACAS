class AddAlpacaToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :alpaca, foreign_key: true
  end
end
