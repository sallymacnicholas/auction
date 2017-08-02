module ItemHelper
  def editable(current_user, item, controller = nil)
    controller != 'home' && controller != 'admin/users' &&
      current_user && current_user.id == item.user_id ||
      admin?
  end

  def deletable(item)
    !item.archived
  end

  def unarchivable(item)
    admin? && item.archived
  end

  def item_liked?(item)
    current_user && (current_user.voted_for? item)
  end
end
