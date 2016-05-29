json.array!(@plates) do |plate|
  json.extract! plate, :id, :state, :plate, :turning, :turning, :speed, :speed, :merging, :merging, :parking, :parking, :general, :general
  json.url plate_url(plate, format: :json)
end
