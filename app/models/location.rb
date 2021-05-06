class Location < ApplicationRecord
  has_many :weathers, dependent: :destroy

  validates :lat, :lon, :city, :state, presence: true
end
