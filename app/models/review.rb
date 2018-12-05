class Review < ApplicationRecord
  belongs_to :booking
  # belongs_to :alpaca, through: :bookings
  # belongs_to :user, through: :bookings
end
