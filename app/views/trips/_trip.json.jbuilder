json.id trip.id
json.status trip.status
json.info trip.info
json.locations do
  json.array! @trip.locations, partial: 'trips/location', as: :location
end