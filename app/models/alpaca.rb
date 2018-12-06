class Alpaca < ApplicationRecord
  has_many :bookings
  has_many :reviews, through: :bookings
  belongs_to :user
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
