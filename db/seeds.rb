class Seed
  def self.run
    User.create first_name: 'Jack',
                last_name: 'Yeh',
                email_address: 'jack@yeh.com',
                password: 'password',
                password_confirmation: 'password',
                role: 0
    User.create first_name: 'admin',
                last_name: 'admin',
                email_address: 'admin@admin.com',
                password: 'password',
                password_confirmation: 'password',
                role: 1

    create_default_users

    100.times do
      Item.create name: Faker::Commerce.product_name,
                  description: Faker::Hipster.paragraph(2),
                  user_id: rand(1..100),
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

  def self.create_default_users
    100.times do
      User.create first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  email_address: Faker::Internet.email,
                  password: 'password',
                  password_confirmation: 'password',
                  role: 0
    end
  end
end

Seed.run
