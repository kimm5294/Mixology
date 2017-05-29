class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render "new"
    end
  end

  def show
    @user = User.find_by(id: current_user.id) if logged_in?
  end

end
