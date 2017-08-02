require 'rails_helper'

RSpec.describe 'Unauthenticated User', :feature do
  it 'can sign up and create an account' do
    visit '/'
    click_on 'Donate Items to the Auction'
    click_on 'Sign up here'
    fill_in 'First name', with: 'Sally'
    fill_in 'Last name', with: 'Mac'
    fill_in 'Email address', with: 'sally@sally.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Create Account'

    expect(page).to have_content('Hi, Sally')
  end
end
