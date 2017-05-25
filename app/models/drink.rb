class Drink < ApplicationRecord
  validates :name, presence: true
  validates :api_id, presence: true, uniqueness: true

  has_many :drinks_users
  has_many :users, through: :drinks_users
end
