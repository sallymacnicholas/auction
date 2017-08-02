require 'rails_helper'

RSpec.describe 'Unauthenticated User', :feature do
  before(:each) do
    create_user
    create_items
  end

  it 'can browse auction items on home page' do
    visit '/'

    click_on 'Browse Auction Items'

    expect(page).to have_content(Item.first.name)
    expect(page).to have_content(Item.last.name)
  end

  it 'can view item on show page' do
    visit browse_path

    click_on Item.first.name

    expect(current_path).to eq("/items/#{Item.first.id}")
  end

  def create_user
    User.create first_name: 'sally',
                last_name: 'awesome',
                email_address: 'sally@sally.com',
                password: 'password',
                password_confirmation: 'password'
  end

  def create_items
    10.times do
      Item.create name: Faker::Hipster.sentence(2),
                  description: Faker::Hipster.paragraph(2),
                  user_id: User.first.id,
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
  end
end
