class PhotosController < ApplicationController
  def index
  end

  def new
    @photo = Photo.new
    @user = current_user
  end

  def create
    @user = current_user
    @photo = Photo.new(photo_params)
    if @photo.save
      @user.photos << @photo
      flash[:notice] = "Photo Uploaded"
      redirect_to user_path(@user)
    else
      render user_path(@user)
    end
  end

  def show
    @user = current_user
    @photo = Photo.find(params[:id])
  end

  def destroy
    @user = current_user
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to user_path(@user)
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :name)
  end
end
