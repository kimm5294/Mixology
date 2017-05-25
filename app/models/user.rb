class User < ApplicationRecord
  validates :first_name
  validates :last_name
  validates :email
  validates :password

  has_secure_password

end
