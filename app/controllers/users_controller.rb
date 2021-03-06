class UsersController < ApplicationController
#before_filter :authorize, only: [:update, :show, :edit, :destroy]
  def index
    @user = current_user
  end

  def new
    @user = User.new
    @photo = Photo.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up!"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
    @photo = Photo.new
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User has been updated"
      redirect_to user_path(@user)
    else
      edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    session[:user_id] = nil
    @user.destroy
    flash[:notice] = "User Account Deleted"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :avatar)
  end
end
