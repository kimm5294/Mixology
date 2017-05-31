class DrinksController < ApplicationController
  include DrinksHelper
  include AbsolutApiHelper

  def index
    @popular_drinks = most_popular_drinks
  end

  def show
    @drink = Drink.find_by(id: params[:id])
  end

  def search
    @results = search_name(params[:search])
  end

  def create

  end

  def display
    @drink = find_drink(params[:api])
  end

end
