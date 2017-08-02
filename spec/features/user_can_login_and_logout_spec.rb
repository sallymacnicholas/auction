require 'rails_helper'

RSpec.describe 'Authenticated User', :feature do
  before(:each) do
    User.create first_name: 'sally',
                last_name: 'mac',
                email_address: 'sally@sally.com',
                password: 'password',
                password_confirmation: 'password'
  end

  it 'can login' do
    visit '/'
    click_on 'Donate Items to the Auction'
    fill_in 'Email address', with: 'sally@sally.com'
    fill_in 'Password', with: 'password'
    within '#login-form' do
      click_on 'Login'
    end

    expect(page).to have_content('Hi, Sally')
    expect(page).to have_content("You haven't added any donations yet")
  end

  it 'can logout' do
    visit '/'
    click_on 'Donate Items to the Auction'
    fill_in 'Email address', with: 'sally@sally.com'
    fill_in 'Password', with: 'password'
    within '#login-form' do
      click_on 'Login'
    end

    expect(page).to have_content('Logout')

    within '#nav-mobile' do
      click_on 'Logout'
    end
    expect(current_path).to eq(root_path)
  end
end
