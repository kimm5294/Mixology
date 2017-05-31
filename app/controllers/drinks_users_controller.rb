class DrinksUsersController < ApplicationController
  include ApplicationHelper

  def create
    drink = Drink.find_or_create_by(api_code: params[:code], name: params[:name])
    DrinksUser.create(user_id: current_user.id, drink_id: drink.id)
    redirect_to '/'
  end

  def destroy

  end
end
