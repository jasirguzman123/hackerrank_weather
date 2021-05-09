json.array! @weathers do |weather|
  json.partial! weather, as: :weather
end
