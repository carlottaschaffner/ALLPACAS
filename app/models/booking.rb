class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :alpaca
  has_one :review

  validates :start_date, :end_date, :user, :alpaca, presence: true
end
