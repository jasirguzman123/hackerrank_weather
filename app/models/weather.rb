class Weather < ApplicationRecord
  serialize :temperature, Array

  belongs_to :location

  validates :date, :temperature, presence: true
  validates :id, uniqueness: true
end
