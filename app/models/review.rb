class Review < ApplicationRecord
  belongs_to :booking
  has_one :user, through: :booking

  validates :booking, presence: true
end
