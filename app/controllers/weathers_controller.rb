class WeathersController < ApplicationController
  def create
    weather = Weather.create!(creation_params)
    byebug
    render json: weather.to_json, status: :ok
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
