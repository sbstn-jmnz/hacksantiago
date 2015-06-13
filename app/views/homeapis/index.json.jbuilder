json.array!(@homeapis) do |homeapi|
  json.extract! homeapi, :id
  json.url homeapi_url(homeapi, format: :json)
end
