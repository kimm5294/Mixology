module ApplicationHelper
  def logged_in?
    return true if session[:current_user_id]
    false
  end

  def require_login
    if !logged_in?
      flash[:error] = "This page requires a login"
      redirect_to '/sessions/new'
    end
  end

  def current_user
    User.find_by_id(session[:current_user_id])
  end
end
