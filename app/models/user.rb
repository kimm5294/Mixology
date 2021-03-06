class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, presence: true, length: {minimum: 6}, confirmation: true
  validates :password_confirmation, presence: true

  has_secure_password

  has_many :drinks_users
  has_many :drinks, through: :drinks_users

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
