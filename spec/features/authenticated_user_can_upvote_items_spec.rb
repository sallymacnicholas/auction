require 'rails_helper'

RSpec.describe "Upvoting", :feature do
  before(:each) do
    user = User.create first_name: "sally",
      last_name: "awesome",
      email_address: "sally@sally.com",
      password: "password",
      password_confirmation: "password"

    Item.create name: Faker::Hipster.sentence(2),
      description: Faker::Hipster.paragraph(2),
      user_id: user.id
  end

  context "unauthenticated user" do
    it "cannot upvote if not logged in" do
      visit browse_path
      find(:css, '#upvote').click

      expect(page).to have_content("You must login to vote")
    end

  end

  context "authenticated user" do
    it "can upvote if logged in" do
      login_user

      visit browse_path

      within(".upvote-number") do
        expect(page).to have_content(0)
      end

      find(:css, '#upvote').click

      visit browse_path

      within(".upvote-number") do
        expect(page).to have_content(1)
      end
    end

    it "can only upvote an item once" do
      login_user

      visit browse_path

      find(:css, '#upvote').click

      visit browse_path

      within(".upvote-number") do
        expect(page).to have_content(1)
      end

      visit browse_path

      find(:css, '#upvote').click

      within(".upvote-number") do
        expect(page).to have_content(1)
      end
    end
  end

  def login_user
    visit "/"
    click_on "Sign up or Login"
    fill_in "Email address", with: "sally@sally.com"
    fill_in "Password", with: "password"
    within "#login-form" do
      click_on "Login"
    end
  end
end
