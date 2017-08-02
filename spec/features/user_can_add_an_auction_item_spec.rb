require 'rails_helper'

RSpec.describe 'Authenticated User', :feature do
  before(:each) do
    user = User.create first_name: 'sally',
                       last_name: 'mac',
                       email_address: 'sally@sally.com',
                       password: 'password',
                       password_confirmation: 'password'
  end

  it 'can add an auction item from dashboard page' do
    visit '/'
    click_on 'Donate Items to the Auction'
    fill_in 'Email address', with: 'sally@sally.com'
    fill_in 'Password', with: 'password'
    within '#login-form' do
      click_on 'Login'
    end

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

    expect(current_path).to eq(dashboard_path(User.first))
    expect(page).to have_content('You successfully added an item.')
    expect(page).to have_content('something cool')
  end

end
