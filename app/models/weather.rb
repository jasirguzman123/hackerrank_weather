class Weather < ApplicationRecord
  belongs_to :location

  validates :date, :temperature, presence: true 
  validates :id, uniqueness: true

  scope :in_date_range, ->(start_date, end_date) { where('date BETWEEN ? AND ?', start_date, end_date) }

  def self.filter_and_erase(filters: {})
    location = Location.find_by(filters.slice(:lat, :lon))
    weathers = (location&.weathers || all)
    date_filterable = filters[:start].present? && filters[:end].present?
    weathers = weathers.in_date_range(filters[:start], filters[:end]) if date_filterable
    weathers.destroy_all
  end
end
