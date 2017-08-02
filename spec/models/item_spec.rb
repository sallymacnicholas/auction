require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to(:user) }

  it 'can track its votes' do
    user = User.create first_name: 'sally',
                       last_name: 'awesome',
                       email_address: 'sally@sally.com',
                       password: 'password',
                       password_confirmation: 'password'

    item = Item.create name: Faker::Hipster.sentence(2),
                       description: Faker::Hipster.paragraph(2),
                       user_id: user.id,
                       business_name: 'A Business',
                       contact_name: 'Contact Name',
                       address: '123 Sesame St',
                       city: 'Denver',
                       state: 'CO',
                       zip: '80202',
                       phone: '1234561111',
                       email: 'hello@example.com',
                       retail_value: 100,
                       delivery: true

    expect(item.votes_for.size).to eq(0)

    item.liked_by user

    item.reload

    expect(item.votes_for.size).to eq(1)
  end
end
