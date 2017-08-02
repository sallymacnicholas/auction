class User < ApplicationRecord
  validates_presence_of :first_name,
                        :last_name,
                        :password,
                        :password_confirmation
  validates :email_address, presence: true, uniqueness: true

  has_secure_password
  has_many :items
  has_many :favorites
  enum role: %w[default admin]

  acts_as_voter

  self.per_page = 50

  before_validation do |user|
    user.strip_whitespace :email
  end

  def strip_whitespace(*columns)
    columns.each do |column|
      value = read_attribute(column)
      write_attribute(column, value.strip) if value.present?
    end
  end
end
