json.array!(@states) do |state|
  json.extract! state, :id, :name, :abvr
  json.url state_url(state, format: :json)
end
