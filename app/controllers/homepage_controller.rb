class HomepageController < ApplicationController
  include HomepageHelper

  def index
    @popular_drinks = most_popular_drinks
  end
end
