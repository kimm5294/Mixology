module AbsolutApiHelper
  def search_name(query)
    uri = URI.parse("http://addb.absolutdrinks.com/quickSearch/drinks/#{query.gsub(" ", "%20")}/?apiKey=#{ENV['ABSOLUT_KEY']}")
    response = Net::HTTP.get_response(uri)
    body = JSON.parse(response.body)
    return body["result"]
  end

  def find_drink(api_id)
    uri = URI.parse("http://addb.absolutdrinks.com/drinks/#{api_id}/?apiKey=#{ENV['ABSOLUT_KEY']}")
    response = Net::HTTP.get_response(uri)
    body = JSON.parse(response.body)
    drink = body["result"].first
    return {
      name: drink["name"],

    }
  end
end