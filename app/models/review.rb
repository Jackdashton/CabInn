class Review < ApplicationRecord
  belongs_to :flat
  # validates :content, :value, :location, :cleanliness, presence: true
  validates :content, presence: true
  validates :location, presence: true
  validates :cleanliness, presence: true
  validates :value, presence: true
  validates :location, :value, :cleanliness, inclusion: { in: 1..5 }
  validates :location, :value, :cleanliness, numericality: { only_integer: true }
end
