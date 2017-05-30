class UsersController < ApplicationController
  include ApplicationHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render "new"
    end
  end

  def show
    if logged_in?
      @user = User.find_by(id: current_user.id)
      render "show"
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
