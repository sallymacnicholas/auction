# handles search for items in admin dashboard
class Admin::SearchController < ApplicationController
  def index
    @items = Item.all
  end
end
