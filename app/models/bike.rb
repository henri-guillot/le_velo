class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  # validates :name, presence: true
  # validates :style, presence: true, length: { minimum: 6 }
  # validates :short_description, presence: true, length: { minimum: 5 }
  # validates :long_description, presence: true, length: { minimum: 20 }
  # validates :price_per_day, presence: true, numericality: true
end
