class FilterWeathers
  include Interactor

  def call
    context.weathers = Weather.joins(:location).where filters
    context.fail! if filters.any? && context.weathers.empty?
  end

  def filters
    return @filters if @filters.present?

    date_range = context.start.to_date..context.end.to_date if context.start && context.end
    @filters = {
      date: date_range || context.date,
      locations: {
        lat: context.lat,
        lon: context.lon
      }
    }.recursive_compact
  end
end
