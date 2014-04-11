class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
  end

  def create
    @tag = Tag.create(tags_parameters)
    redirect_to user_path(current_user)
  end

  def destroy
  end

  def tags_parameters
    params.require(:tag).permit(:photo_id, :user_id)
  end
end
