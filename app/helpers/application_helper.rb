module ApplicationHelper
  def logged_in?
    if session[:current_user_id]
      return true
    end
    false
  end

  def current_user
    User.find_by_id(session[:current_user_id])
  end
end
