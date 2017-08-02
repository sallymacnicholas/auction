# admin dashboard
class Admin::DashboardController < ApplicationController
  before_action :authorize_admin
  def index
    @active = Item.all.active.paginate(page: params[:page])
    @archived = Item.all.archived.paginate(page: params[:page])
  end
end
