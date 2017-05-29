module ApplicationHelper
  def logged_in?
    return true if session[:current_user_id]
    false
  end

  def current_user
    User.find_by_id(session[:current_user_id])
  end
end
