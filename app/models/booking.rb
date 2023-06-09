class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  validates :user, :flat, presence: true
  validates :arrival, :departure, presence: true
end
