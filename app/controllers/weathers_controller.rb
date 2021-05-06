class WeathersController < ApplicationController
  def create
    @weather = Weather.create!(creation_params)
    render json: {
   "id": 1,
   "date": "1985-01-01",
   "location": {
       "lat": 35.1442,
       "lon": -111.6664,
       "city": "Flagstaff",
       "state": "Arizona"
   },
   "temperature": [
      28.5, 27.6, 26.7, 25.9, 25.3, 24.7,
      24.3, 24.0, 27.1, 34.0, 38.6, 41.3,
      43.2, 44.4, 45.0, 45.3, 45.1, 44.2,
      41.9, 38.0, 35.0, 33.0, 31.1, 29.9
   ]
}
  rescue
    head :bad_request
  end

  def index

  end

  def erase
    Weather.filter_and_erase(filter_params)
    head :ok
  end

  private

  def creation_params
    weather_params.merge(
      location: Location.find_or_create_by(weather_params[:location])
    )
  end

  def weather_params
    params.permit(
      :id,
      :date,
      :location,
      temperature: []
    )
  end

  def filter_params
    params.permit(
      :start,
      :end,
      :lat,
      :lon
    )
  end
end
