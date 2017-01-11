class User < ApplicationRecord
  validates_presence_of :first_name,
                        :last_name,
                        :password,
                        :password_confirmation
  validates :email_address, presence: true, uniqueness: true
  has_secure_password
  has_many :items
  has_many :favorites

  acts_as_voter
end
