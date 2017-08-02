require 'rails_helper'

RSpec.describe 'Authenticated User', :feature do
  before(:each) do
    @user = User.create first_name: 'sally',
                        last_name: 'mac',
                        email_address: 'sally@sally.com',
                        password: 'password',
                        password_confirmation: 'password'

    @user2 = User.create first_name: 'jack',
                         last_name: 'black',
                         email_address: 'jack@jack.com',
                         password: 'password',
                         password_confirmation: 'password'

    Item.create name: 'Item 2',
                description: 'Item 2 description',
                user_id: @user2.id,
                email: Faker::Internet.email,
                business_name: Faker::Company.name,
                address: Faker::Address.street_address,
                city: Faker::Address.city,
                state: Faker::Address.state,
                zip: Faker::Address.zip,
                phone: Faker::PhoneNumber.phone_number,
                contact_name: Faker::Name.name,
                retail_value: rand(0..1000),
                delivery: Faker::Boolean.boolean
  end

  it 'can view items they have added on dashboard page' do
    visit '/'
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit dashboard_path(@user)
    click_on 'Add an Auction Item'
    fill_in 'Name', with: 'something cool'
    fill_in 'Description', with: 'something really cool that you should want'
    fill_in 'Business name', with: 'A business'
    fill_in 'Contact name', with: 'Contact Name'
    fill_in 'Address', with: '123 Sesame St'
    fill_in 'City', with: 'Denver'
    fill_in 'State', with: 'CO'
    fill_in 'Zip', with: '80202'
    fill_in 'Phone', with: '1234561111'
    fill_in 'Email', with: 'hello@example.com'
    fill_in 'Retail value', with: 100
    click_on 'Add Donation'

    visit dashboard_path(@user)

    expect(page).to have_content('something cool')
    expect(page).to_not have_content('Item 2')
    expect(page).to_not have_content('Item 2 description')
  end

end
