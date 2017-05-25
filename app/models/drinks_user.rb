class DrinksUser < ApplicationRecord
  validates :user_id, presence: true
  validates :drink_id, presence: true

  belongs_to :user
  belongs_to :drink
end
