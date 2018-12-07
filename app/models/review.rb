class Review < ApplicationRecord
  belongs_to :booking, optional: true
  has_one :user, through: :booking

  validates :booking, presence: true
end
