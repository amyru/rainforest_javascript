class SessionsController < ApplicationController
  def new
  end

  def create #capturing the password and matching it to the user.
  	user = User.find_by(email: params[:email]) #.find only looks up id's so you need find by email to find by a string
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id #this logs us in
      redirect_to products_url, notice: "Logged in!"
    else
    	flash.now[:alert] = "invalid email or password"
      render "new"
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to products_url, notice: "Logged out"
  end
end
