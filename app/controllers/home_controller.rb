class HomeController < ApplicationController
  def show; end

  def index
    @items = Item.active.paginate(page: params[:page])
  end
end
