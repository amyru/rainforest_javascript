class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id] # if there is a coockie set up for this do that otherwise log in
  end #if no one is logged in return nil

  helper_method :current_user #tells rails to also use this as a helper method to be available in views

  def ensure_logged_in
  	unless current_user
  		flash[:alert] = "Please log in"
  		redirect_to new_session_path
  	end
  end
end
