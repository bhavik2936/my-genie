class Wish < ApplicationRecord
  belongs_to :user

  validates :wish_statement, presence: true
end
