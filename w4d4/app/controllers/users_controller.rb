class UsersController < ApplicationController
  before_action :require_logged_in, only: [:new]

  def new
    render :new #sign up
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end