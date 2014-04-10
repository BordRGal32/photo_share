class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_name(sessions_params[:name])
    if user && user.authenticate(sessions_params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in!"
      redirect_to user_path(user)
    else
      flash[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to users_path
  end

  private

  def sessions_params
    params.permit(:name, :password)
  end
end
