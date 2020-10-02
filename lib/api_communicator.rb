def get_quotes
    response_string = RestClient.get("https://type.fit/api/quotes")
    response_hash = JSON.parse(response_string)
end


