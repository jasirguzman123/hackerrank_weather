class WeathersController < ApplicationController
  before_action :set_json_format
  before_action :set_weathers, only: %i[index erase]

  def create
    @weather = location.weathers.create!(weather_params)
    render :create, status: :created
  rescue StandardError
    render json: {}, status: :bad_request
  end

  def index
    status = @result.success? && :ok || :not_found
    render :index, status: status
  end

  def erase
    @weathers.delete_all
    head :ok
  end

  private

  def set_weathers
    @result = FilterWeathers.call(filter_params)

    @weathers = @result.weathers
  end

  def location
    @location ||= Location.find_or_create_by(location_params)
  end

  def location_params
    params.require(:location).permit(:lat, :lon, :city, :state)
  end

  def weather_params
    params.permit(:id, :date, temperature: [])
  end

  def filter_params
    params.permit(:date, :start, :end, :lat, :lon)
  end

  def set_json_format
    request.format = :json
  end
end
