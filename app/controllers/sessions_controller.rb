class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(user_params[:username],user_params[:password])
    if @user
      login(@user)
      redirect_to subs_url
    else
      flash[:errors] = ['Invalid credentials']
      render :new
    end

  end

  def destroy
    logout
    redirect_to new_session_url
  end

  def user_params
    params.require(:user).permit(:username,:password)
  end
end
