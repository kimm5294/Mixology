require 'net/http'

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
    hash = {
      name: drink["name"],
      desc: drink["descriptionPlain"].split(". "),
      story: drink["story"],
      rating: drink["rating"],
      skill: drink["skill"],
      alcoholic: drink["isAlcoholic"],
      hot: drink["isHot"],
      glass: drink["servedIn"],
      ingredients: ingredients(drink),
      tastes: drink["tastes"],
      tools: drink["tools"],
      types: drink["drinkTypes"],
      id: drink["id"]
    }
    if drink["videos"].last
      hash[:video] = "http://assets.absolutdrinks.com/videos/" + drink["videos"].last["video"]
    end
    return hash
  end

  def ingredients(response)
    response["ingredients"].map do |ingredient|
      ingredient["textPlain"]
    end
  end
end