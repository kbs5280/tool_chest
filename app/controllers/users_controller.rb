class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      # if the user doesn't save rerender the new view
    end
  end

  def show
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
