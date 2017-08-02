class UpvotesController < ApplicationController
  before_action :authenticate_user, only: [:edit]

  def edit
    item = Item.find(params[:id])

    if params[:upvote] == 'true'
      item.liked_by current_user
    else
      item.unliked_by current_user
    end

    redirect_to :back
  end

  private

  def authenticate_user
    return if current_user
    flash[:notice] = 'You must login to vote'
    redirect_to browse_path
  end
end
