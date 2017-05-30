class DrinksController < ApplicationController
  include DrinksHelper

  def index
    @popular_drinks = most_popular_drinks
  end

  def show
    @drink = Drink.find_by(id: params[:id])
  end

  def create

  end
end
