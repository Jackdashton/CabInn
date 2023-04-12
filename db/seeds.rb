# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require 'faker'

puts "cleaning DB"
Flat.destroy_all

puts 'Creating 2 properties...'
20.times do
  flat = Flat.new(
    name:    "#{Faker::Books::TheKingkillerChronicle.location} Cabin",
    address: Faker::Address.full_address,
    description: "A #{Faker::Adjective.positive} Cabin with #{Faker::Adjective.positive} views of #{Faker::Fantasy::Tolkien.location}",
    guest_num:  rand(2..12),
    price_per_night:  rand(25-300),
    user: User.last
  )
  # must be photos not photo as it is has_many: photos, even if uploading 1.
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/7/7d/Cabins_with_Loft.jpg")
  flat.photos.attach(io: file, filename: 'Cabins_with_Loft.jpg', content_type: 'image/jpg')
  # file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
  # flat.photos.attach(io: file, filename: 'flat.png', content_type: 'image/png')
  # file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
  # flat.photos.attach(io: file, filename: 'flat.png', content_type: 'image/png')
  flat.save!
end
puts 'Finished!'
