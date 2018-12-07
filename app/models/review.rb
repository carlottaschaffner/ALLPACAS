class Review < ApplicationRecord
  belongs_to :booking, optional: true
  has_one :user, through: :booking

  validates :booking, :title, :description, :rating, presence: true
end
