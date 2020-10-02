def get_data_from_api_quotes
    response_string = RestClient.get("gttps://type.fit/api/quotes")

    response_hash = JSON.parse(response_string)
end
