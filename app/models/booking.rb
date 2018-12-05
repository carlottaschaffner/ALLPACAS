class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :alpaca
  has_many :reviews

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user, presence: true
  validates :alpaca, presence: true
end
