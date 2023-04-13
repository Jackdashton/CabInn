class Flat < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :user

  # Geocoder
  geocoded_by :address # tells gem that column to be geocoded is address.
  after_validation :geocode, if: :will_save_change_to_address?
  # geocode method after every validation, geocode method translates
  # if only update name, only trigger geocode if change saved to the address.

  has_many_attached :photos

  validates :name, :address, :description, :guest_num, :price_per_night, :photos, presence: true
  validates :guest_num, inclusion: { in: 1..30 }
  validates :price_per_night, inclusion: { in: 1..20_000 }
  validates :description, length: { maximum: 500 }
end
