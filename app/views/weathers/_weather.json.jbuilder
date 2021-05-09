json.id weather.id
json.date weather.date
json.location do
  json.partial! 'location', location: weather.location
end
json.temperature weather.temperature.map(&:to_f)
