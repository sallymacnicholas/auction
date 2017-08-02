# Archived items for admin dashboard
class Admin::ArchivedController < ApplicationController
  def index
    @archived = Item.all.archived.paginate(page: params[:page])
  end
end
