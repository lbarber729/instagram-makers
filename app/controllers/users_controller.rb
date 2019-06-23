class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(signup_params)

    if @user.valid?
    @user.save
    session[:user_id] = @user.id
    flash[:success] = "Welcome to Instagram!"

  else
    render :new
  end
  end

  private
  def signup_params
    params.require(:user).permit(:username, :email, :password)
  end
end
