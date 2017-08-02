class Admin::ActiveListController < ApplicationController
  def index
    @active = Item.all.active.paginate(page: params[:page], per_page: 27)
  end
end

