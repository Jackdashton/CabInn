class Flat < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :user

  has_one_attached :photo

  validates :name, :address, :description, :guest_num, :price_per_night, presence: true
  validates :guest_num, inclusion: { in: 1..30 }
  validates :price_per_night, inclusion: { in: 1..20_000 }
  validates :description, length: { maximum: 500 }
end
