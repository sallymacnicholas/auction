# This class handles all the active items in the admin dashboard
class Admin::ActiveController < ApplicationController
  def index
    @active = Item.all.active.paginate(page: params[:page], per_page: 27)
  end
end
