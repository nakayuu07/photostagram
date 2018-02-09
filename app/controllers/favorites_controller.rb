class FavoritesController < ApplicationController


  def create
    @favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to picture_path(@favorite.picture)
  end

  def destroy
    @favorite = current_user.favorites.find_by(picture_id: params[:picture_id])
    @favorite.destroy
    redirect_to picture_path(@favorite.picture)
  end
end
