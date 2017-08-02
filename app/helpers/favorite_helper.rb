module FavoriteHelper
  def favorited?(current_user, item)
    f = Favorite.where(user_id: current_user, item_id: item.id)
    !f.empty?
  end
end
