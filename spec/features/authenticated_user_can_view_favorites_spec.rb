require 'rails_helper'

RSpec.describe 'Authenticated User', :feature do
  # before(:each) do
    # @user = User.create first_name: 'sally',
                        # last_name: 'mac',
                        # email_address: 'sally@sally.com',
                        # password: 'password',
                        # password_confirmation: 'password'

    # @user2 = User.create first_name: 'jack',
                         # last_name: 'black',
                         # email_address: 'jack@jack.com',
                         # password: 'password',
                         # password_confirmation: 'password'

    # item = Item.create name: 'Item 2',
                       # description: 'Item 2 description',
                       # user_id: @user2.id

    # @favorite = Favorite.create user_id: @user.id, item_id: item.id

    # @favorite2 = Favorite.create user_id: @user2.id, item_id: item.id
  # end

  # it 'can favorite items when logged in' do
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    # visit favorites_path(@user)

    # expect(page).to have_content(Item.find(@favorite.item_id).name)
    # expect(page).to_not have_content(Item.find(@favorite2.item_id).name)
  # end
end
