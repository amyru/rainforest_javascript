class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Signed up" # sinonymous to :notice = "Signed up"
      session[:user_id] = @user.id #to also log in after we have signed up
      redirect_to products_url
    else
      flash.now[:alert] = "oh, something bad happened."
      render "new"
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
