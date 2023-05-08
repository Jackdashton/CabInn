class User < ApplicationRecord
  has_many :flats, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :avatar, presence: true

  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # method required for home view page
  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "150x150!").processed
    else
    end
  end
end
