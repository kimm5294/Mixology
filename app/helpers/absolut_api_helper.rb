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
    puts drink
    return {
      name: drink["name"],
      desc: drink["descriptionPlain"],
      story: drink["story"],
      rating: drink["rating"],
      skill: drink["skill"],
      video: "http://assets.absolutdrinks.com/videos/" + drink["videos"].last["video"],
      alcoholic: drink["isAlcoholic"],
      hot: drink["isHot"],
      glass: drink["servedIn"],
      ingredients: drink["ingredients"],
      tastes: drink["tastes"],
      tools: drink["tools"],
      types: drink["drinkTypes"],
      id: drink["id"]
    }
  end
end