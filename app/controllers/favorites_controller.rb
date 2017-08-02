class FavoritesController < ApplicationController
  before_action :authenticate_user
  def new; end

  def create
    @item = Item.find(params[:id])
    if favorited?(@item)
      render :back
    else
      @fave = current_user.favorites.create(item_id: @item.id)
    end

    return unless @fave.save
    flash[:success] = 'Successfully saved item'
    redirect_to browse_path
  end

  def destroy
    f = Favorite.where(user_id: current_user.id,
                       item_id: Item.find(params[:id])).first
    f.destroy
    redirect_to browse_path
  end

  private

  def authenticate_user
    return unless current_user
    flash[:notice] = 'You must login to favorite'
    redirect_to browse_path
  end

  def favorited?(item)
    fave = Favorite.where(user_id: current_user.id, item_id: Item.find(item.id))
    fave.any?
  end
end
