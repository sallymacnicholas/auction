class ItemsController < ApplicationController
  before_action :set_item, except: %i[new create]
  before_action :authorize_user, except: %i[new create show]

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.create(item_params)

    if @item.save
      redirect_to dashboard_path(current_user)
      flash[:notice] = 'You successfully added an item.'
    else
      flash.now[:error] = @item.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    return archive_item(@item) if params.include?('archive')

    @item.update(item_params)
    if @item.save
      redirect_to dashboard_path(current_user)
      flash[:notice] = 'You successfully updated #{@item.name}.'
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to dashboard_path(current_user)
      flash[:notice] = 'Auction item deleted'
    else
      flash.now[:notice] = 'Sorry, try again.'
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,
                                 :description,
                                 :image,
                                 :retail_value,
                                 :delivery,
                                 :contact_name,
                                 :business_name,
                                 :address,
                                 :city,
                                 :state,
                                 :zip,
                                 :email,
                                 :phone)
  end

  def archive_item(item)
    item.update_attribute(:archived, true)
    redirect_to dashboard_path(current_user)
  end

  def authorize_user
    return if current_user.id == @item.user.id
    redirect_to dashboard_path(current_user)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
