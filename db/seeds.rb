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

puts 'Creating 30 properties...'
30.times do
  flat = Flat.new(
    name:    "#{Faker::Books::TheKingkillerChronicle.location} Cabin",
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    description: "A #{Faker::Adjective.positive} Cabin with #{Faker::Adjective.positive} views of #{Faker::Fantasy::Tolkien.location}",
    guest_num:  rand(2..12),
    price_per_night:  rand(25-300),
    user: User.last
  )
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
  flat.photos.attach(io: file, filename: 'flat.png', content_type: 'image/png')
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
  flat.photos.attach(io: file, filename: 'flat.png', content_type: 'image/png')
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
  flat.photos.attach(io: file, filename: 'flat.png', content_type: 'image/png')
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
  flat.photos.attach(io: file, filename: 'flat.png', content_type: 'image/png')
  flat.save!
end
puts 'Finished!'

# t.string "name"
# t.string "address"
# t.text "description"
# t.integer "guest_num"
# t.integer "price_per_night"
# t.float "latitude"
# t.float "longitude"
