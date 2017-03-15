class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    current_user
  end

  def validate_user!
    unless signed_in?
      redirect_to login_url,alert:'Bu sayfaya erişebilmek için otuurm açmalısınız.'
    end
  end

  def validate_permission!(user)
    unless current_user == user
      redirect_to root_url,alert: "bu işlemi gerçekleştiremezsiniz."
    end
  end

  def login(user)
    session[:user_id] = user.id
  end

  helper_method :signed_in?, :current_user
end
