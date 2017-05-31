class DrinksController < ApplicationController
  include AbsolutApiHelper

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
