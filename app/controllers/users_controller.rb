class UsersController < ApplicationController
  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      flash[:notice] = "Logged in as #{@user.first_name} #{@user.last_name}"
    else
      flash[:error] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @upvoted = current_user.get_voted Item
    session[:last_dashboard_page] = request.env['HTTP_REFERER'] ||
                                    user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email_address,
                                 :password,
                                 :password_confirmation)
  end
end
